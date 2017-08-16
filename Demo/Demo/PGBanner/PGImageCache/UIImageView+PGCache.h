//
//  UIImageView+PGCache.h
//  Demo
//
//  Created by piggybear on 2017/7/20.
//  Copyright © 2017年 piggybear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (PGCache)

- (void)imageWithURL:(nullable NSURL *)url placeholderImage:(nullable UIImage *)placeholder;

@end
