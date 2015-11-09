//
//  LectureBookModel.m
//  BaseProject
//
//  Created by apple-jd01 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LectureBookModel.h"

@implementation LectureBookModel


+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [LectureBookListModel class]};
}
@end
@implementation LectureBookListModel

+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}
@end


