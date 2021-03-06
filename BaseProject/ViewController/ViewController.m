//
//  ViewController.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ViewController.h"
#import "LectureCell.h"
#import "LectureViewModel.h"
#import "LectureRoomViewModel.h"
#import "LectureRoomViewController.h"
#import <UITableViewCell+FlatUI.h>
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)LectureViewModel *lectureVM;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (LectureViewModel *)lectureVM{
    if (!_lectureVM) {
        _lectureVM = [LectureViewModel new];
    }
    return _lectureVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];

   _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
      [self.lectureVM refreshDataCompletionHandle:^(NSError *error) {
          if (error) {
              [self showErrorMsg:error.localizedDescription];
          }else{
             [self.tableView reloadData];
              [self.tableView.footer resetNoMoreData];
          }
          [self.tableView.header endRefreshing];
      }];
   }];
    [_tableView.header beginRefreshing];
    _tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.lectureVM getMoreDataCompletionHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error.localizedDescription];
                [self.tableView.footer endRefreshing];
            }else{
                 [self.tableView reloadData];
                if (self.lectureVM.isHasMore) {
                   [self.tableView.footer endRefreshing];
                }else{
                    [self.tableView.footer endRefreshingWithNoMoreData];
                }
            }
          
        }];
    }];
}

#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.lectureVM.rowNumber;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LectureCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
//    [cell configureFlatCellWithColor:[UIColor greenSeaColor]
//                       selectedColor:[UIColor cloudsColor]
//                     roundingCorners:UIRectCornerAllCorners];
//    
//    cell.cornerRadius = 10.0f; // optional
//    cell.separatorHeight = 20.0f; // optional
    [cell.MeIV setImageWithURL:[self.lectureVM iconURLForRow:indexPath.section] placeholderImage:[UIImage imageNamed:@"medium_head_male_default"]];
    cell.tilteLb.text = [self.lectureVM titleForRow:indexPath.section];
    cell.detailLb.text = [self.lectureVM detailForRow:indexPath.section];
    cell.albumLb.text = [self.lectureVM albumNumForRow:indexPath.section];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
//    storyboard不能用这个方法传值，傻了
/*    LectureRoomViewModel *roomVM = [[LectureRoomViewModel alloc] initWithUid:[self.lectureVM IDForRow:indexPath.section]];
    
    LectureRoomViewController *vc = [[LectureRoomViewController alloc] initWithUid:[self.lectureVM IDForRow:indexPath.section]];*/
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    LectureRoomViewController *vc = segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    vc.uid = [self.lectureVM IDForRow:indexPath.section];
}

@end
