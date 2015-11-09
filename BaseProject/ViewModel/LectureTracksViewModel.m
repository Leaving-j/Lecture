//
//  LectureTracksViewModel.m
//  BaseProject
//
//  Created by apple-jd01 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LectureTracksViewModel.h"

static NSNumber *tracksID;

@implementation LectureTracksViewModel

- (id)initWithTracksId:(NSNumber *)tracksId{
    if (self = [super init]) {
       tracksID = tracksId;
     NSLog(@"tracksID%@",tracksID);
    }
    return self;
}

- (LectureTracksModel *)tracks {
    if(_tracks == nil) {
        _tracks = [[LectureTracksModel alloc] init];
    }
    return _tracks;
}
- (NSString *)title{
    return _tracks.title;
}
- (NSString *)playtimes{
    return [NSString stringWithFormat:@"%ld",_tracks.playtimes];
}
- (NSString *)durations{
    NSInteger time = _tracks.duration;
    return [[NSString stringWithFormat:@"%ld",time / 60] stringByAppendingString:   [NSString stringWithFormat:@":%ld",time % 60]];
 
}
- (NSString *)size{
    CGFloat size = _tracks.mp3size_64;
    return [NSString stringWithFormat:@"%.1lf",size/1024/1024];

}
- (NSURL *)LogoURL{
    NSString *path = _tracks.coverLarge;
    return [NSURL URLWithString:path];
}
- (NSURL *)playURL{
    NSString *path = _tracks.playUrl32;
    return [NSURL URLWithString:path];
}
- (NSString *)detail{
    return _tracks.rich_intro;
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [LectureNetManager getLectureWithTracksId:tracksID completionHandle:^(LectureTracksModel *model, NSError *error) {
        _tracks = model;
//         NSLog(@"ID:%@",tracksID);
        completionHandle(error);
    }];
}

- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    [self getDataFromNetCompleteHandle:completionHandle];
}

@end
