//
//  FourActivityViewController.m
//  CVReservations
//
//  Created by Ryan D'souza on 7/23/15.
//  Copyright (c) 2015 Ryan D'souza. All rights reserved.
//

#import "FourActivityViewController.h"

@interface FourActivityViewController ()

@property (strong, nonatomic) IBOutlet UIView *firstActivityView;
@property (strong, nonatomic) IBOutlet UIView *secondActivityView;
@property (strong, nonatomic) IBOutlet UIView *thirdActivityView;
@property (strong, nonatomic) IBOutlet UIView *fourthActivityView;

@property (strong, nonatomic) NSMutableArray *reservations;

@end

@implementation FourActivityViewController

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
    UIView *openActivity = (UIView*) [[NSBundle mainBundle] loadNibNamed:@"FourActivityView" owner:self options:nil][0];
    openActivity.frame = self.firstActivityView.frame;
    
    UIImageView *imageView = (UIImageView*) [openActivity viewWithTag:100];
    [imageView setImage:[UIImage imageNamed:@"pinball"]];
    
    UIButton *button = (UIButton*) [openActivity viewWithTag:300];
    button.titleLabel.numberOfLines = 2;
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    
    [self.view addSubview:openActivity];
    
    openActivity = (UIView*) [[NSBundle mainBundle] loadNibNamed:@"FourActivityView" owner:self options:nil][0];
    openActivity.frame = self.secondActivityView.frame;
    [self.view addSubview:openActivity];
    
    openActivity = (UIView*) [[NSBundle mainBundle] loadNibNamed:@"FourActivityView" owner:self options:nil][0];
    openActivity.frame = self.thirdActivityView.frame;
    [self.view addSubview:openActivity];
    
    openActivity = (UIView*) [[NSBundle mainBundle] loadNibNamed:@"FourActivityView" owner:self options:nil][0];
    openActivity.frame = self.fourthActivityView.frame;
    [self.view addSubview:openActivity];
}

@end