//
//  LectureBookCell.m
//  BaseProject
//
//  Created by apple-jd01 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LectureBookCell.h"

@implementation LectureBookCell
- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.left.mas_equalTo(0);
            make.bottom.mas_equalTo(self.titleLb.mas_top).mas_equalTo(-5);
        }];
    }
    return _iconIV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont boldSystemFontOfSize:17];
        _titleLb.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.left.bottom.mas_equalTo(0);
            make.height.mas_equalTo(25);
        }];
    }
    return _titleLb;
}
//- (UIView *)view {
//    if(_view == nil) {
//        _view = [[UIView alloc] init];
//        _view.backgroundColor = [UIColor blackColor];
//        _view.alpha = 0.1;
//        [self.iconIV addSubview:_view];
//        [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.left.right.mas_equalTo(0);
//            make.height.mas_equalTo(40);
//        }];
//    }
//    return _view;
//}
//
//- (UILabel *)playLb {
//    if(_playLb == nil) {
//        _playLb = [[UILabel alloc] init];
//        _playLb.font = [UIFont systemFontOfSize:10];
//        _playLb.textColor = [UIColor whiteColor];
//        [_view addSubview:_playLb];
//       
//    }
//    return _playLb;
//}
//
//- (UIImageView *)playIV {
//    if(_playIV == nil) {
//        _playIV = [[UIImageView alloc] init];
//        _playIV.image = [UIImage imageNamed:@"np_title_playtimes"];
//        [_view addSubview:_playIV];
//    [self.playIV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(15, 15));
//        make.left.mas_equalTo(10);
//        make.centerY.mas_equalTo(0);
//    }];
//    }
//    return _playIV;
//}

@end
