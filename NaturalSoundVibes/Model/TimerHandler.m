//
//  TimerHandler.m
//  NaturalSoundVibes
//
//  Created by Lee, John on 5/9/20.
//  Copyright © 2020 John. All rights reserved.
//

#import "TimerHandler.h"

@interface TimerHandler(){
}
@end



@implementation TimerHandler
- (instancetype)init{
    self = [super init];
    if(self) {
        _textField = [[UITextField alloc] init];
        _hour = @"00";
        _minutes = @"00";
        _seconds = @"00";
        _isOn = NO;
    }
    return self;
}

- (void)startTimer{
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDownTimer:) userInfo:nil repeats:YES];
}

- (void)stopTimer{
    if(_timer){
        [_timer invalidate];
        _timer = nil;
    }
}

- (void)displayTime{
    _textField.text = [NSString stringWithFormat:@"%@:%@:%@", _hour, _minutes, _seconds];
}

- (void)countDownTimer:(NSTimer*)sender{
    int h = [_hour intValue];
    int m = [_minutes intValue];
    int s = [_seconds intValue];
    s-=1;
    if(h == 0 && m == 0 && s < 0){
        [_timer invalidate];
        _timer = nil;
        _isOn = !_isOn;
        if(_timerPageVC != nil){
            [_timerPageVC timerFinished];
        }
        [_containerVC turnOffSound];
        return;
    }
    if(s < 0){
        s = 59;
        if(m > 0){
            m-=1;
        } else if(m == 0 && h > 0){
            m=59;
            h-=1;
        }
    }
    
    _hour = h < 10 ? [NSString stringWithFormat:@"0%i", h] : [NSString stringWithFormat:@"%i", h];
    _minutes = m < 10 ? [NSString stringWithFormat:@"0%i", m] : [NSString stringWithFormat:@"%i", m];
    _seconds = s < 10 ? [NSString stringWithFormat:@"0%i", s] : [NSString stringWithFormat:@"%i", s];
    [self displayTime];
}

@end
