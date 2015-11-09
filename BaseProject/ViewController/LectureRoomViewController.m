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
#import "LectureAlbumsViewModel.h"
@interface LectureRoomViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *logoIV;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong) LectureRoomViewModel *roomVM;
@end

@implementation LectureRoomViewController

//- (id)initWithUid:(NSNumber *)uid{
//    if (self = [super init]) {
//        _uid = uid;
//    }
//    return self;
//}

- (LectureRoomViewModel *)roomVM{
    if (!_roomVM) {
        _roomVM = [LectureRoomViewModel new];
//        _roomVM = [[LectureRoomViewModel alloc] initWithUid:self.uid];
    }
    return _roomVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];

   _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
     [self.roomVM refreshDataCompletionHandle:^(NSError *error) {
         [self.tableView.header endRefreshing];
         [self.tableView reloadData];
     }];
 }];
     [self.tableView.header beginRefreshing];
    _tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.roomVM getMoreDataCompletionHandle:^(NSError *error) {
            [self.tableView.footer endRefreshing];
            [self.tableView reloadData];
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
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    LectureAlbumsViewModel *albumsVM = [[LectureAlbumsViewModel alloc] initWithAlbumsId:[self.roomVM albumsIdForRow:indexPath.section]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}



@end
