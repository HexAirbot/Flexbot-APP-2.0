//
//  LibraryViewController.m
//  HexAirBot
//
//  Created by HHH on 15/10/30.
//  Copyright © 2015年 airbot. All rights reserved.
//

#import "LibraryViewController.h"
#import <MWPhotoBrowser.h>
@interface LibraryViewController ()

@property(nonatomic,strong) NSMutableArray *photos;

@property(nonatomic,strong) NSMutableArray *thumbs;

@property(nonatomic,strong) NSMutableArray *selections;

@property(nonatomic,strong) MWPhotoBrowser *browser;

@property(nonatomic,strong) UISegmentedControl *segment;

@end

@implementation LibraryViewController

-(NSMutableArray *)photos
{
    if (!_photos) {
        _photos=[[NSMutableArray alloc]initWithCapacity:0];
    }
    return _photos;
}
-(NSMutableArray *)thumbs
{
    if (!_thumbs) {
        _thumbs=[[NSMutableArray alloc]initWithCapacity:0];
    }
    return _thumbs;
}
-(NSMutableArray *)selections
{
    if (!_selections) {
        _selections=[[NSMutableArray alloc]initWithCapacity:0];
        for (int i=0; i<_photos.count; i++) {
            [_selections addObject:[NSNumber numberWithBool:NO]];
        }
    }
    return _selections;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *path=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *root=[[path componentsSeparatedByString:@"/Library"] objectAtIndex:0];
        
        NSString *path1=[path stringByAppendingPathComponent:@"Photo"];
        NSString *path2=[path stringByAppendingPathComponent:@"Video"];
        NSString *photoPath=[NSString stringWithFormat:@"%@/Desktop/HexAirBot/Album/Photo",root];
        NSString *videoPath=[NSString stringWithFormat:@"%@/Desktop/HexAirBot/Album/Video",root];
        [[NSFileManager defaultManager]copyItemAtPath:photoPath toPath:path1 error:nil];
        [[NSFileManager defaultManager]copyItemAtPath:videoPath toPath:path2 error:nil];
        NSLog(@"沙盒路径 %@",path);
    });
    _segment=[[UISegmentedControl alloc]initWithItems:@[@"相片",@"录像"]];
    _segment.selectedSegmentIndex=0;
    _segment.frame=CGRectMake(5, 10, self.view.frame.size.width-10, 30);
    _segment.tintColor=[UIColor whiteColor];
    [_segment addTarget:self action:@selector(segementChange) forControlEvents:UIControlEventValueChanged];
    //self.navigationController.navigationBar.alpha=0;
    [self.navigationController.navigationBar addSubview:_segment];
    self.navigationItem.title=@"";
    [self loadAlbumData:YES];
    [self createBrowser];
}
-(void)loadAlbumData:(BOOL)isPhotoData
{
    NSString *documentsPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *path=isPhotoData?[documentsPath stringByAppendingPathComponent:@"Photo"]:[documentsPath stringByAppendingPathComponent:@"Video"];
    NSArray *photoArray=[[NSFileManager defaultManager]contentsOfDirectoryAtPath:path error:nil];
    if (isPhotoData) {
        for (NSString *file in photoArray) {
            if ([file hasSuffix:@".jpg"]) {
                NSString *string=[NSString stringWithFormat:@"%@/%@",path,file];
                MWPhoto *photo=[MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:string]];
                photo.photoPath=string;
                [self.photos addObject:photo];
                [self.thumbs addObject:photo];
            }
        }
    }
    else{
        for (NSString *file in photoArray) {
            if ([file hasSuffix:@".mp4"]) {
                NSString *fileName=[[file componentsSeparatedByString:@"."]objectAtIndex:0];
                NSString *string=[NSString stringWithFormat:@"%@/%@_thumb.jpg",path,fileName];
                MWPhoto *photo=[MWPhoto photoWithImage:[UIImage imageWithContentsOfFile:string]];
                photo.photoPath=string;
                photo.videoURL=[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@.mp4",path,fileName]];;
                photo.isVideo=YES;
                [self.photos addObject:photo];
                [self.thumbs addObject:photo];
            }
        }
    }
}
-(void)createBrowser
{
    _browser=[[MWPhotoBrowser alloc]initWithDelegate:self];
    _browser.displayActionButton = YES;
    _browser.displayNavArrows = NO;
    _browser.displaySelectionButtons = YES;
    _browser.alwaysShowControls = NO;
    _browser.zoomPhotosToFill = NO;
    _browser.enableGrid = NO;
    _browser.startOnGrid = YES;
    _browser.autoPlayOnAppear=YES;
    [_browser showNextPhotoAnimated:YES];
    [_browser showPreviousPhotoAnimated:YES];
    [_browser setCurrentPhotoIndex:0];
    [self.navigationController addChildViewController:_browser];
}
#pragma mark - MWPhotoBrowserDelegate
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser
{
    return self.photos.count;
}
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index
{
    if (self.photos.count>index) {
        return [self.photos objectAtIndex:index];
    }
    return nil;
}
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser thumbPhotoAtIndex:(NSUInteger)index {
    if (self.thumbs.count > index) {
        return [self.thumbs objectAtIndex:index];
    }
    return nil;
}
- (BOOL)photoBrowser:(MWPhotoBrowser *)photoBrowser isPhotoSelectedAtIndex:(NSUInteger)index {
    if (self.selections.count) {
        return [[self.selections objectAtIndex:index] boolValue];
    }
    return NO;
}

