//
//  RequestRideViewController.m
//  Campus-Cruises
//
//  Created by Trevor Hodde on 1/13/16.
//  Copyright © 2016 Trevor Hodde. All rights reserved.
//

#import "RequestRideViewController.h"
@import GoogleMaps;
#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "SidebarMenuViewController.h"
#import "TestAViewController.h"
#import "GoogleMaps.h"



@interface RequestRideViewController ()

@end

@implementation RequestRideViewController


//GMSMapView *mapView_;



- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)loadView {
    
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.86
                                                            longitude:151.20
                                                                 zoom:6];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    self.view = mapView_;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(-33.86, 151.20);
    marker.title = @"Sydney";
    marker.snippet = @"Australia";
    marker.map = mapView_;
    
    //The side bar shit is below
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    SidebarMenuViewController *sidebarMenuVC = [[SidebarMenuViewController alloc] initWithNibName:@"SidebarMenuViewController" bundle:nil];
    
    TestAViewController *testAViewController = [[TestAViewController alloc] initWithNibName:@"TestAViewController" bundle:nil];
    sidebarMenuVC.menuItemViewControllers = [[NSArray alloc] initWithObjects:testAViewController, nil];

    sidebarMenuVC.menuItemNames = [[NSArray alloc] initWithObjects:@"Account", @"Pay Me Bitches", @"Previous Rides", @"Help", @"Notifications", @"Settings", @"About Us", nil];
    
    sidebarMenuVC.sideBarButtonImageName = @"sidebarMenuImage";
    
    [self.window setRootViewController:sidebarMenuVC];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
