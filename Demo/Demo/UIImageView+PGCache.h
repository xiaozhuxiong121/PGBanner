//
//  UIImageView+PGCache.h
//  test
//
//  Created by piggybear on 2017/7/10.
//  Copyright © 2017年 piggybear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (PGCache)

- (void)imageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;

@end
