//
//  Reservation.h
//  CVReservations
//
//  Created by Ryan D'souza on 7/24/15.
//  Copyright (c) 2015 Ryan D'souza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Reservation : NSObject

@property (strong, nonatomic) NSString *reservationID;
@property (strong, nonatomic) NSString *gameIdentifier;

@property (strong, nonatomic) NSString *status;
@property (strong, nonatomic) NSString *reservationDescription;

@property NSInteger startTime;
@property NSInteger numberOfPlayers;
@property NSInteger neededPlayers;

- (instancetype) initWithReservationID:(NSString*)reservationID gameIdentifier:(NSString*)gameIdentifier status:(NSString*)status reservationDescription:(NSString*)reservationDescription
                             startTime:(NSInteger)startTime numberOfPlayers:(NSInteger)numberOfPlayers neededPlayers:(NSInteger)neededPlayers;

@end
