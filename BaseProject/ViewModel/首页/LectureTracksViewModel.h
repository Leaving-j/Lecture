//
//  LectureTracksViewModel.h
//  BaseProject
//
//  Created by apple-jd01 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "LectureNetManager.h"
@interface LectureTracksViewModel : BaseViewModel
@property(nonatomic,strong)LectureTracksModel *tracks;
/** 特定方式初始化获取该页ID*/
- (id)initWithTracksId:(NSNumber *)tracksId;
@property(nonatomic,strong)NSNumber *tracksId;
/** 标题 */
- (NSString *)title;
/** 播放数 */
- (NSString *)playtimes;
/** 播放时长 */
- (NSString *)durations;
/** 文件大小 */
- (NSString *)size;
/** 图片地址 */
- (NSURL *)LogoURL;
/** 播放地址 */
- (NSURL *)playURL;
/** 详情 */
- (NSString *)detail;

@end
