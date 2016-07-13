//
//  ChartView.h
//  testDemo
//
//  Created by L-Q on 16/6/16.
//  Copyright © 2016年 L-Q. All rights reserved.
//

#import <UIKit/UIKit.h>




typedef NS_ENUM(NSInteger,RecordType) {

    RecordTypeDay = 0,
    RecordTypeWeek,
    RecordTypeMonth,
    RecordTypeYear,

};


@interface ChartView : UIView


@property(nonatomic ,assign)RecordType dataType;



- (instancetype)initWithFrame:(CGRect)frame dataArray:(NSMutableArray *)dataArr;



- (void)changeRecordType:(RecordType)dataType;


@end
