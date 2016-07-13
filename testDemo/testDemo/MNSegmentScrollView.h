//
//  MNSegmentScrollView.h
//  testDemo
//
//  Created by L-Q on 16/6/20.
//  Copyright © 2016年 L-Q. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MNSegmentScrollView : UIView


-(instancetype)initWithFrame:(CGRect)frame
                  titleArray:(NSArray *)titleArray
            contentViewArray:(NSArray *)contentViewArray;

@end
