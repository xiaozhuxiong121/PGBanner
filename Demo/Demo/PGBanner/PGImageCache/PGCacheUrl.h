//
//  PGCacheUrl.h
//  Demo
//
//  Created by piggybear on 2017/7/20.
//  Copyright © 2017年 piggybear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PGCacheUrl : NSObject
@property (class, nonatomic, strong) NSMutableDictionary<NSString *, NSString *> *datas;
@property (class, nonatomic, strong) NSMutableArray<NSDictionary<NSString *, UIImageView *> *> *imageViews;
+ (BOOL)hasUrl:(NSString *)urlString;
+ (NSArray<UIImageView *> *)imageViewFromImageViewsOfKey:(NSString *)key;
+ (void)removeImageViewFromImageViewsOfKey:(NSString *)key;
@end
