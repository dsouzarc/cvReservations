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

- (instancetype) initWithParseObject:(PFObject *)object
{
    NSString *reservationID = [object objectId];
    NSString *description = object[@"gameDescription"];
    NSString *game = object[@"game"];
    NSLog(@"START TIME: %@\t%@", object[@"startTime"], reservationID);
    NSInteger startTime;
    if(object[@"startTime"]) {
        startTime = [object[@"startTime"] integerValue];
    }
    else {
        startTime = CACurrentMediaTime();
    }
    NSLog(@"Finished somethign");
    NSString *status = object[@"gameStatus"];
    NSInteger players = [object[@"players"] integerValue];
    NSInteger needed = [object[@"needed"] integerValue];
    self = [self initWithReservationID:reservationID gameIdentifier:game status:status reservationDescription:description startTime:startTime numberOfPlayers:players neededPlayers:needed];
    return self;
}

- (NSDate*) getNSDate
{
    NSLog(@"HERE: %ld", (long)self.startTime);
    NSDate *reservationDate = [[NSDate alloc] initWithTimeIntervalSince1970:(self.startTime/1000)];
    return reservationDate;
}

- (NSString*) getHHMMdateFormat
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    return [dateFormatter stringFromDate:[self getNSDate]];
}

@end