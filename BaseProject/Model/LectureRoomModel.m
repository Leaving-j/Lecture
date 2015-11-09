//
//  LectureRoomModel.m
//  百家讲坛合集
//
//  Created by apple-jd01 on 15/11/4.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LectureRoomModel.h"

@implementation LectureRoomModel


+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [LectureRoomListModel class]};
}
@end
@implementation LectureRoomListModel

@end


