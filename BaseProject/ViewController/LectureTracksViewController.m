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
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (weak, nonatomic) IBOutlet UIButton *upBtn;
/** 当前播放 */
@property(nonatomic)NSInteger currentPlay;
@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UISlider *slider;

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
    if (_albumsArr != nil) {
        _currentPlay = _beginPlay;
        [self playBook];
        [self.player play];
    }
}

- (IBAction)play:(id)sender {
    if (self.playBtn.selected == YES) {
        [self.player play];
        NSLog(@"if:%d",self.playBtn.selected);
    }else{
        [self.player pause];
           NSLog(@"else:%d",self.playBtn.selected);
        }
    self.playBtn.selected = !self.playBtn.selected;
}
- (IBAction)nextBook:(id)sender {
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
    
    NSMutableArray *durationArray = [NSMutableArray new];
    for (int i = 0; i < _albumsArr.count; i++) {
        LectureAlbumsTracksListModel *model = _albumsArr[i];
        [durationArray addObject:model.duration];
    }
    NSArray *durationArr = [durationArray copy];
     NSLog(@"durationarr:%@",durationArr);
    NSNumber *num = durationArr[_currentPlay];
    self.slider.value = num.floatValue;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






@end
