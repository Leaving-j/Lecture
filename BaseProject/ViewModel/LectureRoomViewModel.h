//
//  LectureRoomViewModel.h
//  百家讲坛合集
//
//  Created by apple-jd01 on 15/11/4.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "LectureNetManager.h"
@interface LectureRoomViewModel : BaseViewModel
/** 有多少行*/
@property(nonatomic)NSInteger rowNumber;
@property(nonatomic)NSInteger page;
/** 返回头部图片的URL*/
- (NSURL *)LogoURL;
/** 返回列表中某行数据的图片URL */
- (NSURL *)iconURLForRow:(NSInteger)row;
/** 返回列表中某行数据题目 */
- (NSString *)titleForRow:(NSInteger)row;
/** 返回列表中某行数据的节目数*/
- (NSString *)tracksForRow:(NSInteger)row;

- (id)initWithUid:(NSNumber *)uid;
@property(nonatomic,strong)NSNumber *uid;

@property(nonatomic,strong)NSString *logo;
/** 返回列表中某行数据的albumsId*/
- (NSInteger)albumsIdForRow:(NSInteger)row;
@end


