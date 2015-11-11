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
/** 当前页数 */
@property(nonatomic)NSInteger page;
/** 最大页数 */
@property(nonatomic)NSInteger maxPageId;
/** 导航栏题目*/
@property(nonatomic, strong)NSString *nickName;
/** 简介 */
@property(nonatomic,strong)NSString *signature;
/** 是否有更多页*/
@property(nonatomic, getter=isHasMore)BOOL isHasMore;
/** 返回头部图片的URL*/
- (NSURL *)LogoURL;
/** 返回列表中某行数据的图片URL */
- (NSURL *)iconURLForRow:(NSInteger)row;
/** 返回列表中某行数据题目 */
- (NSString *)titleForRow:(NSInteger)row;
/** 返回列表中某行数据的节目数*/
- (NSString *)tracksForRow:(NSInteger)row;
/** 特殊的初始化方法，初始Uid*/
- (id)initWithUid:(NSNumber *)uid;
@property(nonatomic,strong)NSNumber *uid;

@property(nonatomic,strong)NSString *logo;
/** 返回列表中某行数据的albumsId*/
- (NSInteger)albumsIdForRow:(NSInteger)row;
@end


