//
//  LectureBookModel.h
//  BaseProject
//
//  Created by apple-jd01 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class LectureBookListModel;
@interface LectureBookModel : BaseModel

@property (nonatomic, assign) NSInteger pageSize;

@property (nonatomic, assign) NSInteger totalCount;

@property (nonatomic, assign) BOOL selected_switch;

@property (nonatomic, assign) NSInteger maxPageId;

@property (nonatomic, assign) BOOL finishedSwitch;

@property (nonatomic, assign) NSInteger ret;

@property (nonatomic, strong) NSArray<LectureBookListModel *> *list;

@end
@interface LectureBookListModel : NSObject

@property (nonatomic, copy) NSString *coverSmall;

@property (nonatomic, assign) NSInteger finished;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, assign) NSInteger plays_counts;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger tracks_counts;

@property (nonatomic, assign) BOOL selected;

@property (nonatomic, assign) long long updatedAt;

@property (nonatomic, copy) NSString *coverLarge;

@end

