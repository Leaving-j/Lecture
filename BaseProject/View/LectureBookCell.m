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
            make.height.mas_equalTo(170);
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
            make.top.mas_equalTo(self.iconIV.mas_bottom).mas_equalTo(-10);
        }];
    }
    return _titleLb;
}

- (UILabel *)playLb {
    if(_playLb == nil) {
        _playLb = [[UILabel alloc] init];
        _playLb.font = [UIFont systemFontOfSize:10];
        _playLb.textColor = [UIColor whiteColor];
        [_playLb addSubview:_iconIV];
        [_playLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
//            make.left.mas_equalTo(self.playIV.mas_right).mas_equalTo(10);
        }];
    }
    return _playLb;
}

- (UIImageView *)playIV {
    if(_playIV == nil) {
        _playIV = [[UIImageView alloc] init];
        _playIV.image = [UIImage imageNamed:@"np_title_playtimes"];
        [_playIV addSubview:_iconIV];
//       [_playIV mas_makeConstraints:^(MASConstraintMaker *make) {
//           make.size.mas_equalTo(CGSizeMake(7, 9));
//           make.top.left.mas_equalTo(10);
//          
//       }];
    }
    return _playIV;
}

@end
