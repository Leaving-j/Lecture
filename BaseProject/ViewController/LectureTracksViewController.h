//
//  LectureTracksViewController.h
//  BaseProject
//
//  Created by apple-jd01 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LectureTracksViewController : UIViewController
/** 本页地址 */
@property(nonatomic,strong)NSNumber *tracksId;
/** 播放数组 */
@property(nonatomic,strong)NSMutableArray *albumsArr;
/** 开始播放 */
@property(nonatomic)NSInteger beginPlay;
@end
