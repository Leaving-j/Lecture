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
@property(nonatomic)NSInteger rowNumber;
@property(nonatomic)NSInteger page;
- (NSURL *)LogoURL;
- (NSURL *)iconURLForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)tracksForRow:(NSInteger)row;

- (id)initWithUid:(NSNumber *)uid;
//@property(nonatomic,strong)NSNumber *uid;


/** 传给AlbumsId*/
- (NSInteger)albumsIdForRow:(NSInteger)row;
@end
