//
//  LectureBookViewController.m
//  BaseProject
//
//  Created by apple-jd01 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LectureBookViewController.h"
#import "LectureBookCell.h"
#import "LectureAlbumsViewController.h"
@interface LectureBookViewController ()<UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)LectureBookViewModel *bookVM;
@end

@implementation LectureBookViewController

- (LectureBookViewModel *)bookVM{
    if (!_bookVM) {
        _bookVM = [[LectureBookViewModel alloc] initWithBookType:_type];
    }
    return _bookVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _naviTitle;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       [self.bookVM refreshDataCompletionHandle:^(NSError *error) {
           if (error) {
               [self showErrorMsg:error.localizedDescription];
           }else{
                [self.collectionView reloadData];
               [self.collectionView.footer resetNoMoreData];
           }
           [self.collectionView.header endRefreshing];
          
       }];
    }];
    self.collectionView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
       [self.bookVM getMoreDataCompletionHandle:^(NSError *error) {
           if (error) {
               [self showErrorMsg:error.localizedDescription];
               [self.collectionView.footer endRefreshing];
           }else{
                [self.collectionView reloadData];
               if (self.bookVM.isHasMore) {
                   [self.collectionView.footer endRefreshing];
               }else{
                   [self.collectionView.footer endRefreshingWithNoMoreData];
               }
           }
           
          
       }];
    }];
    [self.collectionView.header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.bookVM.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LectureBookCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.nameLb.text = [self.bookVM titleWithIndexPath:indexPath];
    [cell.imageIV setImageWithURL:[self.bookVM iconURLWithIndexPath:indexPath] placeholderImage:[UIImage imageNamed:@"me"]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    LectureAlbumsViewController *vc = [segue destinationViewController];
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:sender];
    vc.albumsId = [self.bookVM albumsIdWithIndexPath:indexPath];
}

#pragma mark <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (kWindowW - 3*10)/2;
    CGFloat height = width * 365 / 220;
    return CGSizeMake(width, height);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}



#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
