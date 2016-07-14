//
//  ViewController.m
//  TestTrackMapDemo
//
//  Created by L-Q on 16/5/11.
//  Copyright © 2016年 L-Q. All rights reserved.
//

#import "ViewController.h"
#import "WGS84TOGCJ02.h"

@interface ViewController ()
{


    __weak IBOutlet MKMapView *TestMapView;

    __weak IBOutlet UISegmentedControl *selectControl;

    MKMapRect _routeRect;  // 轨迹类
    NSArray *FirstArr;
    NSArray *secondArr;
    NSArray *thirdArr;
    
    
    CLLocationCoordinate2D *newCoor;
    CLLocation *newMapLocation;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    [self.view addSubview:TestMapView];
//    TestMapView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
//    TestMapView.delegate = self;
    

    newCoor= malloc(sizeof(CLLocationCoordinate2D) * 2);
    
    
    FirstArr = @[
                 
                 @{
                     @"lo":@"113.9400326667",
                     @"la":@"22.5398061667"
                     
                     },
                 @{
                     @"lo":@"113.9409970000",
                     @"la":@"22.5380816667"
                     
                     },
                 
                 @{
                     @"lo":@"113.9421180000",
                     @"la":@"22.5370015000"
                     
                     },
                 
                 @{
                     @"lo":@"113.9421943333",
                     @"la":@"22.5381490000"
                     
                     },
                 
                 @{
                     @"lo":@"113.9400326667",
                     @"la":@"22.5384261667"
                     
                     },
                 
                 @{
                     @"lo":@"113.9448995000",
                     @"la":@"22.5391846667"
                     
                     },
                 
                 
                 @{
                     @"lo":@"113.9454223333",
                     @"la":@"22.5395583333"
                     
                     },
                 
                 @{
                     @"lo":@"113.9466161667",
                     @"la":@"22.5394895000"
                     
                     },
                 
                 @{
                     @"lo":@"113.9480696667",
                     @"la":@"22.5393923333"
                     
                     },
                 
                 @{
                     @"lo":@"113.9494948333",
                     @"la":@"22.5399438333"
                     
                     },
                 
                 @{
                     @"lo":@"113.9502520000",
                     @"la":@"22.5389183333"
                     
                     },
                 
                 @{
                     @"lo":@"113.9512660000",
                     @"la":@"22.5396838333"
                     
                     }
                 ];
    
    
   secondArr = @[
                 
                 @{
                     @"lo":@"113.9409800000",
                     @"la":@"22.5391018333"
                     
                     },
                 @{
                     @"lo":@"113.9409310000",
                     @"la":@"22.5380651667"
                     
                     },
                 @{
                     @"lo":@"113.9421175000",
                     @"la":@"22.5368231667"
                     
                     },
                 @{
                     @"lo":@"113.9421495000",
                     @"la":@"22.5380598333"
                     
                     },
                 
                 @{
                     @"lo":@"113.9434288333",
                     @"la":@"22.5388425000"
                     
                     },
                 
                 @{
                     @"lo":@"113.9449480000",
                     @"la":@"22.5392475000"
                     
        
                     },
                 
                 @{
                     @"lo":@"113.9454985000",
                     @"la":@"22.5395610000"
                     
                     },
                 @{
                     @"lo":@"113.9466335000",
                     @"la":@"22.5395765000"
                     
                     },
                 @{
                     @"lo":@"113.9479485000",
                     @"la":@"22.5396023333"
                     
                     },
                 @{
                     @"lo":@"113.9495466667",
                     @"la":@"22.5394798333"
                     
                     },
                 @{
                     @"lo":@"113.9495466667",
                     @"la":@"22.5394798333"
                     
                     },
                 @{
                     @"lo":@"113.9503441667",
                     @"la":@"22.5386563333"
                     
                     },
                 @{
                     @"lo":@"113.9512795000",
                     @"la":@"22.5395361667"
                     
                     }
                 
                 ];
    
    thirdArr = @[
                  
                  @{
                      @"la":@"22.5391663333",
                      @"lo":@"113.9409506667"
                      
                      },
                  @{
                      @"la":@"22.5381083333",
                      @"lo":@"113.9407523333"
                      
                      },
                  @{
                      @"la":@"22.5368540000",
                      @"lo":@"113.9417541667"
                      
                      },
                  @{
                      @"la":@"22.5381266667",
                      @"lo":@"113.9422136667"
                      
                      },
                  @{
                      @"la":@"22.5384810000",
                      @"lo":@"113.9433745000"
                      
                      },
                  @{
                      @"la":@"22.5391846667",
                      @"lo":@"113.9448310000"
                      
                      },
                  @{
                      @"la":@"22.5395176667",
                      @"lo":@"113.9454055000"
                      
                      },
                  @{
                      @"la":@"22.5395488333",
                      @"lo":@"113.9466221667"
                      
                      },
                  @{
                      @"la":@"22.5393848333",
                      @"lo":@"113.9480886667"
                      
                      },
                  @{
                      @"la":@"22.5398150000",
                      @"lo":@"113.9495236667"
                      
                      },
                  @{
                      @"la":@"22.5384346667",
                      @"lo":@"113.9502295000"
                      
                      },
                  @{
                      @"la":@"22.5396681667",
                      @"lo":@"113.9512748333"
                      
                      }
                  
                  ];
    
    
    
    [self loadRouteWithArr:FirstArr];
}


