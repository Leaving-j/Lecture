//
//  LectureBookManager.m
//  BaseProject
//
//  Created by apple-jd01 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LectureBookManager.h"
#define kPageId @"page_id":@(pageId)
#define kDevice @"device":@"iPhone"
#define kVersion @"version":@"1.1.5"
@implementation LectureBookManager
+ (id)getLectureBookType:(BookType)type pageId:(NSInteger)pageId completionHandle:(void (^)(id, NSError *))completionHandle{
    NSString *path = nil;
    switch (type) {
        case BookTypeAll: {
            path = @"http://app.9nali.com/892/common_tag/14/all";
            break;
        }
        case BookTypeTeacher: {
            path = @"http://app.9nali.com/892/common_tag/14/%E5%90%8D%E5%B8%88%E7%BB%8F%E5%85%B8";
            break;
        }
        case BookTypeHistory: {
            path = @"http://app.9nali.com/892/common_tag/14/%E5%8E%86%E5%8F%B2%E4%BC%A0%E5%A5%87";
            break;
        }
        case BookTypeKing: {
            path = @"http://app.9nali.com/892/common_tag/14/%E5%B8%9D%E7%8E%8B%E5%B0%86%E7%9B%B8";
            break;
        }
        case BookTypeMan: {
            path = @"http://app.9nali.com/892/common_tag/14/%E9%A3%8E%E4%BA%91%E4%BA%BA%E7%89%A9";
            break;
        }
        case BookTypeTraditional: {
            path = @"http://app.9nali.com/892/common_tag/14/%E5%9B%BD%E5%AD%A6%E7%BB%8F%E5%85%B8";
            break;
        }
        default: {
            break;
        }
    }
    return [self GET:path parameters:@{kPageId,kDevice,kVersion} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([LectureBookModel objectWithKeyValues:responseObj],error);
    }];
}
@end
