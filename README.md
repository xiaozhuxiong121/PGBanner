# PGBanner
自定义控件无限轮播 + 无限图片轮播

![PGBanner.gif](http://upload-images.jianshu.io/upload_images/1340308-cb071aad23c7d951.gif?imageMogr2/auto-orient/strip)

# CocoaPods安装
```
pod 'PGBanner', '1.0.3'
```
# 使用
1、无限图片轮播

```
PGBanner *banner = [[PGBanner alloc]initImageViewWithFrame:self.topView.bounds imageList:@[@"photo1", @"photo2", @"photo3"] timeInterval:3.0];
banner.delegate = self;
[self.view addSubview:banner];

#pragma mark - PGBannerDelegate

- (void)selectAction:(NSInteger)didSelectAtIndex didSelectView:(id)view {
    NSLog(@"index = %ld  view = %@", didSelectAtIndex, view);
}
    
```
2、自定义控件无限轮播
> 使用自定义控件轮播时，需要注意两点  
> 
> 1、一定要把需要轮播的第一个view放到数组的最后位置  
> 2、一定要把需要轮播的最后一个view放到数组的第一个位置

```
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
[self.view addSubview:banner];

#pragma mark - PGBannerDelegate

- (void)selectAction:(NSInteger)didSelectAtIndex didSelectView:(id)view {
    NSLog(@"index = %ld  view = %@", didSelectAtIndex, view);
}
    
```
# 博客地址
[http://www.jianshu.com/p/57a8bf7f21bd
](http://www.jianshu.com/p/57a8bf7f21bd)

# Swift版本
[https://github.com/xiaozhuxiong121/PGBannerSwift](https://github.com/xiaozhuxiong121/PGBannerSwift)
