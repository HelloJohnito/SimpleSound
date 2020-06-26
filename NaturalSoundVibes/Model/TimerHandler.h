//
//  TimerHandler.h
//  NaturalSoundVibes
//
//  Created by Lee, John on 5/9/20.
//  Copyright © 2020 John. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TimerPageViewController.h"
#import "ContainerViewController.h"

@class TimerPageViewController;


@interface TimerHandler : NSObject
@property(nonatomic, weak)TimerPageViewController *timerPageVC;
@property(nonatomic, strong)ContainerViewController *containerVC;
@property(nonatomic, strong)NSTimer *timer;
@property(nonatomic, strong)UITextField *textField;
@property(nonatomic, strong)NSString *hour;
@property(nonatomic, strong)NSString *minutes;
@property(nonatomic, strong)NSString *seconds;
@property(nonatomic, assign)BOOL isOn;

- (void)startTimer;
- (void)stopTimer;
- (void)displayTime;
@end
