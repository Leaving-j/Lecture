//
//  LectureCell.h
//  百家讲坛合集
//
//  Created by apple-jd01 on 15/11/4.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LectureCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *MeIV;
@property (weak, nonatomic) IBOutlet UILabel *tilteLb;
@property (weak, nonatomic) IBOutlet UILabel *detailLb;
@property (weak, nonatomic) IBOutlet UILabel *albumLb;

@end
