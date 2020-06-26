//
//  PageTwoViewController.m
//  NaturalSoundVibes
//
//  Created by Lee, John on 5/4/20.
//  Copyright © 2020 John. All rights reserved.
//

#import "PageTwoViewController.h"
#import "Sound.h"
#import "FrameView.h"

@interface PageTwoViewController(){
    NSMutableArray* sounds;
    NSArray* soundLabels;
    NSArray* soundLabelsSelected;
}
@end


@implementation PageTwoViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    soundLabels = @[@"Waves", @"Walking", @"Siren", @"WaterStream", @"Volcano", @"City"];
    soundLabelsSelected = @[@"WavesSelected", @"WalkingSelected", @"SirenSelected", @"WaterStreamSelected", @"VolcanoSelected",  @"CitySelected"];
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

