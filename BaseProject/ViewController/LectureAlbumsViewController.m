//
//  LectureAlbumsViewController.m
//  百家讲坛合集
//
//  Created by apple-jd01 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LectureAlbumsViewController.h"
#import "LectureAlbumsCell.h"
#import "LectureAlbumsViewModel.h"
#import "LectureTracksViewController.h"
@interface LectureAlbumsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *headerIV;
@property (weak, nonatomic) IBOutlet UILabel *tracksLb;
@property (weak, nonatomic) IBOutlet UILabel *nameLb;



@property(nonatomic,strong)LectureAlbumsViewModel *albumsVM;
@end

@implementation LectureAlbumsViewController

- (id)initWithAlbumsId:(NSInteger)albumsId{
    if (self = [super init]) {
        self.albumsId = albumsId;
    }
    return self;
}

- (LectureAlbumsViewModel *)albumsVM {
    if(_albumsVM == nil) {
        _albumsVM = [[LectureAlbumsViewModel alloc] initWithAlbumsId:_albumsId];
    }
    return _albumsVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.albumsVM refreshDataCompletionHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error.localizedDescription];
            }else{
                [self.tableView reloadData];
                [self.tableView.footer resetNoMoreData];
            }
            [self.tableView.header endRefreshing];
            
        }];
    }];
    _tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
       [self.albumsVM getMoreDataCompletionHandle:^(NSError *error) {
           if (error) {
               [self showErrorMsg:error.localizedDescription];
              [self.tableView.footer endRefreshing];
           }else{
                 [self.tableView reloadData];
               if (self.albumsVM.isHasMore) {
                   [self.tableView.footer endRefreshing];
               }else{
                   [self.tableView.footer endRefreshingWithNoMoreData];
               }
           }
           
         
       }];
    }];
    [_tableView.header beginRefreshing];
}
#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.albumsVM.rowNumber;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LectureAlbumsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [cell.iconIV setImageWithURL:[self.albumsVM iconURLForRow:indexPath.section] placeholderImage:[UIImage imageNamed:@"medium_head_male_default"]];
    cell.titleLb.text = [self.albumsVM titleForRow:indexPath.section];
    cell.playLb.text = [self.albumsVM playtimesForRow:indexPath.section];
    cell.timeLb.text = [self.albumsVM durationForRow:indexPath.section];
    cell.sizeLb.text = [self.albumsVM sizeForRow:indexPath.section];
    self.title = self.albumsVM.naviTitle;
    [_headerIV setImageWithURL:[self.albumsVM headerURL]];
    _nameLb.text = self.albumsVM.headerName;
    _tracksLb.text = self.albumsVM.headerTracks;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    LectureTracksViewController *vc = segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    vc.tracksId = [self.albumsVM tracksIdForRow:indexPath.section];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
