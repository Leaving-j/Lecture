//
//  LectureNetManager.m
//  BaseProject
//
//  Created by apple-jd01 on 15/11/4.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LectureNetManager.h"
#define kHomePath @"http://app.9nali.com/index/892"
#define kRoomPath @"http://app.9nali.com/892/bozhus/%@"
#define kAlbumPath @"http://app.9nali.com/892/albums/%ld"
#define kTracksPath @"http://app.9nali.com/892/tracks/%@"
#define kDevice @"device":@"iPhone"
#define kVersion @"version":@"1.1.5"
#define kPageId @"page_id":@(page)
/*
 kHomePath 宏定义的路径
 网络请求
 */

@implementation LectureNetManager
+ (id)getLectureWithPage:(NSInteger)page completionHandle:(void (^)(id, NSError *))completionHandle{
    NSDictionary *params = @{kPageId,kDevice,kVersion};
    return [self GET:kHomePath parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([LectureModel objectWithKeyValues:responseObj],error);
    }];

}


+ (id)getLectureRoomWithPage:(NSInteger)page uid:(NSNumber *)uid completionHandle:(void (^)(id, NSError *))completionHandle{
    NSString *path = [NSString stringWithFormat:kRoomPath,uid];
    NSDictionary *params = @{kPageId,kDevice,kVersion};
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([LectureRoomModel objectWithKeyValues:responseObj],error);
    }];
}

+ (id)getLectureAlbumsWithPage:(NSInteger)page albumId:(NSInteger)albumId completionHandle:(void (^)(id, NSError *))completionHandle{
    NSString *path = [NSString stringWithFormat:kAlbumPath,albumId];
    NSDictionary *params = @{kPageId,@"isAsc":@"true",kDevice,kVersion};
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([LectureAlbumsModel objectWithKeyValues:responseObj],error);
    }];
}

+ (id)getLectureWithTracksId:(NSNumber *)tracksId completionHandle:(void (^)(id, NSError *))completionHandle{
    NSString *path = [NSString stringWithFormat:kTracksPath,tracksId];
    return [self GET:path parameters:@{kDevice,kVersion} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([LectureTracksModel objectWithKeyValues:responseObj],error);
    }];
}

@end
