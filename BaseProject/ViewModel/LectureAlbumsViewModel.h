//
//  LectureAlbumsViewModel.h
//  百家讲坛合集
//
//  Created by apple-jd01 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "LectureNetManager.h"
@interface LectureAlbumsViewModel : BaseViewModel
/** 多少行 */
@property(nonatomic)NSInteger rowNumber;
/** 当前页数 */
@property(nonatomic)NSInteger page;
/** 最大页数 */
@property(nonatomic)NSInteger maxPageId;
/** 是否有更多页*/
@property(nonatomic, getter=isHasMore)BOOL isHasMore;
/** 导航栏题目 */
@property(nonatomic,strong)NSString *naviTitle;
/** 返回列表中某行数据的图片 */
- (NSURL *)iconURLForRow:(NSInteger)row;
/** 返回列表中某行数据的题目 */
- (NSString *)titleForRow:(NSInteger)row;
/** 返回列表中某行数据的播放次数 */
- (NSString *)playtimesForRow:(NSInteger)row;
/** 返回列表中某行数据的播放时长 */
- (NSString *)durationForRow:(NSInteger)row;
/** 返回列表中某行数据的大小 */
- (NSString *)sizeForRow:(NSInteger)row;

/** 获取albumsId*/
- (id)initWithAlbumsId:(NSInteger)albumsId;
@property(nonatomic)NSInteger albumsId;

/** 返回列表中某行数据的tracksId */
- (NSNumber *)tracksIdForRow:(NSInteger)row;

@end
