//
//  CustomView.m
//  Demo
//
//  Created by piggybear on 2017/7/5.
//  Copyright © 2017年 piggybear. All rights reserved.
//

#import "CustomView.h"

@interface CustomView ()

@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UILabel *content;

@end

@implementation CustomView

- (void)setIndex:(NSInteger)index {
    _index = index;
    NSString *avatar = @"", *content = @"";
    switch (index) {
        case 0:
        {
            avatar = @"photo1";
            content = @"为了满足不断发展的智能电网、移动通信、 电动汽车 ，以及应急救灾的需要，迫切需要开发能量高、成本低、体积小、寿命长的新型化学电源";
        }
            break;
        case 1:
        {
            avatar = @"photo2";
             content = @"金属空气电池（也称为金属燃料电池）是一种将金属材料的化学能直接转化为电能的化学电源。金属空气电池具有能量密度高、价格低廉、资源丰富、绿色无污染、放电寿命长与安全环保等优势";
        }
            break;
        case 2:
        {
            avatar = @"photo3";
             content = @"仅在通信基站备用电源市场方面，据不完全统计，2016年中国通信基站的数目是近600万个。传统通信基站一般采用大容量铅酸蓄电池配合柴油发电机作为备用电源系统";
        }
            break;
    }
    
    self.avatar.image = [UIImage imageNamed:avatar];
    self.content.text = content;
    
}

@end
