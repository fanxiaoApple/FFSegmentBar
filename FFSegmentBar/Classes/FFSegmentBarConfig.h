//
//  FFSegmentBarConfig.h
//  FFSegmentBar_Example
//
//  Created by 肖凡 on 2019/5/17.
//  Copyright © 2019年 fanxiaoApple. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FFSegmentBarConfig : NSObject

+ (instancetype)defaultConfig;

@property (nonatomic, strong) UIColor *segmentBarBackgroundColor;
@property (nonatomic, strong) UIColor *titleNormalColor;
@property (nonatomic, strong) UIColor *titleSelectedColor;
@property (nonatomic, strong) UIFont *titleFont;

@property (nonatomic, strong) UIColor *indicatorColor;
@property (nonatomic, assign) CGFloat indicatorHeight;
@property (nonatomic, assign) CGFloat indicatorExtraWidth;
@property (nonatomic, assign) BOOL isIndicatorRounding;
@property (nonatomic, assign) CGFloat indicatorFixedWidth;

- (FFSegmentBarConfig *(^)(UIColor *color))segmentBarColorBackground;
- (FFSegmentBarConfig *(^)(UIColor *color))titleColorNormal;
- (FFSegmentBarConfig *(^)(UIColor *color))titleColorSelected;
- (FFSegmentBarConfig *(^)(UIFont *font))fontTitle;

- (FFSegmentBarConfig *(^)(UIColor *color))colorIndicator;
- (FFSegmentBarConfig *(^)(CGFloat height))heightIndicator;
- (FFSegmentBarConfig *(^)(CGFloat extraWidth))extraWidthIndicator;
- (FFSegmentBarConfig *(^)(BOOL isRounding))roundingIndicator;
- (FFSegmentBarConfig *(^)(CGFloat fixedWidth))fixedWidthIndicator;

@end

