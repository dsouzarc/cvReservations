//
//  FourActivityViewController.h
//  CVReservations
//
//  Created by Ryan D'souza on 7/23/15.
//  Copyright (c) 2015 Ryan D'souza. All rights reserved.
//

#import "ViewController.h"

#import "Reservation.h"

@interface FourActivityViewController : ViewController

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil reservations:(NSMutableArray*)reservations;

@end
