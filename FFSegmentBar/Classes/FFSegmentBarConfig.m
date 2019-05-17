//
//  FFSegmentBarConfig.m
//  FFSegmentBar_Example
//
//  Created by 肖凡 on 2019/5/17.
//  Copyright © 2019年 fanxiaoApple. All rights reserved.
//

#import "FFSegmentBarConfig.h"

@implementation FFSegmentBarConfig

+(instancetype)defaultConfig{
    FFSegmentBarConfig *config = [[FFSegmentBarConfig alloc] init];
    /*
    config.segmentBarBackgroundColor = [UIColor clearColor];
    config.titleFont = [UIFont systemFontOfSize:15];
    config.titleNormalColor = [UIColor darkGrayColor];
    config.titleSelectedColor = [UIColor redColor];
    config.indicatorColor = [UIColor redColor];
    config.indicatorHeight = 2;
    config.indicatorExtraWidth = 10;
    */
    
    config.segmentBarColorBackground([UIColor clearColor])
    .fontTitle([UIFont systemFontOfSize:15])
    .titleColorNormal([UIColor darkGrayColor])
    .titleColorSelected([UIColor redColor])
    .colorIndicator([UIColor redColor])
    .heightIndicator(2.f)
    .extraWidthIndicator(0)
    .roundingIndicator(NO)
    .fixedWidthIndicator(0);
    
    return config;
}

-(FFSegmentBarConfig *(^)(UIColor *))segmentBarColorBackground{
    return ^(UIColor *color){
        self.segmentBarBackgroundColor = color;
        return self;
    };
}
-(FFSegmentBarConfig *(^)(UIColor *))titleColorNormal{
    return ^(UIColor *color){
        self.titleNormalColor = color;
        return self;
    };
}
-(FFSegmentBarConfig *(^)(UIColor *))titleColorSelected {
    return ^(UIColor *color){
        self.titleSelectedColor = color;
        return self;
    };
}
-(FFSegmentBarConfig *(^)(UIFont *))fontTitle{
    return ^(UIFont *font){
        self.titleFont = font;
        return self;
    };
}
-(FFSegmentBarConfig *(^)(UIColor *))colorIndicator{
    return ^(UIColor *color){
        self.indicatorColor = color;
        return self;
    };
}
-(FFSegmentBarConfig *(^)(CGFloat))heightIndicator{
    return ^(CGFloat height){
        self.indicatorHeight = height;
        return self;
    };
}
-(FFSegmentBarConfig *(^)(CGFloat))extraWidthIndicator{
    return ^(CGFloat extraW){
        self.indicatorExtraWidth = extraW;
        return self;
    };
}
-(FFSegmentBarConfig *(^)(BOOL))roundingIndicator{
    return ^(BOOL isRounding){
        self.isIndicatorRounding = isRounding;
        return self;
    };
}
-(FFSegmentBarConfig *(^)(CGFloat))fixedWidthIndicator{
    return ^(CGFloat fixedWidth){
        self.indicatorFixedWidth = fixedWidth;
        return self;
    };
}
@end
