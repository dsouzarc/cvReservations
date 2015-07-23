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
    
    UIView *openActivity1 = (UIView*) [[NSBundle mainBundle] loadNibNamed:@"TwoActivityOpenView" owner:self options:nil][0];
    openActivity1.frame = self.bottomActivityView.frame;
    [self.view addSubview:openActivity1];
}

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
