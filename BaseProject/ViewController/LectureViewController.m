//
//  LectureViewController.m
//  BaseProject
//
//  Created by apple-jd01 on 15/11/8.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LectureViewController.h"
#import "iCarousel.h"
#import "LectureBookViewController.h"
@interface LectureViewController ()<iCarouselDelegate,iCarouselDataSource>
@property(nonatomic,strong)iCarousel *ic;
@property(nonatomic,strong)NSArray *imagesNames;
@end

@implementation LectureViewController
- (NSArray *)imagesNames{
    if (!_imagesNames) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Heros" ofType:@"bundle"];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        _imagesNames = [fileManager subpathsAtPath:path];
    }
    return _imagesNames;
}

- (iCarousel *)ic{
    if (!_ic) {
        _ic = [iCarousel new];
        _ic.delegate = self;
        _ic.dataSource = self;
        _ic.type = 3;
        _ic.autoscroll = 0;
        _ic.pagingEnabled = YES;
        _ic.scrollSpeed = 0.5;
    }
    return _ic;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [UIImageView new];
    imageView.image = [UIImage imageNamed:@"view_background"];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    [self.view addSubview:self.ic];
    [self.ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

#pragma mark - iCarousel

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.imagesNames.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW/2, kWindowH/2)];
        UIImageView *imageView = [UIImageView new];
        imageView.tag = 100;
        [view addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        UILabel *lable = [[UILabel alloc] init];
        lable.font = [UIFont systemFontOfSize:20];
        lable.tag = 200;
        [view addSubview:lable];
        [lable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(imageView.mas_bottom).mas_equalTo(10);
            make.centerX.mas_equalTo(0);
        }];
    }
    UIImageView *imageView = (UIImageView *)[view viewWithTag:100];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Heros" ofType:@"bundle"];
    path = [path stringByAppendingPathComponent:self.imagesNames[index]];
    imageView.image = [UIImage imageWithContentsOfFile:path];
    NSArray *labelArr = [NSArray new];
    labelArr = @[@"全部",@"名师经典",@"历史传奇",@"帝王将相",@"风云人物",@"国学经典"];
    UILabel *label = (UILabel *)[view viewWithTag:200];
    label.text = labelArr[index];
    return view;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
/** 修改缝隙*/
    if (option == iCarouselOptionSpacing) {
        return value * 1.5;
    }
    return value;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{

    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    flowLayout.itemSize = CGSizeMake(170, 170);
    LectureBookViewController *bookVC = [[LectureBookViewController alloc] initWithCollectionViewLayout:flowLayout];

    [self.navigationController pushViewController:bookVC animated:YES];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
