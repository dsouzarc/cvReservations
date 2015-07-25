//
//  TwoActivityViewController.m
//  CVReservations
//
//  Created by Ryan D'souza on 7/23/15.
//  Copyright (c) 2015 Ryan D'souza. All rights reserved.
//

#import "TwoActivityViewController.h"

@interface TwoActivityViewController ()

@property (strong, nonatomic) IBOutlet UIView *topActivityView;
@property (strong, nonatomic) IBOutlet UIView *bottomActivityView;

@property (strong, nonatomic) NSMutableArray *reservations;
@property (strong, nonatomic) NSString *floorNumber;

@property (strong, nonatomic) Reservation *firstReservation;
@property (strong, nonatomic) Reservation *secondReservation;
@end

@implementation TwoActivityViewController

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil floorNumber:(NSString*)floorNumber reservations:(NSMutableArray *)reservations
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self) {
        self.floorNumber = floorNumber;
        self.reservations = reservations;

    }
    return self;
}

- (void) viewDidLoad
{
    [self updateUIWithInfo];
}

- (void) updateUIWithInfo
{
    if([self.floorNumber isEqualToString:@"FourthFloor"]) {
        Reservation *poolTable = [ParseCloudManager getNextReservationForGame:@"pool"];
        Reservation *foozBall = [ParseCloudManager getNextReservationForGame:@"soccer"];
        
        NSLog(@"Got something");
        
        if([poolTable.status isEqualToString:@"reserved"] || [poolTable.status isEqualToString:@"closed"]) {
            UIView *reservedActivity = (UIView*) [[NSBundle mainBundle] loadNibNamed:@"TwoActivityReservedView" owner:self options:nil][0];
            reservedActivity.frame = self.topActivityView.frame;
            
            UILabel *gameName = (UILabel*) [reservedActivity viewWithTag:100];
            gameName.text = @"Pool";
            
            UILabel *timeLabel = (UILabel*) [reservedActivity viewWithTag:200];
            timeLabel.text = [self dateInHHMM:[self dateToNearest15Minutes]];
            labelToUpdate = timeLabel;
            reservationToShow = poolTable;
            [self.view addSubview:reservedActivity];
            
            NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(doSomething) userInfo:nil repeats: YES];
            
        }
        else {
            UIView *openActivity = (UIView*) [[NSBundle mainBundle] loadNibNamed:@"TwoActivityOpenView" owner:self options:nil][0];
            UILabel *gameName = (UILabel*) [openActivity viewWithTag:100];
            gameName.text = @"Pool";
            
            UILabel *timeLabel = (UILabel*) [openActivity viewWithTag:200];
            timeLabel.text = @"HEYYY"; //[self dateInHHMM:[self dateToNearest15Minutes]];
            
            openActivity.frame = self.topActivityView.frame;
            [self.view addSubview:openActivity];
        }
        
    }
}

- (NSString *)stringFromTimeInterval:(NSTimeInterval)interval
{
    NSInteger ti = (NSInteger)interval;
    NSInteger seconds = ti % 60;
    NSInteger minutes = (ti / 60) % 60;
    NSInteger hours = (ti / 3600);
    return [NSString stringWithFormat:@"%02i:%02i", minutes, seconds];
}

static UILabel *labelToUpdate;
static Reservation *reservationToShow;

- (void) doSomething
{
    labelToUpdate.text = [self stringFromTimeInterval:[[self dateToNearest15Minutes] timeIntervalSinceDate:[reservationToShow getNSDate]]];
}

- (NSString*) dateInHHMM:(NSDate*)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    return [dateFormatter stringFromDate:date];
}

- (NSDate *)dateToNearest15Minutes {
    NSDateComponents *time = [[NSCalendar currentCalendar]
                              components:NSHourCalendarUnit | NSMinuteCalendarUnit
                              fromDate:[NSDate date]];
    NSInteger minutes = [time minute];
    float minuteUnit = ceil((float) minutes / 15.0);
    minutes = minuteUnit * 15.0;
    [time setMinute: minutes];
    return [[NSCalendar currentCalendar] dateFromComponents:time];
}

@end