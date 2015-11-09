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
- (NSURL *)iconURLWithIndexPath:(NSIndexPath *)indexPath;
- (NSString *)titleWithIndexPath:(NSIndexPath *)indexPath;
@end
