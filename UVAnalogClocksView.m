//
//  AnalogClocksView.m
//  ReminderApp
//
//  Created by Tarmeez Digital on 02.02.12.
//  Copyright (c) 2012 Tarmeez Digital. All rights reserved.
//

#import "UVAnalogClocksView.h"
#import "QuartzCore/QuartzCore.h"

@interface UVAnalogClocksView()

@property (nonatomic, strong) UIImageView * backgroundImageView;
@property (nonatomic, strong) UIImageView * hourHandImageView;
@property (nonatomic, strong) UIImageView * minuteHandImageView;

- (void)setupView;

@end 

@implementation UVAnalogClocksView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
		[self setupView];
    }
    return self;
}

- (void)awakeFromNib
{
	[self setupView];
}

- (void)setupView
{
	self.backgroundColor = [UIColor clearColor];
	
	self.backgroundImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    self.backgroundImageView.contentMode = UIViewContentModeCenter;
    self.backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;;
	[self addSubview:self.backgroundImageView];
	
    self.hourHandImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    self.hourHandImageView.contentMode = UIViewContentModeCenter;
    self.hourHandImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
	[self addSubview:self.hourHandImageView];
    
	self.minuteHandImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    self.minuteHandImageView.contentMode = UIViewContentModeCenter;
    self.minuteHandImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
	[self addSubview:self.minuteHandImageView];
}

- (void)setTime:(NSDate*)time
{
	[self setTime:time animated:YES];
}

- (CGFloat)degreesToRadians:(CGFloat)degrees
{
    return degrees * M_PI / 180;
}

- (void)setTime:(NSDate *)time animated:(BOOL)animated
{
	NSDateComponents *timeComponents = [[NSCalendar currentCalendar] components:(NSHourCalendarUnit | NSMinuteCalendarUnit) 
                                                                       fromDate:time];
	NSInteger hour = timeComponents.hour;
	NSInteger minute = timeComponents.minute;
	
	// Assuming that we have 60 minutes in 1 hour and 12 hours on a clock face
	// PM handling
	if (hour > 12) hour -= 12;
	
	// Set angles for each of the hands
	CGFloat minuteAngle = [self degreesToRadians:minute / 60.0 * 360];
	CGFloat hourAngle = [self degreesToRadians:(hour / 12.0 * 360) + minuteAngle / 12.0];
	
	if(animated)
	{
		[UIView animateWithDuration:1.1f 
							  delay:0.0f
							options:UIViewAnimationOptionCurveEaseInOut
						 animations:^{
                             
                             self.minuteHandImageView.transform = CGAffineTransformMakeRotation(minuteAngle);
                             self.hourHandImageView.transform = CGAffineTransformMakeRotation(hourAngle);
                             
						 } 
						 completion:nil];
	}
	else
	{
        self.minuteHandImageView.transform = CGAffineTransformMakeRotation(minuteAngle);
        self.hourHandImageView.transform = CGAffineTransformMakeRotation(hourAngle);
	}
}

- (void)setBackgroundImage:(UIImage *)backgroundImage
{
    if (_backgroundImage != backgroundImage) {
        _backgroundImage = backgroundImage;
        self.backgroundImageView.image = backgroundImage;
    }
}

- (void)setMinuteHandImage:(UIImage *)minuteHandImage
{
    if (_minuteHandImage != minuteHandImage) {
        _minuteHandImage = minuteHandImage;
        self.minuteHandImageView.image = minuteHandImage;
    }
}

- (void)setHourHandImage:(UIImage *)hourHandImage
{
    if (_hourHandImage != hourHandImage) {
        _hourHandImage = hourHandImage;
        self.hourHandImageView.image = hourHandImage;
    }
}

@end
