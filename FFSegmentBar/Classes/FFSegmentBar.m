//
//  FFSegmentBar.m
//  FFSegmentBar_Example
//
//  Created by 肖凡 on 2019/5/17.
//  Copyright © 2019年 fanxiaoApple. All rights reserved.
//

#import "FFSegmentBar.h"
#import "UIView+FFSegmentBarAdd.h"

#define kMinMargin 30

@interface FFSegmentBar ()
{
    UIButton *_lastBtn;//记录最后一次点击的按钮
}
@property (nonatomic, weak) UIScrollView *contentView;
@property (nonatomic, strong) NSMutableArray<UIButton *> *buttonArray;
@property (nonatomic, weak) UIView *indicatorView;
@property (nonatomic, strong) FFSegmentBarConfig *config;
@end

@implementation FFSegmentBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = self.config.segmentBarBackgroundColor;
    }
    return self;
}

+(instancetype)segmentBarWithFrame:(CGRect)frame {
    FFSegmentBar *segmentBar = [[FFSegmentBar alloc] initWithFrame:frame];
    
    return segmentBar;
}
-(void)updateConfig:(void (^)(FFSegmentBarConfig *))configBlock{
    if (configBlock) {
        configBlock(self.config);
    }
    self.backgroundColor = self.config.segmentBarBackgroundColor;
    
    for (UIButton *btn in self.buttonArray) {
        [btn setTitleColor:self.config.titleNormalColor forState:UIControlStateNormal];
        [btn setTitleColor:self.config.titleSelectedColor forState:UIControlStateSelected];
        btn.titleLabel.font = self.config.titleFont;
    }
    
    self.indicatorView.backgroundColor = self.config.indicatorColor;
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}
- (void)btnClick:(UIButton *)btn{
    if ([self.delegate respondsToSelector:@selector(segmentBar:didSelectIndex:fromIndex:)]) {
        [self.delegate segmentBar:self didSelectIndex:btn.tag-100 fromIndex:(_lastBtn.tag-100)<0?0:(_lastBtn.tag-100)];
    }
    
    _selectedIndex = btn.tag - 100;
    
    _lastBtn.selected = NO;
    btn.selected = YES;
    _lastBtn = btn;
    
    [UIView animateWithDuration:0.1 animations:^{
//        self.indicatorView.fsb_width = btn.fsb_width + self.config.indicatorExtraWidth*2;
        self.indicatorView.fsb_width = self.config.indicatorFixedWidth?self.config.indicatorFixedWidth:btn.fsb_width + self.config.indicatorExtraWidth*2;
        self.indicatorView.fsb_centerX = btn.fsb_centerX;
    }];
    
    CGFloat scrollX = btn.fsb_centerX - self.contentView.fsb_width*0.5;
    if (scrollX < 0) {
        scrollX = 0;
    }
    if (scrollX > self.contentView.contentSize.width - self.contentView.fsb_width) {
        scrollX = self.contentView.contentSize.width - self.contentView.fsb_width;
    }
    
    [self.contentView setContentOffset:CGPointMake(scrollX, 0) animated:YES];
}
#pragma mark - setter
-(void)setSelectedIndex:(NSInteger)selectedIndex {
    if (self.buttonArray.count == 0 || selectedIndex < 0 || selectedIndex > self.buttonArray.count - 1) {
        return;
    }
    
    _selectedIndex = selectedIndex;
    UIButton *btn = self.buttonArray[selectedIndex];
    [self btnClick:btn];
}
-(void)setTitlesArray:(NSArray<NSString *> *)titlesArray{
    _titlesArray = titlesArray;
    
    [self.buttonArray makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.buttonArray = nil;
    
    for (NSString *title in titlesArray) {
        UIButton *btn = [[UIButton alloc] init];
        btn.tag = self.buttonArray.count+100;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:self.config.titleNormalColor forState:UIControlStateNormal];
        [btn setTitleColor:self.config.titleSelectedColor forState:UIControlStateSelected];
        btn.titleLabel.font = self.config.titleFont;
        [self.contentView addSubview:btn];
        [self.buttonArray addObject:btn];
    }
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}
#pragma mark - layoutSubviews
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.contentView.frame = self.bounds;
    
    CGFloat totalBtnWidth = 0;
    for (UIButton *btn in self.buttonArray) {
        [btn sizeToFit];
        totalBtnWidth += btn.fsb_width;
    }
    CGFloat caculateMargin = (self.fsb_width - totalBtnWidth) / (self.buttonArray.count+1);
    if (caculateMargin < kMinMargin) {
        caculateMargin = kMinMargin;
    }
    
    CGFloat lastX = caculateMargin;
    for (UIButton *btn in self.buttonArray) {
        [btn sizeToFit];
        btn.fsb_y = self.config.indicatorHeight;
        btn.fsb_x = lastX;
        btn.fsb_height = self.fsb_height - self.config.indicatorHeight*2;
        lastX += btn.fsb_width + caculateMargin;
    }
    
    self.contentView.contentSize = CGSizeMake(lastX, 0);
    
    if (self.buttonArray.count == 0) {
        return;
    }
    
    UIButton *btn = self.buttonArray[self.selectedIndex];
    
    self.indicatorView.fsb_width = self.config.indicatorFixedWidth?self.config.indicatorFixedWidth:btn.fsb_width + self.config.indicatorExtraWidth*2;
    self.indicatorView.fsb_centerX = btn.fsb_centerX;
    self.indicatorView.fsb_height = self.config.indicatorHeight;
    self.indicatorView.fsb_y = self.fsb_height - self.indicatorView.fsb_height;
    
    if (self.config.isIndicatorRounding) {
        self.indicatorView.layer.cornerRadius = self.indicatorView.fsb_height*0.5;
        self.indicatorView.layer.masksToBounds = YES;
    }
}
#pragma mark - 懒加载
-(UIScrollView *)contentView{
    if (!_contentView) {
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        scrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:scrollView];
        _contentView = scrollView;
    }
    return _contentView;
}

-(NSMutableArray<UIButton *> *)buttonArray{
    if (!_buttonArray) {
        _buttonArray = [NSMutableArray array];
    }
    return _buttonArray;
}
-(UIView *)indicatorView{
    if (!_indicatorView) {
        CGFloat indicatorH = self.config.indicatorHeight;
        UIView *indicatorView = [[UIView alloc] initWithFrame:CGRectMake(0, self.fsb_height-indicatorH, 0, indicatorH)];
        indicatorView.backgroundColor = self.config.indicatorColor;
        [self.contentView addSubview:indicatorView];
        _indicatorView = indicatorView;
    }
    return _indicatorView;
}
-(FFSegmentBarConfig *)config{
    if (!_config) {
        _config = [FFSegmentBarConfig defaultConfig];
    }
    return _config;
}
@end
