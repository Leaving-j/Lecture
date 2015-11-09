//
//  LectureBookViewModel.h
//  BaseProject
//
//  Created by apple-jd01 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "LectureBookManager.h"
@interface LectureBookViewModel : BaseViewModel
- (id)initWithBookType:(BookType)type;
@property(nonatomic)BookType type;
@property(nonatomic)NSInteger page;
@property(nonatomic)NSInteger rowNumber;
/** 返回对应下标的图片*/
- (NSURL *)iconURLWithIndexPath:(NSIndexPath *)indexPath;
/** 返回对应下标的题目*/
- (NSString *)titleWithIndexPath:(NSIndexPath *)indexPath;
/** 返回对应下标的播放数*/
- (NSString *)playNumWithIndexPath:(NSIndexPath *)indexPath;
@end
