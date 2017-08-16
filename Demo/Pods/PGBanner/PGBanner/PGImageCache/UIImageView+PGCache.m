//
//  UIImageView+PGCache.m
//  Demo
//
//  Created by piggybear on 2017/7/20.
//  Copyright © 2017年 piggybear. All rights reserved.
//

#import "UIImageView+PGCache.h"
#import "PGCacheUrl.h"

@implementation UIImageView (PGCache)

- (void)imageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder {
    self.image = placeholder;
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.timeoutInterval = 20;
    request.HTTPShouldUsePipelining = YES;
    request.HTTPShouldHandleCookies = NO;
    
    NSString *key = url.absoluteString;
    if ([PGCacheUrl hasUrl:key]) {
        NSString *str = [[PGCacheUrl datas] objectForKey:key];
        if ([str isEqualToString:@"success"]) {
            NSCachedURLResponse *response = [[NSURLCache sharedURLCache] cachedResponseForRequest:request];
            UIImage* image = [UIImage imageWithData:response.data];
            self.image = image;
        }else if ([str isEqualToString:@"waiting"]) {
            NSDictionary *dic = @{@"url": key, @"imageView": self};
            [[PGCacheUrl imageViews] addObject:dic];
        }
        return;
    }
    [[PGCacheUrl datas] setObject:@"waiting" forKey:key];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    configuration.URLCache = [NSURLCache sharedURLCache];
    configuration.requestCachePolicy = NSURLRequestUseProtocolCachePolicy;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error){
            UIImage* image = [UIImage imageWithData:data];
            if (image) { //成功
                [[PGCacheUrl datas] setObject:@"success" forKey:key];
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.image = image;
                    NSArray *imageViews = [PGCacheUrl imageViewFromImageViewsOfKey:key];
                    [imageViews enumerateObjectsUsingBlock:^(UIImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        obj.image = image;
                    }];
                    if (imageViews.count) {
                        [PGCacheUrl removeImageViewFromImageViewsOfKey:key];
                    }
                });
            }else { //没有保存成功 删除 重新下载
                [[PGCacheUrl datas] removeObjectForKey:key];
            }
        }
    }] resume];
}

@end
