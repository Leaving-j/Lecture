//
//  LectureTracksViewModel.h
//  BaseProject
//
//  Created by apple-jd01 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "LectureNetManager.h"
@interface LectureTracksViewModel : BaseViewModel
@property(nonatomic,strong)LectureTracksModel *tracks;

- (id)initWithTracksId:(NSNumber *)tracksId;

- (NSString *)title;
- (NSString *)playtimes;
- (NSString *)durations;
- (NSString *)size;
- (NSURL *)LogoURL;
- (NSURL *)playURL;
- (NSString *)detail;

@end
