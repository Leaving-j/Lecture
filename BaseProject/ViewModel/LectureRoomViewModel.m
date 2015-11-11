//
//  LectureRoomViewModel.m
//  百家讲坛合集
//
//  Created by apple-jd01 on 15/11/4.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LectureRoomViewModel.h"

@implementation LectureRoomViewModel

- (id)initWithUid:(NSNumber *)uid{
    if (self = [super init]) {
        self.uid =uid;
    }
    return self;
}

- (BOOL)isHasMore{
    return _maxPageId > _page;
}

- (NSInteger)rowNumber{
    return self.dataArr.count;
}

- (NSURL *)LogoURL{
    return [NSURL URLWithString:self.logo];
}

- (LectureRoomListModel *)roomList:(NSInteger)row{
    return self.dataArr[row];
}

- (NSURL *)iconURLForRow:(NSInteger)row{
    NSString *path = [self roomList:row].coverSmall;
    return [NSURL URLWithString:path];
}

- (NSString *)titleForRow:(NSInteger)row{
    return [self roomList:row].title;
}

- (NSString *)tracksForRow:(NSInteger)row{
    NSString *str = @"节目数 ";
    return [str stringByAppendingString:[self roomList:row].tracks.stringValue];
}

- (NSInteger)albumsIdForRow:(NSInteger)row{
    return [self roomList:row].albumId;
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    [LectureNetManager getLectureRoomWithPage:_page uid:_uid completionHandle:^(LectureRoomModel *model, NSError *error) {
        if (_page == 1) {
            [self.dataArr removeAllObjects];
        }
        _logo = model.largeLogo;
        _maxPageId = model.maxPageId;
        _nickName = model.nickname;
         [self.dataArr addObjectsFromArray:model.list];
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
