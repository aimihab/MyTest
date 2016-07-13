//
//  MNSegmentScrollView.m
//  testDemo
//
//  Created by L-Q on 16/6/20.
//  Copyright © 2016年 L-Q. All rights reserved.
//

#define MainScreen_W [UIScreen mainScreen].bounds.size.width

#import "MNSegmentScrollView.h"
#import "MNSegmentView.h"

@interface MNSegmentScrollView()<UIScrollViewDelegate>

@property (strong,nonatomic)UIScrollView *bgScrollView;
@property (strong,nonatomic)MNSegmentView *segmentToolView;

@end

@implementation MNSegmentScrollView

-(instancetype)initWithFrame:(CGRect)frame
                  titleArray:(NSArray *)titleArray
            contentViewArray:(NSArray *)contentViewArray{
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.bgScrollView];
        
        
        _segmentToolView=[[MNSegmentView alloc] initWithFrame:CGRectMake(0, 0, MainScreen_W, 44) titles:titleArray clickBlick:^void(NSInteger index) {
            NSLog(@"-----%ld",index);
            [_bgScrollView setContentOffset:CGPointMake(MainScreen_W*(index-1), 0)];
        }];
        [self addSubview:_segmentToolView];
        
        
        for (int i=0;i<contentViewArray.count; i++ ) {
            
            UIView *contentView = (UIView *)contentViewArray[i];
            contentView.frame=CGRectMake(MainScreen_W * i, _segmentToolView.bounds.size.height, MainScreen_W, _bgScrollView.frame.size.height-_segmentToolView.bounds.size.height);
            [_bgScrollView addSubview:contentView];
        }
        
    }
    
    return self;
}








/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
