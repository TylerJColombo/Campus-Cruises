//
//  RequestRideViewController.m
//  Campus-Cruises
//
//  Created by Trevor Hodde on 1/13/16.
//  Copyright © 2016 Trevor Hodde. All rights reserved.
//

#import "RequestRideViewController.h"
@import UberRides;

@interface RequestRideViewController ()

@end

@implementation RequestRideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"MADE IT");

    // create background views
    UIView *topView = [[UIView alloc] init];
    [self.view addSubview:topView];
    UIView *bottomView = [[UIView alloc] init];
    [self.view addSubview:bottomView];
    
    // add black request button with default configurations
    RequestButton *blackRequestButton = [[RequestButton alloc] init];
    [topView addSubview:blackRequestButton];
    
    // add white request button and add custom configurations
    RequestButton *whiteRequestButton = [[RequestButton alloc] initWithColorStyle:RequestButtonColorStyleWhite];
    [whiteRequestButton setProductID:@"campus-cruises-id"];
    [whiteRequestButton setPickupLocationWithLatitude:@"37.770" longitude:@"-122.466" nickname:@"California Academy of Sciences" address:nil];
    [whiteRequestButton setDropoffLocationWithLatitude:@"37.791" longitude:@"-122.405" nickname:@"Pier 39" address:nil];
    [bottomView addSubview:whiteRequestButton];
    
    // position UIViews and request buttons
    [self setUpBackgroundViewsWithTop:topView andBottom:bottomView];
    [self centerButton:blackRequestButton inView:topView];
    [self centerButton:whiteRequestButton inView:bottomView];
}

// set up two white and black background UIViews with autolayout constraints
- (void)setUpBackgroundViewsWithTop:(UIView*)topView andBottom:(UIView*)bottomView {
    topView.backgroundColor = [UIColor whiteColor];
    bottomView.backgroundColor = [UIColor blackColor];
    topView.translatesAutoresizingMaskIntoConstraints = NO;
    bottomView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // pass views in dictionary
    NSDictionary *views = @{@"top":topView, @"bottom":bottomView};
    
    // position constraints
    NSArray *horizontalTopConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[top]|" options:0 metrics:nil views:views];
    NSArray *horizontalBottomConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[bottom]|" options:0 metrics:nil views:views];
    NSArray *verticalConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[top(bottom)][bottom]|" options:NSLayoutFormatAlignAllLeading metrics:nil views:views];
    
    // add constraints to view
    [self.view addConstraints:horizontalTopConstraint];
    [self.view addConstraints:horizontalBottomConstraint];
    [self.view addConstraints:verticalConstraint];
};

// center button position inside each background UIView
- (void)centerButton:(RequestButton*)button inView:(UIView*)view {
    button.translatesAutoresizingMaskIntoConstraints = NO;
    
    // position constraints
    NSLayoutConstraint *horizontalConstraint = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint *verticalConstraint = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    
    // add constraints to view
    [view addConstraints:[NSArray arrayWithObjects:horizontalConstraint, verticalConstraint, nil]];
};

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
