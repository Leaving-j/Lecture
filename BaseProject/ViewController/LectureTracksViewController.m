//
//  LectureTracksViewController.m
//  BaseProject
//
//  Created by apple-jd01 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LectureTracksViewController.h"
#import "LectureTracksViewModel.h"
#import <AVFoundation/AVFoundation.h>
@interface LectureTracksViewController ()
@property(nonatomic,strong)LectureTracksViewModel *tracksVM;
@property(nonatomic,strong)AVPlayer *player;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation LectureTracksViewController


- (LectureTracksViewModel *)tracksVM {
    if(_tracksVM == nil) {
        _tracksVM = [[LectureTracksViewModel alloc] initWithTracksId:_tracksId];
    }
    return _tracksVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//   _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//    [self.tracksVM refreshDataCompletionHandle:^(NSError *error) {
//        [self.tableView.header endRefreshing];
//        [self.tableView reloadData];
//    }];
// }];
//    [_tableView.header beginRefreshing];
   
    [self.tracksVM getDataFromNetCompleteHandle:^(NSError *error) {
        [self.tableView reloadData];
    }];
    
}

- (IBAction)play:(id)sender {
    self.player = [AVPlayer playerWithURL:[self.tracksVM playURL]];
    [self.player play];
    NSLog(@"%@",[self.tracksVM playURL]);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
