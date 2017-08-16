//
//  PGCacheUrl.m
//  Demo
//
//  Created by piggybear on 2017/7/20.
//  Copyright © 2017年 piggybear. All rights reserved.
//

#import "PGCacheUrl.h"

@implementation PGCacheUrl

@dynamic datas;
@dynamic imageViews;

+ (NSMutableDictionary<NSString *, NSString *> *)datas {
    static dispatch_once_t onceToken;
    static NSMutableDictionary *dic = nil;
    dispatch_once(&onceToken, ^{
        dic = [NSMutableDictionary dictionary];
    });
    return dic;
}

+ (NSMutableArray<NSDictionary<NSString *,UIImageView *> *> *)imageViews {
    static dispatch_once_t onceToken;
    static NSMutableArray *arr = nil;
    dispatch_once(&onceToken, ^{
        arr = [NSMutableArray array];
    });
    return arr;
}

+ (BOOL)hasUrl:(NSString *)urlString {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF contains %@", urlString];
    return [self.datas.allKeys filteredArrayUsingPredicate:predicate].count;
}

+ (NSArray<UIImageView *> *)imageViewFromImageViewsOfKey:(NSString *)key {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.url contains %@", key];
    NSArray *filteredArray = [self.imageViews filteredArrayUsingPredicate:predicate];
    NSMutableArray *tempArr = [NSMutableArray arrayWithCapacity:filteredArray.count];
    [filteredArray enumerateObjectsUsingBlock:^(NSDictionary<NSString *, UIImageView *> *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [tempArr addObject:obj[@"imageView"]];
    }];
    return tempArr;
}

+ (void)removeImageViewFromImageViewsOfKey:(NSString *)key {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.url contains %@", key];
    NSArray *filteredArray = [self.imageViews filteredArrayUsingPredicate:predicate];
    [self.imageViews removeObjectsInArray:filteredArray];
}

@end
