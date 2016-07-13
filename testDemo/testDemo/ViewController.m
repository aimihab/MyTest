//
//  ViewController.m
//  testDemo
//
//  Created by L-Q on 16/6/16.
//  Copyright © 2016年 L-Q. All rights reserved.
//
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width

#import "ViewController.h"
#import "ChartView.h"

@interface ViewController ()
{

    NSMutableArray *_dataArr;
}



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _dataArr = [NSMutableArray array];
    self.title = @"图表记录";
    
    CGFloat emoWallHeight = 0;
    if (SCREEN_WIDTH == 320) {
        emoWallHeight = 230;
    }else if (SCREEN_WIDTH == 375){
        emoWallHeight = 260;
    }else if (SCREEN_WIDTH == 414){
        emoWallHeight = 290;
    }else if (SCREEN_WIDTH == 768){
        emoWallHeight = 550;
    }

    
    ChartView *charView = [[ChartView alloc] initWithFrame:CGRectMake(0, 70, SCREEN_WIDTH, emoWallHeight) dataArray:_dataArr];
    
    charView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:charView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
