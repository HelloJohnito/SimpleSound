//
//  PageOneViewController.m
//  NaturalSoundVibes
//
//  Created by Lee, John on 5/4/20.
//  Copyright © 2020 John. All rights reserved.
//

#import "PageOneViewController.h"
#import "Sound.h"
#import "FrameView.h"

@interface PageOneViewController(){
    NSMutableArray* sounds;
    NSArray* soundLabels;
    NSArray* soundLabelsSelected;
}
@end


@implementation PageOneViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    soundLabels = @[@"Rain", @"Thunder", @"Wind", @"FirePlace", @"Bird", @"Night"];
    soundLabelsSelected = @[@"RainSelected", @"ThunderSelected", @"WindSelected", @"FirePlaceSelected", @"BirdSelected", @"NightSelected"];
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
