//
//  LectureViewModel.h
//  百家讲坛合集
//
//  Created by apple-jd01 on 15/11/4.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "LectureNetManager.h"
@interface LectureViewModel : BaseViewModel
@property(nonatomic)NSInteger rowNumber;
@property(nonatomic)NSInteger page;
/** 返回列表中某行数据的图片URL */
- (NSURL *)iconURLForRow:(NSInteger)row;
/** 返回列表中某行数据题目 */
- (NSString *)titleForRow:(NSInteger)row;
/** 返回列表中某行数据的描述 */
- (NSString *)detailForRow:(NSInteger)row;
/** 返回列表中某行数据的专辑数 */
- (NSString *)albumNumForRow:(NSInteger)row;
/** 返回列表中某行数据的ID*/
- (NSNumber *)IDForRow:(NSInteger)row;
@end
