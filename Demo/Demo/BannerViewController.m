//
//  BannerViewController.m
//  Demo
//
//  Created by piggybear on 2017/7/5.
//  Copyright © 2017年 piggybear. All rights reserved.
//

#import "BannerViewController.h"
#import "CustomView.h"
#import <PGBanner/PGBanner.h>

@interface BannerViewController ()<PGBannerDelegate>

@property (weak, nonatomic) IBOutlet UIView *topView;

@end

@implementation BannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = false;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    if (self.isImage == 1) {
        [self customImage];
        return;
    }else if (self.isImage == 2) {
        [self webImage];
        return;
    }
    [self customView];
}

- (void)customImage {
    PGBanner *banner = [[PGBanner alloc]initImageViewWithFrame:self.topView.bounds imageList:@[@"photo1", @"photo2", @"photo3"] timeInterval:3.0];
    banner.delegate = self;
    [self.topView addSubview:banner];
}

- (void)webImage {
    PGBanner *banner = [[PGBanner alloc]initImageViewWithFrame:self.topView.bounds placeholderImage:[UIImage imageNamed:@"photo1"] imageList:@[@"http://img.zcool.cn/community/05e5e1554af04100000115a8236351.jpg", @"http://imgsrc.baidu.com/image/c0%3Dshijue%2C0%2C0%2C245%2C40/sign=b61c57bf06f431ada8df4b7a235fc6da/b58f8c5494eef01f3e82aae8eafe9925bc317d0c.jpg", @"http://www.ccarting.com/img/opus/photograph/h000/h41/img201008181910520.jpg"] timeInterval:3.0];
    banner.delegate = self;
    [self.topView addSubview:banner];
}

- (void)customView {
    
    CustomView *view1 = [[NSBundle mainBundle] loadNibNamed:@"CustomView" owner:self options:nil].firstObject;
    view1.index = 0;
    CustomView *view2 = [[NSBundle mainBundle] loadNibNamed:@"CustomView" owner:self options:nil].firstObject;
    view2.index = 1;
    CustomView *view3 = [[NSBundle mainBundle] loadNibNamed:@"CustomView" owner:self options:nil].firstObject;
    view3.index = 2;
    //将最后一个view放到数组的第一个位置
    CustomView *view0 = [[NSBundle mainBundle] loadNibNamed:@"CustomView" owner:self options:nil].firstObject;
    view0.index = 2;
    //将第一个view放到数组的第最后位置
    CustomView *view4 = [[NSBundle mainBundle] loadNibNamed:@"CustomView" owner:self options:nil].firstObject;
    view4.index = 0;
    
    PGBanner *banner = [[PGBanner alloc]initViewWithFrame:self.topView.bounds ViewList:@[view0, view1, view2, view3, view4] timeInterval:3.0];
    banner.delegate = self;
    [self.topView addSubview:banner];
}

#pragma mark - PGBannerDelegate

- (void)selectAction:(NSInteger)didSelectAtIndex didSelectView:(id)view {
    NSLog(@"index = %ld  view = %@", didSelectAtIndex, view);
    
    UIViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"action"];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
