//
//  LectureBookViewController.h
//  BaseProject
//
//  Created by apple-jd01 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LectureBookViewModel.h"
@interface LectureBookViewController : UICollectionViewController
@property(nonatomic)BookType type;
@property(nonatomic,strong)NSString *naviTitle;
@end
