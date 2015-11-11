//
//  LectureViewModel.m
//  百家讲坛合集
//
//  Created by apple-jd01 on 15/11/4.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LectureViewModel.h"

@implementation LectureViewModel
- (NSInteger)rowNumber{
    return self.dataArr.count;
}
- (LectureListModel *)listModelForRow:(NSInteger)row{
    return self.dataArr[row];
}
- (NSURL *)iconURLForRow:(NSInteger)row{
    NSString *path = [self listModelForRow:row].mediumLogo;
    return [NSURL URLWithString:path];
}
- (NSString *)titleForRow:(NSInteger)row{
    return [self listModelForRow:row].nickname;
}
- (NSString *)detailForRow:(NSInteger)row{
    return [self listModelForRow:row].personDescribe;
}
- (NSString *)albumNumForRow:(NSInteger)row{
    NSString *str = @"专辑数";
    return [str stringByAppendingString:[self listModelForRow:row].albums.stringValue ];
}

- (NSNumber *)IDForRow:(NSInteger)row{
    return [self listModelForRow:row].uid;
}

- (BOOL)isHasMore{
    return _maxPageId > _page;
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    [LectureNetManager getLectureWithPage:_page completionHandle:^(LectureModel *model, NSError *error) {
        if (_page == 1) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.list];
        _maxPageId = model.maxPageId;
        completionHandle(error);
    }];
}

- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _page = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    if (self.isHasMore) {
        _page += 1;
        [self getDataFromNetCompleteHandle:completionHandle];
    }else{
        NSError *error = [NSError errorWithDomain:@"" code:999 userInfo:@{NSLocalizedDescriptionKey:@"没有更多数据！"}];
        completionHandle(error);
    }
}
@end
