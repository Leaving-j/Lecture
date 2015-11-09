//
//  LectureBookViewModel.m
//  BaseProject
//
//  Created by apple-jd01 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LectureBookViewModel.h"

@implementation LectureBookViewModel

- (id)initWithBookType:(BookType)type{
    if (self = [super init]) {
        _type = type;
    }
    return self;
}

- (NSInteger)rowNumber{
    return self.dataArr.count;
}

- (LectureBookListModel *)bookListIndexPath:(NSIndexPath *)indexPath{
    return self.dataArr[indexPath.row];
}

- (NSURL *)iconURLWithIndexPath:(NSIndexPath *)indexPath{
    NSString *path = [self bookListIndexPath:indexPath].coverLarge;
    return [NSURL URLWithString:path];
}

- (NSString *)titleWithIndexPath:(NSIndexPath *)indexPath{
    return [self bookListIndexPath:indexPath].title;
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [LectureBookManager getLectureBookType:BookTypeAll pageId:_page completionHandle:^(LectureBookModel *model, NSError *error) {
        if (_page == 1) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.list];
        
        completionHandle(error);
    }];
}

- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _page = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}

- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _page += 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
@end