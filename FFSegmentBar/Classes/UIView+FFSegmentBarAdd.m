//
//  UIView+FFSegmentBarAdd.m
//  FFSegmentBar_Example
//
//  Created by 肖凡 on 2019/5/17.
//  Copyright © 2019年 fanxiaoApple. All rights reserved.
//

#import "UIView+FFSegmentBarAdd.h"

@implementation UIView (FFSegmentBarAdd)

-(CGFloat)fsb_x{
    return self.frame.origin.x;
}
-(void)setFsb_x:(CGFloat)fsb_x{
    CGRect frame = self.frame;
    frame.origin.x = fsb_x;
    self.frame = frame;
}

-(CGFloat)fsb_y{
    return self.frame.origin.y;
}
-(void)setFsb_y:(CGFloat)fsb_y{
    CGRect frame = self.frame;
    frame.origin.y = fsb_y;
    self.frame = frame;
}

-(CGFloat)fsb_width{
    return self.frame.size.width;
}
-(void)setFsb_width:(CGFloat)fsb_width{
    CGRect frame = self.frame;
    frame.size.width = fsb_width;
    self.frame = frame;
}

-(CGFloat)fsb_height{
    return self.frame.size.height;
}
-(void)setFsb_height:(CGFloat)fsb_height{
    CGRect frame = self.frame;
    frame.size.height = fsb_height;
    self.frame = frame;
}

-(CGFloat)fsb_centerX{
    return self.center.x;
}
-(void)setFsb_centerX:(CGFloat)fsb_centerX{
    CGPoint center = self.center;
    center.x = fsb_centerX;
    self.center = center;
}

-(CGFloat)fsb_centerY{
    return self.center.y;
}
-(void)setFsb_centerY:(CGFloat)fsb_centerY{
    CGPoint center = self.center;
    center.y = fsb_centerY;
    self.center = center;
}
@end
