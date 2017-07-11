//
//  UIImageView+PGCache.m
//  test
//
//  Created by piggybear on 2017/7/10.
//  Copyright © 2017年 piggybear. All rights reserved.
//

#import "UIImageView+PGCache.h"

@implementation UIImageView (PGCache)

- (void)imageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder {
    self.image = placeholder;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    configuration.URLCache = [NSURLCache sharedURLCache];
    configuration.requestCachePolicy = NSURLRequestUseProtocolCachePolicy;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.timeoutInterval = 20;
    request.HTTPShouldUsePipelining = YES;
    request.HTTPShouldHandleCookies = NO;
    [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error){
            UIImage* image = [UIImage imageWithData:data];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.image = image;
            });
        }
    }] resume];
}

@end