- (void)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index selectedChanged:(BOOL)selected {
    if (self.selections.count) {
        [self.selections replaceObjectAtIndex:index withObject:[NSNumber numberWithBool:selected]];
        NSLog(@"Photo at index %lu selected %@", (unsigned long)index, selected ? @"YES" : @"NO");
    }
}
- (void)deletePhotosWithIndexes:(NSIndexSet *)indexes
{
    NSArray *photos=[self.photos objectsAtIndexes:indexes];
    dispatch_async(dispatch_queue_create("Delete files", NULL), ^{
        for (MWPhoto *photo in photos) {
            NSString *path = photo.photoPath;
            [[NSFileManager defaultManager]removeItemAtPath:path error:nil];
            if (photo.isVideo) {
                [[NSFileManager defaultManager]removeItemAtURL:photo.videoURL error:nil];
            }
        }
    });
}
-(void)photoBrowser:(MWPhotoBrowser *)photoBrowser deletePhotosAtIndexes:(NSIndexSet *)indexes
{
    [self deletePhotosWithIndexes:indexes];
    [self.photos removeObjectsAtIndexes:indexes];
    [self.thumbs removeObjectsAtIndexes:indexes];
    [self.selections removeObjectsAtIndexes:indexes];
    [self.browser reloadData];
}
-(void)photoBrowser:(MWPhotoBrowser *)photoBrowser savePhotosAtIndexes:(NSIndexSet *)indexes
{
    __block PHAssetCollection *flexbot=[self isContainFlexAlbum];
    if (!flexbot) {
        [[PHPhotoLibrary sharedPhotoLibrary]performChanges:^{
            PHAssetCollectionChangeRequest *createSubAlbumRequest=[PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:@"Flexbot"];
            PHObjectPlaceholder *albumPlaceholder=[createSubAlbumRequest placeholderForCreatedAssetCollection];
            PHCollectionListChangeRequest *folderChangeRequest=[[PHCollectionListChangeRequest alloc]init];
            [folderChangeRequest addChildCollections:@[albumPlaceholder]];
        } completionHandler:^(BOOL success, NSError * _Nullable error) {
            flexbot=[self isContainFlexAlbum];
        }];
    }
    NSArray *photos =[self.photos objectsAtIndexes:indexes];
    for (MWPhoto *photo in photos) {
        
        [[PHPhotoLibrary sharedPhotoLibrary]performChanges:^{
            PHAssetChangeRequest *createAssetRequest=nil;
            if (photo.isVideo) {
                createAssetRequest=[PHAssetChangeRequest creationRequestForAssetFromVideoAtFileURL:photo.videoURL];
            }
            else{
                createAssetRequest=[PHAssetChangeRequest creationRequestForAssetFromImageAtFileURL:[NSURL URLWithString:photo.photoPath]];
            }
            PHObjectPlaceholder *assetPlaceholder=createAssetRequest.placeholderForCreatedAsset;
            PHAssetCollectionChangeRequest *albumChangeRequest=[PHAssetCollectionChangeRequest changeRequestForAssetCollection:flexbot];
            [albumChangeRequest addAssets:@[assetPlaceholder]];
        } completionHandler:^(BOOL success, NSError * _Nullable error) {
            
        }];
    }
}
-(PHAssetCollection *)isContainFlexAlbum
{
    PHAssetCollection *flexbot=nil;
    PHFetchResult *userAlbums=[PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    for (NSInteger i=0; i<userAlbums.count; i++) {
        PHCollection *collection=userAlbums[i];
        if ([collection.localizedTitle isEqualToString:@"Flexbot"]) {
            flexbot=(PHAssetCollection *)collection;
            return flexbot;
        }
    }
    return nil;
}
#pragma mark -segement
-(void)segementChange
{
    [self.photos removeAllObjects];
    [self.thumbs removeAllObjects];
    [self.selections removeAllObjects];
    _selections=nil;
    if(_segment.selectedSegmentIndex==0) {
        [self loadAlbumData:YES];
        [_browser reloadData];
    }
    else if (_segment.selectedSegmentIndex==1){
        [self loadAlbumData:NO];
        [_browser reloadData];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
