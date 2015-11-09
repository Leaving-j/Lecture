//
//  LectureRoomModel.h
//  百家讲坛合集
//
//  Created by apple-jd01 on 15/11/4.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class LectureRoomListModel;
@interface LectureRoomModel : BaseModel

@property (nonatomic, strong) NSNumber *uid;

@property (nonatomic, assign) NSInteger totalCount;

@property (nonatomic, copy) NSString *largeLogo;

@property (nonatomic, assign) NSInteger pageId;

@property (nonatomic, assign) NSInteger ret;

@property (nonatomic, copy) NSString *smallLogo;

@property (nonatomic, assign) NSInteger maxPageId;

@property (nonatomic, strong) NSArray<LectureRoomListModel *> *list;

@property (nonatomic, copy) NSString *personalSignature;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, assign) NSInteger pageSize;

@end
@interface LectureRoomListModel : NSObject

@property (nonatomic,strong) NSNumber *tracks;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger albumId;

@property (nonatomic, copy) NSString *coverSmall;

@property (nonatomic, assign) long long updatedAt;

@property (nonatomic, assign) NSInteger finished;

@end

