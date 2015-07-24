//
//  Reservation.m
//  CVReservations
//
//  Created by Ryan D'souza on 7/24/15.
//  Copyright (c) 2015 Ryan D'souza. All rights reserved.
//

#import "Reservation.h"

@implementation Reservation

- (instancetype) initWithReservationID:(NSString *)reservationID gameIdentifier:(NSString *)gameIdentifier status:(NSString *)status reservationDescription:(NSString *)reservationDescription startTime:(NSInteger)startTime numberOfPlayers:(NSInteger)numberOfPlayers neededPlayers:(NSInteger)neededPlayers
{
    self = [super init];
    
    if(self) {
        self.reservationID = reservationID;
        self.gameIdentifier = gameIdentifier;
        self.status = status;
        self.reservationDescription = reservationDescription;
        self.startTime = startTime;
        self.numberOfPlayers = numberOfPlayers;
        self.neededPlayers = neededPlayers;
    }
    return self;
}

@end