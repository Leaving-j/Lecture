//
//  LectureAlbumsModel.h
//  百家讲坛合集
//
//  Created by apple-jd01 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class LectureAlbummodel,LectureAlbumsTracksModel,LectureAlbumsTracksListModel;
@interface LectureAlbumsModel : BaseModel

@property (nonatomic, strong) LectureAlbumsTracksModel *tracks;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) LectureAlbummodel *album;

@property (nonatomic, assign) NSInteger ret;

@end
@interface LectureAlbummodel : NSObject

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, assign) long long updatedAt;

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, assign) NSInteger playCount;

@property (nonatomic, assign) NSInteger tracks;

@property (nonatomic, copy) NSString *coverSmall;

@property (nonatomic, copy) NSString *richIntro;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *smallLogo;

@property (nonatomic, assign) NSInteger albumId;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, copy) NSString *coverLarge;

@end

@interface LectureAlbumsTracksModel : NSObject

@property (nonatomic, assign) NSInteger maxPageId;

@property (nonatomic, strong) NSArray<LectureAlbumsTracksListModel *> *list;

@property (nonatomic, assign) NSInteger totalCount;

@property (nonatomic, assign) NSInteger pageSize;

@property (nonatomic, assign) NSInteger pageId;

@end

@interface LectureAlbumsTracksListModel : NSObject

@property (nonatomic, assign) long long updatedAt;

@property (nonatomic, assign) NSInteger albumUid;

@property (nonatomic, strong) NSNumber *trackId;

@property (nonatomic, copy) NSString *coverSmall;

@property (nonatomic, copy) NSString *playUrl32;

@property (nonatomic, assign) NSInteger mp3size_64;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger mp3size_32;

@property (nonatomic, copy) NSString *playUrl64;

@property (nonatomic, assign) NSInteger albumId;

@property (nonatomic, strong) NSNumber *duration;

@property (nonatomic, copy) NSString *coverLarge;

@property (nonatomic, assign) NSInteger playtimes;

@property (nonatomic, assign) long long createdAt;

@end

