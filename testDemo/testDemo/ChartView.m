//
//  ChartView.m
//  testDemo
//
//  Created by L-Q on 16/6/16.
//  Copyright © 2016年 L-Q. All rights reserved.
//


#import "ChartView.h"
#import "ChartViewCell.h"
#import "MNSegmentView.h"


@interface ChartView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


/**
 *  记录视图
 */
@property (nonatomic,strong) UICollectionView *recordCollectionView;


/**
 *  标题视图
 */
@property (nonatomic,strong) MNSegmentView *titleView;



/**
 *  某天每小时的数据
 */
@property (nonatomic,strong) NSMutableArray *dayDataArr;


/**
 *  所有天的数据
 */
@property (nonatomic,strong) NSMutableArray *allDataArr;


@end

@implementation ChartView


- (NSMutableArray *)dayDataArr{

    if (_dayDataArr == nil) {
        
        _dayDataArr = [NSMutableArray array];
        
        //默认今天的数据
    }
    
    return _dayDataArr;
}


- (NSMutableArray *)allDataArr{

    if (_allDataArr == nil) {
        _allDataArr = [NSMutableArray array];
        
        //查询获取所有数据
        
    }
    
    return _allDataArr;
}


- (UICollectionView *)recordCollectionView{

    if (_recordCollectionView == nil) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = -2;
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);

        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        
        _recordCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 30, [[UIScreen mainScreen] bounds].size.width, 200) collectionViewLayout:layout];
        
        _recordCollectionView.backgroundColor = [UIColor clearColor];
        _recordCollectionView.showsHorizontalScrollIndicator = NO;
        _recordCollectionView.delegate = self;
        _recordCollectionView.dataSource = self;

        
        [_recordCollectionView registerNib:[UINib nibWithNibName:@"ChartViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"ChartViewCell"];
    }
    
    return _recordCollectionView;

}


- (MNSegmentView *)titleView{

    if (_titleView == nil) {
        
        _titleView = [[MNSegmentView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 30) titles:@[@"今天",@"趋势"] clickBlick:^(NSInteger index) {
            
            NSLog(@"切换collectionView的数据...%ld",index);
            

            switch (index) {
                case 1:
                {
                    NSLog(@"一天24小时的数据");
                    self.dataType = RecordTypeDay;
                   
                }
                    break;
                case 2:
                {
                    
                    NSLog(@"天的数据");
                    
                    self.dataType = RecordTypeWeek;
                }
                    break;
                    
                case 3:
                {
                
                    NSLog(@"周、月的数据");
                }
                    
                default:
                    break;
            }
            
             [self loadRecordUIWithType:self.dataType];
            
            
        }];

        
    }


    return _titleView;

}


- (instancetype)initWithFrame:(CGRect)frame dataArray:(NSMutableArray *)dataArr{


//    self = [super init];
    self = [[[NSBundle mainBundle] loadNibNamed:@"ChartView" owner:self options:nil] firstObject];
    
    if (self) {
    
         self.frame = frame;
        
        
        
        [self addSubview:self.titleView];
    
        [self addSubview:self.recordCollectionView];

    }

    return self;

}


#pragma mark --UICollectionViewDataSource
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.dataType == RecordTypeDay) {
        
        return 24;
        
    }else {
    
        return 365;
    }
    
    
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   ChartViewCell *cell = (ChartViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"ChartViewCell" forIndexPath:indexPath];
    
    switch (self.dataType) {
        case RecordTypeDay:
        {
        
//            NSArray *hourArr = [NSArray array];
            
            CGFloat perHeight = (cell.frame.size.height - 35)/20000;
            CGFloat valueHeight = perHeight*10000;
            cell.dateLabel.text = @"00:00";
        
            UIView *valueView = [[UIView alloc] initWithFrame:CGRectMake(5, cell.frame.size.height-35-valueHeight, cell.frame.size.width-10, valueHeight)];
            valueView.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.7f];
            
            [cell addSubview:valueView];
            
        }
            break;
        case RecordTypeWeek:
        {
            
            cell.dateLabel.text = @"06-21";
            
            
            
        
        }
            break;
        case RecordTypeMonth:
        {
            
        }
            break;
        default:
            break;
    }
    
    
    return cell;
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (self.dataType == RecordTypeDay) {
        
        return  CGSizeMake([[UIScreen mainScreen] bounds].size.width /8, 200);
    }else{
    
        return  CGSizeMake([[UIScreen mainScreen] bounds].size.width /7, 200);
    }
    
}

/**
 *  运动记录（天、周、月）
 *
 *  @param dataType 运动数据类型
 */

- (void)loadRecordUIWithType:(RecordType)dataType{

    switch (dataType) {
        case RecordTypeDay:
        {
        
            NSLog(@"获取某天的24小时的数据..");
            
            
        }
            break;
        case RecordTypeWeek:
        {
            NSLog(@"获取一年365天的数据..");
            
            
        }
            break;
        case RecordTypeMonth:
        {
        
            
        }
            break;
            
        default:
            break;
    }
    
    [self.recordCollectionView reloadData]; //刷新UI
    
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    
    CGFloat space = [[UIScreen mainScreen] bounds].size.width /7;
    NSInteger index = (self.recordCollectionView.contentOffset.x + self.center.x - 0) / space;
    
    //选中item中间位置的相对偏移量
    CGFloat selectItemOffsetX = (index * space)-(space/2);
    
    //偏差
    CGFloat offSetX = self.recordCollectionView.contentOffset.x + self.center.x - selectItemOffsetX;
    
//    CGFloat offsetX =
    [self.recordCollectionView setContentOffset:CGPointMake(offSetX, 0) animated:YES];
    
  
    
 //   [self.recordCollectionView selectItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionNone];

}


@end
