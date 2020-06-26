//
//  TimerViewController.h
//  NaturalSoundVibes
//
//  Created by Lee, John on 5/7/20.
//  Copyright © 2020 John. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimerHandler.h"
#import "Protocols.h"

@class TimerHandler;

@interface TimerPageViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
@property(nonatomic, strong)TimerHandler* timer;
-(void)timerFinished;
@end
