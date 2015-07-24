//
//  SettingsViewController.m
//  CVReservations
//
//  Created by Ryan D'souza on 7/23/15.
//  Copyright (c) 2015 Ryan D'souza. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (strong, nonatomic) IBOutlet UITextField *iPadNameTextField;

@property (strong, nonatomic) UICKeyChainStore *keyChain;

@end

@implementation SettingsViewController

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self) {
        self.keyChain = [[UICKeyChainStore alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(self.keyChain[@"iPadName"]) {
        [self.iPadNameTextField setText:self.keyChain[@"iPadName"]];
    }
}


- (IBAction)doneAction:(id)sender {
    self.keyChain[@"iPadName"] = self.iPadNameTextField.text;
    
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    [currentInstallation addObject:self.iPadNameTextField.text forKey:@"channels"];
    [currentInstallation saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
        if(succeeded) {
            self.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        else {
            [[[UIAlertView alloc] initWithTitle:@"Error saving iPad Name"
                                        message:[NSString stringWithFormat:@"Error saving iPad Name: %@", error.description]
                                       delegate:nil
                              cancelButtonTitle:@"Try Again"
                              otherButtonTitles:@"Cancel", nil]
             show];
        }
    }];
}

- (IBAction)cancelIcon:(id)sender {
    self.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end