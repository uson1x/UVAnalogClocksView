//
//  UVViewController.m
//  UVAnalogClocksView
//
//  Created by Ivan Parfenchuk on 09.05.13.
//  Copyright (c) 2013 Ivan Parfenchuk. All rights reserved.
//

#import "UVViewController.h"
#import "UVAnalogClocksView.h"

@interface UVViewController ()
@property (weak, nonatomic) IBOutlet UVAnalogClocksView * clocksView;

- (IBAction)selectedTimeChanged:(UIDatePicker*)sender;
@end

@implementation UVViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.clocksView.hourHandImage = [UIImage imageNamed:@"hour-hand.png"];
    self.clocksView.minuteHandImage = [UIImage imageNamed:@"minute-hand.png"];
    self.clocksView.backgroundImage = [UIImage imageNamed:@"clock-background.png"];
    [self.clocksView setTime:[NSDate date] animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectedTimeChanged:(UIDatePicker*)sender
{
    [self.clocksView setTime:sender.date animated:YES];
}

@end
