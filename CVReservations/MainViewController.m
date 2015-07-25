//
//  MainViewController.m
//  CVReservations
//
//  Created by Ryan D'souza on 7/23/15.
//  Copyright (c) 2015 Ryan D'souza. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (strong, nonatomic) SettingsViewController *settingsViewController;

@property (strong, nonatomic) FourActivityViewController *secondFloorActivityViewController;
@property (strong, nonatomic) TwoActivityViewController *thirdFloorActivityViewController;
@property (strong, nonatomic) TwoActivityViewController *fourthFloorActivityViewController;

@property (strong, nonatomic) NSMutableArray *currentReservations;

@end

@implementation MainViewController

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self) {
        self.settingsViewController = [[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:[NSBundle mainBundle]];
        self.currentReservations = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [ParseCloudManager getNextReservationForGame:@"pool"];
}

- (IBAction)secondFloorViewController:(id)sender {
    self.secondFloorActivityViewController = [[FourActivityViewController alloc] initWithNibName:@"FourActivityViewController" bundle:[NSBundle mainBundle]reservations:self.currentReservations];
    self.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:self.secondFloorActivityViewController animated:YES completion:nil];
}

- (IBAction)thirdFloorViewController:(id)sender {
    self.thirdFloorActivityViewController = [[TwoActivityViewController alloc] initWithNibName:@"TwoActivityViewController" bundle:[NSBundle mainBundle] floorNumber:@"ThirdFloor" reservations:self.currentReservations];
    self.modalInPopover = UIModalPresentationFormSheet;
    [self presentViewController:self.thirdFloorActivityViewController animated:YES completion:nil];
}

- (IBAction)fourthFloorViewController:(id)sender {
    self.fourthFloorActivityViewController = [[TwoActivityViewController alloc] initWithNibName:@"TwoActivityViewController" bundle:[NSBundle mainBundle] floorNumber:@"FourthFloor" reservations:self.currentReservations];
    self.modalInPopover = UIModalPresentationFormSheet;
    [self presentViewController:self.fourthFloorActivityViewController animated:YES completion:nil];
}


- (IBAction)settingsIcon:(id)sender {
    self.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:self.settingsViewController animated:YES completion:nil];
}

@end