//
//  ParseCloudManager.m
//  CVReservations
//
//  Created by Ryan D'souza on 7/24/15.
//  Copyright (c) 2015 Ryan D'souza. All rights reserved.
//

#import "ParseCloudManager.h"

@implementation ParseCloudManager

+ (Reservation*) getNextReservationForGame:(NSString *)game
{
    PFQuery *query = [PFQuery queryWithClassName:@"Reservations"];
    [query whereKey:@"game" equalTo:game];
    NSError *error;
    NSArray *objects = [query findObjects:&error];
    
    if(error) {
        NSLog(@"ERROR\t%@", error.description);
    }
    
    double currentTime = CACurrentMediaTime();
    Reservation *nextReservation;
    
    for(PFObject *object in objects) {
        Reservation *reservation = [[Reservation alloc] initWithParseObject:object];
        
        //If this happens in the future
        if(reservation.startTime > currentTime) {
            //If we haven't stored another reservation
            if(!nextReservation) {
                nextReservation = reservation;
            }
            
            //Compare both reservations
            else {
                //If one is before the other, that's the closest one
                if(reservation.startTime < nextReservation.startTime) {
                    nextReservation = reservation;
                }
            }
        }
    }
    return nextReservation;
}

@end
