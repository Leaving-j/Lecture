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
/** AVPlayer实现播放*/
@property(nonatomic,strong)AVPlayer *player;
/** 播放按钮 */
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
/** 上一曲 */
@property (weak, nonatomic) IBOutlet UIButton *upBtn;
/** 当前播放 */
@property(nonatomic)NSInteger currentPlay;
/** 开始播放时间 */
@property(nonatomic)NSTimeInterval time;
@property(nonatomic)NSTimeInterval nowTime;
/** 定时器 */
@property(nonatomic,strong)NSTimer *timer;

@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *beginTimeLb;
@property (weak, nonatomic) IBOutlet UILabel *overTimeLb;

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
     _time = [[NSDate date] timeIntervalSince1970];
    if (_albumsArr != nil) {
        _currentPlay = _beginPlay;
        [self playBook];
        [self.player play];
    }
    [self timers];
}

- (void)timers{
    [_timer invalidate];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(playTimes) userInfo:nil repeats:YES];
    [_timer fire];
}

- (void)playTimes{
    _nowTime = 0.0;
//   当前时间
    _nowTime = [[NSDate date] timeIntervalSince1970];
    CGFloat runtimes = _nowTime - _time;
    if (runtimes < 60) {
         self.beginTimeLb.text = [NSString stringWithFormat:@"00:%02d",(int)runtimes];
    }else{
        self.beginTimeLb.text = [NSString stringWithFormat:@"%02d:%02d",(int)runtimes/60,(int)runtimes % 60];
    }
   
    
    NSMutableArray *durationArray = [NSMutableArray new];
    for (int i = 0; i < _albumsArr.count; i++) {
        LectureAlbumsTracksListModel *model = _albumsArr[i];
        [durationArray addObject:model.duration];
    }
    NSArray *durationArr = [durationArray copy];
    NSNumber *num = durationArr[_currentPlay];
    self.overTimeLb.text = [NSString stringWithFormat:@"%02ld:%02ld",num.integerValue / 60,num.integerValue % 60];
    self.slider.value =1.0 - (num.floatValue - runtimes)/num.floatValue;

}

- (IBAction)play:(id)sender {
    if (self.playBtn.selected == YES) {
        [self.player play];
    }else{
        [self.player pause];
        
        }
    self.playBtn.selected = !self.playBtn.selected;
}
- (IBAction)nextBook:(id)sender {
    [self timers];
    self.playBtn.selected = NO;
    if (_currentPlay < _albumsArr.count) {
       _currentPlay += 1;
    }
    if (_currentPlay == _albumsArr.count) {
        _currentPlay = 0;
    }
    [self playBook];
    [self.player play];
}

- (IBAction)upBook:(UIButton *)sender {
    [self timers];
    self.playBtn.selected = NO;
    if (_currentPlay == 0) {
        _currentPlay = _albumsArr.count - 1;
    }else if (_currentPlay < _albumsArr.count) {
        _currentPlay -= 1;
    }
    [self playBook];
    [self.player play];
}

- (void)playBook{
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i < _albumsArr.count; i++) {
        LectureAlbumsTracksListModel *model = _albumsArr[i];
        [arr addObject:model.playUrl64];
    }
    NSArray *tracksArr = [arr copy];
    self.player = [AVPlayer playerWithURL:[NSURL URLWithString:tracksArr[_currentPlay]]];
    
    NSMutableArray *titleArray = [NSMutableArray new];
    for (int i = 0; i < _albumsArr.count; i++) {
        LectureAlbumsTracksListModel *model = _albumsArr[i];
        [titleArray addObject:model.title];
    }
    NSArray *titleArr = [titleArray copy];
    self.titleLb.text = titleArr[_currentPlay];
    
    NSMutableArray *imageViewArray = [NSMutableArray new];
    for (int i = 0; i < _albumsArr.count; i++) {
        LectureAlbumsTracksListModel *model = _albumsArr[i];
            [imageViewArray addObject:model.coverLarge];
    }
    NSArray *coverArr = [imageViewArray copy];
    [self.imageView setImageWithURL:[NSURL URLWithString:coverArr[_currentPlay]]];
    
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






@end
