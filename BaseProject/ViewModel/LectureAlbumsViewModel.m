//
//  LectureAlbumsViewModel.m
//  百家讲坛合集
//
//  Created by apple-jd01 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LectureAlbumsViewModel.h"

@implementation LectureAlbumsViewModel

- (id)initWithAlbumsId:(NSInteger)albumsId{
    if (self = [super init]) {
        self.albumsId = albumsId;
    }
    return self;
}
- (NSURL *)headerURL{
    return _headerURL;
}
- (NSInteger)rowNumber{
    return self.dataArr.count;
}

- (BOOL)isHasMore{
    return _maxPageId > _page;
}

- (LectureAlbumsTracksListModel *)albumsForRow:(NSInteger)row{
    return self.dataArr[row];
}

- (NSURL *)iconURLForRow:(NSInteger)row{
    NSString *path = [self albumsForRow:row].coverLarge;
    return [NSURL URLWithString:path];
}
- (NSString *)titleForRow:(NSInteger)row{
    return [self albumsForRow:row].title;
}
- (NSString *)playtimesForRow:(NSInteger)row{
    NSInteger playtiems = [self albumsForRow:row].playtimes;
    return [NSString stringWithFormat:@"%ld",playtiems];
    
}
- (NSString *)durationForRow:(NSInteger)row{
/** 转换为形如 37:21 的形式*/
    NSInteger time = [self albumsForRow:row].duration.integerValue;
    return [[NSString stringWithFormat:@"%ld",time / 60] stringByAppendingString:   [NSString stringWithFormat:@":%ld",time % 60]];
}
- (NSString *)sizeForRow:(NSInteger)row{
/**转换为形如 17.1M 形式*/
    CGFloat size = (float)[self albumsForRow:row].mp3size_64;
    return [NSString stringWithFormat:@"%.1lf",size/1024/1024];
}


- (NSNumber *)tracksIdForRow:(NSInteger)row{
    return [self albumsForRow:row].trackId;
}



- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [LectureNetManager getLectureAlbumsWithPage:_page albumId:_albumsId completionHandle:^(LectureAlbumsModel *model, NSError *error) {
        if (_page == 1) {
            [self.dataArr removeAllObjects];
        }
        _maxPageId = model.tracks.maxPageId;
        _naviTitle = model.album.title;
        _headerURL = [NSURL URLWithString:model.album.smallLogo];
        _headerName = model.album.nickname;
        _headerTracks =[NSString stringWithFormat:@"节目数: %@", @(model.album.tracks).stringValue];
        [self.dataArr addObjectsFromArray:model.tracks.list];
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
