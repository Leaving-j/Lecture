//
//  LectureModel.h
//  BaseProject
//
//  Created by apple-jd01 on 15/11/4.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class LectureListModel;
@interface LectureModel : BaseModel

@property (nonatomic, assign) NSInteger pageSize;

@property (nonatomic, assign) NSInteger pageId;

@property (nonatomic, assign) NSInteger totalCount;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, assign) NSInteger maxPageId;

@property (nonatomic, strong) NSArray<LectureListModel *> *list;

@property (nonatomic, assign) NSInteger ret;

@end

@interface LectureListModel : BaseModel

@property (nonatomic, strong) NSNumber *albums;

@property (nonatomic, strong) NSNumber *uid;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, copy) NSString *mediumLogo;

@property (nonatomic, copy) NSString *personDescribe;

@end

