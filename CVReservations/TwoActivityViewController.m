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

@property (strong, nonatomic) NSMutableArray *reservations;

@end

@implementation TwoActivityViewController

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil reservations:(NSMutableArray *)reservations
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self) {
        self.reservations = reservations;
    }
    return self;
}

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