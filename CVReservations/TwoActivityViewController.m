//
//  TwoActivityViewController.m
//  CVReservations
//
//  Created by Ryan D'souza on 7/23/15.
//  Copyright (c) 2015 Ryan D'souza. All rights reserved.
//

#import "TwoActivityViewController.h"

@interface TwoActivityViewController ()

@property (strong, nonatomic) IBOutlet UIView *topActivityView;
@property (strong, nonatomic) IBOutlet UIView *bottomActivityView;

@end

@implementation TwoActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *openActivity = (UIView*) [[NSBundle mainBundle] loadNibNamed:@"TwoActivityOpenView" owner:self options:nil][0];
    openActivity.frame = self.topActivityView.frame;
    [self.view addSubview:openActivity];
    
    UIView *reservedActivity = (UIView*) [[NSBundle mainBundle] loadNibNamed:@"TwoActivityReservedView" owner:self options:nil][0];
    reservedActivity.frame = self.bottomActivityView.frame;
    [self.view addSubview:reservedActivity];
}

@end