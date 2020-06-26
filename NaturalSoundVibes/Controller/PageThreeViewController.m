//
//  PageThreeViewController.m
//  NaturalSoundVibes
//
//  Created by Lee, John on 5/10/20.
//  Copyright © 2020 John. All rights reserved.
//

#import "PageThreeViewController.h"
#import "Sound.h"
#import "FrameView.h"

@interface PageThreeViewController(){
    NSMutableArray* sounds;
    NSArray* soundLabels;
    NSArray* soundLabelsSelected;
}
@end


@implementation PageThreeViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    soundLabels = @[@"Fan", @"FireWorks", @"PeopleTalking", @"AirPlane"];
    soundLabelsSelected = @[@"FanSelected", @"FireWorksSelected", @"PeopleTalkingSelected", @"AirPlaneSelected"];
    [super setStateWithLabels:soundLabels withSelectedLabels:soundLabelsSelected];
    [super setUI];
}

- (void)clickSoundButton:(UIGestureRecognizer*)sender{
    [super clickSoundButton:sender];
}

- (void)handleSliderChange:(UISlider*)sender{
    [super handleSliderChange:sender];
}


@end