- (IBAction)segmentedControlClick:(UISegmentedControl *)sender {
    
    switch (sender.selectedSegmentIndex) {
        case 0:
        {
        
            [self loadRouteWithArr:FirstArr];
        
        }
            break;
        case 1:
        {
            [self loadRouteWithArr:secondArr];
        
        }
            break;
        case 2:
        {
        
            [self loadRouteWithArr:thirdArr];
        }
            break;
            
        default:
            break;
    }
    

}


#if 0
#pragma mark -- CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    
    if (locations != nil && locations.count > 0)
    {
        NSLog(@"位置信息：%@",manager.location);
        newMapLocation=manager.location;
        //当前位置
        CLLocation *newLocation=locations[0];
        //判断在中国地图上
        //        if ([WGS84TOGCJ02 isLocationOutOfChina:[newLocation coordinate]]) {
        //            return;
        //        }
        //转换后的coord
        CLLocationCoordinate2D newCoordinate = [WGS84TOGCJ02 locationTransFromWGSToGCJ:[newLocation coordinate]];
        
        if (newCoor==NULL) {
            newCoor[0]=newLocation.coordinate;
        }else
        {
            newCoor[1]=newLocation.coordinate;
            MKMapPoint newPoint = MKMapPointForCoordinate(newLocation.coordinate);
            
            // 得到两点的距离
            MKMapPoint prevPoint = MKMapPointForCoordinate(newCoor[0]);
            CLLocationDistance metersApart = MKMetersBetweenMapPoints(newPoint, prevPoint);
            if (metersApart>10) {
              double speed=newLocation.speed;
                MKPolyline *crum=[MKPolyline polylineWithCoordinates:newCoor count:2];
                [TestMapView addOverlay:crum level:MKOverlayLevelAboveRoads];
                newCoor[0]=newLocation.coordinate;
            }
            
        }
    }
    realloc(newCoor, sizeof(CLLocationCoordinate2D)*2);
}
#endif



#pragma mark - lineRoute

- (void)loadRouteWithArr:(NSArray *)locationsArr{

    
    NSLog(@"----%@",locationsArr);
    MKMapPoint northEastPoint;
    MKMapPoint southWestPoint;
    
    // create a c array of points.
    MKMapPoint* pointArr = malloc(sizeof(CLLocationCoordinate2D) * locationsArr.count);
    for(int idx = 0; idx < locationsArr.count; idx++)
    {
        
        NSDictionary *dic = [locationsArr objectAtIndex:idx];
        
        
        CLLocationDegrees latitude  = [dic[@"la"] doubleValue];
        CLLocationDegrees longitude = [dic[@"lo"] doubleValue];
        
        CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(latitude, longitude);
        
        CLLocationCoordinate2D coordinate;
        if (![WGS84TOGCJ02 isLocationOutOfChina:coord]) {
            coordinate = [WGS84TOGCJ02 locationTransFromWGSToGCJ:coord]; // 偏移算法
        }
        
        MKMapPoint point = MKMapPointForCoordinate(coordinate);
        
        if (idx == 0) {
            northEastPoint = point;
            southWestPoint = point;
           
            MKCoordinateSpan span = {0.001,0.001};
            MKCoordinateRegion region = MKCoordinateRegionMake(coordinate,span);
            [TestMapView setRegion:region animated:YES];
            
            
        }else{
            if (point.x > northEastPoint.x)
                northEastPoint.x = point.x;
            if(point.y > northEastPoint.y)
                northEastPoint.y = point.y;
            if (point.x < southWestPoint.x)
                southWestPoint.x = point.x;
            if (point.y < southWestPoint.y)
                southWestPoint.y = point.y;
        }
        
        pointArr[idx] = point;
        
    }
    
    self.routeLine = [MKPolyline polylineWithPoints:pointArr count:locationsArr.count];
    
    
    _routeRect = MKMapRectMake(southWestPoint.x, southWestPoint.y, northEastPoint.x - southWestPoint.x, northEastPoint.y - southWestPoint.y);
    
    [TestMapView setVisibleMapRect:[self.routeLine boundingMapRect]];
    
  //  [TestMapView addOverlay:self.routeLine];
    
    [TestMapView addOverlay:self.routeLine level:MKOverlayLevelAboveRoads];
    
    free(pointArr);

    
}


#pragma mark - MKMapViewDelegate


- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id <MKOverlay>)overlay
{
    
    MKOverlayRenderer *renderer = nil;
    MKPolylineRenderer *line=[[MKPolylineRenderer alloc]initWithOverlay:overlay];
    line.lineWidth=6;
    [line setStrokeColor:[UIColor colorWithRed:0.287 green:0.766 blue:0.382 alpha:1.000]];
    renderer=line;
    return  renderer;
}



#if 0
- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay{

    MKOverlayView* overlayView = nil;
    
    if(overlay == self.routeLine)
    {
        //if we have not yet created an overlay view for this overlay, create it now.
        if(nil == self.routeLineView)
        {
            self.routeLineView = [[MKPolylineView alloc] initWithPolyline:self.routeLine];
            
            self.routeLineView.lineCap = kCGLineCapRound;// 端点类型
            self.routeLineView.lineJoin = kCGLineCapRound;// 链接类型
            // 轨迹大小
            self.routeLineView.lineWidth = 8;
            // 轨迹颜色
            self.routeLineView.strokeColor = [UIColor greenColor];
            self.routeLineView.fillColor = [UIColor greenColor];
            
        }
        
        overlayView = self.routeLineView;
        
    }
    
    return overlayView;

}

#endif



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
