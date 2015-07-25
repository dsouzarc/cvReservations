//
//  TwoActivityViewController.h
//  CVReservations
//
//  Created by Ryan D'souza on 7/23/15.
//  Copyright (c) 2015 Ryan D'souza. All rights reserved.
//

#import "ViewController.h"
#import "Reservation.h"
#import "ParseCloudManager.h"

@interface TwoActivityViewController : ViewController

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil floorNumber:(NSString*)floorNumber reservations:(NSMutableArray*)reservations;

@end
