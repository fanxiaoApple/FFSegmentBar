//
//  FFSegmentBar.h
//  FFSegmentBar_Example
//
//  Created by 肖凡 on 2019/5/17.
//  Copyright © 2019年 fanxiaoApple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FFSegmentBarConfig.h"

@class FFSegmentBar;
@protocol FFSegmentDelegate <NSObject>

@optional
- (void) segmentBar:(FFSegmentBar *)segmentBar didSelectIndex:(NSInteger)toIndex fromIndex:(NSInteger)fromIndex;

@end


@interface FFSegmentBar : UIView

+ (instancetype)segmentBarWithFrame:(CGRect)frame;

@property (nonatomic, weak) id<FFSegmentDelegate> delegate;

@property (nonatomic, strong) NSArray<NSString *> *titlesArray;

@property (nonatomic, assign) NSInteger selectedIndex;

- (void) updateConfig:(void(^)(FFSegmentBarConfig *config))configBlock;

@end

