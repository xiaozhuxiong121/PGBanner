//
//  ViewController.m
//  Demo
//
//  Created by piggybear on 2017/7/5.
//  Copyright © 2017年 piggybear. All rights reserved.
//

#import "ViewController.h"
#import "BannerViewController.h"

@interface ViewController ()

@end

@implementation ViewController


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    BannerViewController *vc = [segue destinationViewController];
    NSString *identifier = [segue identifier];
    if (vc) {
        vc.isImage = [identifier integerValue];
    }
}


@end
