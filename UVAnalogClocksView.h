//
//  AnalogClocksView.h
//  ReminderApp
//
//  Created by Tarmeez Digital on 02.02.12.
//  Copyright (c) 2012 Tarmeez Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UVAnalogClocksView : UIView

@property (strong, nonatomic) UIImage * hourHandImage;
@property (strong, nonatomic) UIImage * minuteHandImage;
@property (strong, nonatomic) UIImage * backgroundImage;

- (void)setTime:(NSDate*)time;
- (void)setTime:(NSDate *)time animated:(BOOL)animated;

@end
