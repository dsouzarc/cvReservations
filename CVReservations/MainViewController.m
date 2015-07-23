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

@property (strong, nonatomic) TwoActivityViewController *twoActivityViewController;

@end

@implementation MainViewController

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self) {
        self.settingsViewController = [[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:[NSBundle mainBundle]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)secondFloorViewController:(id)sender {
    self.twoActivityViewController = [[TwoActivityViewController alloc] initWithNibName:@"TwoActivityViewController" bundle:[NSBundle mainBundle]];
    self.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:self.twoActivityViewController animated:YES completion:nil];
}

- (IBAction)thirdFloorViewController:(id)sender {
    
}

- (IBAction)fourthFloorViewController:(id)sender {
    
}


- (IBAction)settingsIcon:(id)sender {
    self.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:self.settingsViewController animated:YES completion:nil];
}


@end
