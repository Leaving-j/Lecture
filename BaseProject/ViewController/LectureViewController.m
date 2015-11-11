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
#import "LectureBookManager.h"
#import "LectureBookViewModel.h"
@interface LectureViewController ()<iCarouselDelegate,iCarouselDataSource>
@property(nonatomic,strong)iCarousel *ic;
@property(nonatomic)BookType type;
/** 图片数组 */
@property(nonatomic,strong)NSArray *imagesNames;
/** 题目数组*/
@property(nonatomic,strong)NSArray *titleArr;
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

- (NSArray *)titleArr{
    if (!_titleArr) {
        _titleArr = @[@"全部",@"名师经典",@"历史传奇",@"帝王将相",@"风云人物",@"国学经典"];
    }
    return _titleArr;
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
    UILabel *label = (UILabel *)[view viewWithTag:200];
    label.text = self.titleArr[index];
    return view;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
/** 修改缝隙 */
    if (option == iCarouselOptionSpacing) {
        return value * 1.5;
    }
    return value;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    [self performSegueWithIdentifier:@"ablumSegue" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    LectureBookViewController *vc = segue.destinationViewController;
    /**
     *currentItemIndex:获取当前项下标，把对应的类型传过去
     */
    switch (self.ic.currentItemIndex) {
        case 0:
            vc.type = BookTypeAll;
            vc.naviTitle = _titleArr[0];
            break;
        case 1:
            vc.type = BookTypeTeacher;
            vc.naviTitle = _titleArr[1];
            break;
        case 2:
            vc.type = BookTypeHistory;
            vc.naviTitle = _titleArr[2];
            break;
        case 3:
            vc.type = BookTypeKing;
            vc.naviTitle = _titleArr[3];
            break;
        case 4:
            vc.type = BookTypeMan;
            vc.naviTitle = _titleArr[4];
            break;
        case 5:
            vc.type = BookTypeTraditional;
            vc.naviTitle = _titleArr[5];
            break;
        default:
            break;
    }
    
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
