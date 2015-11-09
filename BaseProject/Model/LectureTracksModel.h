//
//  LectureTracksModel.h
//  BaseProject
//
//  Created by apple-jd01 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface LectureTracksModel : BaseModel

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, copy) NSString *trackId;

@property (nonatomic, copy) NSString *lyric;

@property (nonatomic, copy) NSString *playUrl32;

@property (nonatomic, assign) NSInteger ret;

@property (nonatomic, copy) NSString *coverSmall;

@property (nonatomic, assign) NSInteger mp3size_64;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger mp3size_32;

@property (nonatomic, copy) NSString *playUrl64;

@property (nonatomic, assign) NSInteger duration;

@property (nonatomic, assign) NSInteger playtimes;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, copy) NSString *coverLarge;

@property (nonatomic, copy) NSString *rich_intro;

@end
