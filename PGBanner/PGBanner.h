//
//  PGBanner.h
//  edetection
//
//  Created by piggybear on 2017/6/28.
//  Copyright © 2017年 piggybear. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PGBannerDelegate <NSObject>

- (void)selectAction:(NSInteger)didSelectAtIndex didSelectView:(id)view;

@end

@interface PGBanner : UIView
- (instancetype)initViewWithFrame:(CGRect)frame ViewList:(NSArray *)viewList timeInterval:(CGFloat)timeInterval;
- (instancetype)initImageViewWithFrame:(CGRect)frame imageList:(NSArray<NSString *> *)imageList timeInterval:(CGFloat)timeInterval;
- (instancetype)initImageViewWithFrame:(CGRect)frame placeholderImage:(UIImage *)placeholder imageList:(NSArray<NSString *> *)imageList timeInterval:(CGFloat)timeInterval;

@property(nonatomic, weak) id<PGBannerDelegate> delegate;
@property (nonatomic, strong) UIPageControl *pageControl;
@end
