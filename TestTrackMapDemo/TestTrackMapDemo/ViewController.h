//
//  ViewController.h
//  TestTrackMapDemo
//
//  Created by L-Q on 16/5/11.
//  Copyright © 2016年 L-Q. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController


@property (nonatomic, retain) MKPolyline* routeLine;
@property (nonatomic, retain) MKPolylineView* routeLineView;

@end

