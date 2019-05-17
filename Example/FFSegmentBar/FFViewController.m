//
//  FFViewController.m
//  FFSegmentBar
//
//  Created by fanxiaoApple on 05/17/2019.
//  Copyright (c) 2019 fanxiaoApple. All rights reserved.
//

#import "FFViewController.h"
#import "FFSegmentBar.h"

@interface FFViewController ()<FFSegmentDelegate>
/**<#desc#>*/
@property (nonatomic, weak) FFSegmentBar *bar;
@end

@implementation FFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    FFSegmentBar *bar = [FFSegmentBar segmentBarWithFrame:CGRectMake(15, 100, self.view.bounds.size.width-30, 40)];
    [bar updateConfig:^(FFSegmentBarConfig *config) {
        config.segmentBarColorBackground([UIColor yellowColor])
        .fontTitle([UIFont systemFontOfSize:16])
        .titleColorSelected([UIColor purpleColor])
        .titleColorNormal([UIColor blackColor])
        .colorIndicator([UIColor purpleColor])
        .heightIndicator(2)
        .roundingIndicator(YES)
        .fixedWidthIndicator(25);
    }];
    bar.delegate = self;
    [bar setTitlesArray:@[@"专辑专辑", @"声音", @"下载中", @"下载中11111", @"下载中22222", @"下载中3", @"下载中444", @"下载中55"]];
    [self.view addSubview:bar];
    self.bar = bar;
    

}
- (IBAction)test:(id)sender {
    self.bar.selectedIndex = 3;
}
-(void)segmentBar:(FFSegmentBar *)segmentBar didSelectIndex:(NSInteger)toIndex fromIndex:(NSInteger)fromIndex{
    NSLog(@"%zd-->%zd",fromIndex,toIndex);
}
@end
