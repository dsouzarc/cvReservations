//
//  ParseCloudManager.h
//  CVReservations
//
//  Created by Ryan D'souza on 7/24/15.
//  Copyright (c) 2015 Ryan D'souza. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

#import "Reservation.h"

@interface ParseCloudManager : NSObject

+ (Reservation*) getNextReservationForGame:(NSString*)game;

@end
