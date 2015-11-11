//
//  LectureRoomViewController.m
//  百家讲坛合集
//
//  Created by apple-jd01 on 15/11/4.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LectureRoomViewController.h"
#import "LectureRoomViewModel.h"
#import "LectureRoomCell.h"
#import "LectureAlbumsViewController.h"
@interface LectureRoomViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *logoIV;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong) LectureRoomViewModel *roomVM;
@end

@implementation LectureRoomViewController

- (LectureRoomViewModel *)roomVM{
    if (!_roomVM) {
        _roomVM = [LectureRoomViewModel new];
        _roomVM = [[LectureRoomViewModel alloc] initWithUid:_uid];
    }
    return _roomVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.roomVM refreshDataCompletionHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error.localizedDescription];
            }else{
                [self.tableView reloadData];
                [self.tableView.footer resetNoMoreData];
            }
            [self.tableView.header endRefreshing];
            
        }];
    }];
    [self.tableView.header beginRefreshing];
    
    _tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.roomVM getMoreDataCompletionHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error.localizedDescription];
                [self.tableView.footer endRefreshing];
            }else{
                [self.tableView reloadData];
                if (self.roomVM.isHasMore) {
                    [self.tableView.footer endRefreshing];
                }else{
                    [self.tableView.footer endRefreshingWithNoMoreData];
                }
            }
        }];
    }];
    
}

#pragma mark - UITabelViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.roomVM.rowNumber;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LectureRoomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [_logoIV setImageWithURL:[self.roomVM LogoURL] placeholderImage:[UIImage imageNamed:@"me"]];
    [cell.iconIV setImageWithURL:[self.roomVM iconURLForRow:indexPath.section] placeholderImage:[UIImage imageNamed:@"medium_head_male_default"]];
    cell.titleLb.text = [self.roomVM titleForRow:indexPath.section];
    cell.tracksLb.text = [self.roomVM tracksForRow:indexPath.section];
//    [cell configureFlatCellWithColor:[UIColor whiteColor]
//                       selectedColor:[UIColor cloudsColor]
//                     roundingCorners:UIRectCornerAllCorners];
//    
//    cell.cornerRadius = 5.0f; // optional
//    cell.separatorHeight = 2.0f; // optional
//    self.title = [self.roomVM titleForRow:indexPath.section];
    self.title = self.roomVM.nickName;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
 
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    LectureAlbumsViewController *vc = segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    vc.albumsId = [self.roomVM albumsIdForRow:indexPath.section];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


@end
