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
- (NSURL *)iconURLForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)detailForRow:(NSInteger)row;
- (NSString *)albumNumForRow:(NSInteger)row;

- (NSNumber *)IDForRow:(NSInteger)row;
@end
