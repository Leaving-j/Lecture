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
@property(nonatomic)NSInteger rowNumber;
@property(nonatomic)NSInteger page;

- (NSURL *)iconURLForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)playtimesForRow:(NSInteger)row;
- (NSString *)durationForRow:(NSInteger)row;
- (NSString *)sizeForRow:(NSInteger)row;
- (id)initWithAlbumsId:(NSInteger)albumsId;

- (NSURL *)playURLForRow:(NSInteger)row;


/** 传值给tracks*/
- (NSNumber *)tracksIdForRow:(NSInteger)row;

@end
