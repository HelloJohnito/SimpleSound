//
//  PageViewController.m
//  NaturalSoundVibes
//
//  Created by Lee, John on 5/5/20.
//  Copyright © 2020 John. All rights reserved.
//

#import "PageViewController.h"
#import "Sound.h"
#import "FrameView.h"

#import "HomeViewController.h"

@interface PageViewController(){
    NSMutableArray* sounds;
    FrameView* frameView;
}
@end

@implementation PageViewController

- (void)setStateWithLabels:(NSArray*)soundLabels withSelectedLabels:(NSArray*)soundLabelsSelected{
    sounds = [[NSMutableArray alloc] init];
    for(int i = 0; i < [soundLabels count]; i++){
        NSString *currentLabel = [soundLabels objectAtIndex: i];
        NSString *currentSelectedLabel = [soundLabelsSelected objectAtIndex:i];
        [sounds addObject:[self generateSoundClassWithLabel:currentLabel selectedLabel:currentSelectedLabel andInt:i]];
    }
    [self.delegate sendSoundObjects:sounds];
}

- (Sound*)generateSoundClassWithLabel:(NSString*)soundLabel selectedLabel:(NSString*)selectedSoundLabel andInt:(int)i{
    Sound *sound = [[Sound alloc] initWithIconLabel:soundLabel withSelectedLabel:selectedSoundLabel];
    return sound;
}

- (void)setUI{
    frameView = [[FrameView alloc] initWithVC:self withSounds:sounds];
    [frameView setPageViewUI];
    Sound *firstSound = [sounds objectAtIndex:0];
    if([firstSound.name isEqualToString:@"Rain"]){
        [firstSound setSelectedFlag: YES];
        firstSound.slider.alpha = 1;
        [firstSound.imageView setImage:firstSound.selectedIcon];
    }
}

- (void)clickSoundButton:(UIGestureRecognizer*)sender{
    extern BOOL gIsOn;
    Sound *currentSound = [sounds objectAtIndex:sender.view.tag];
    UIImageView *currentImageView = currentSound.imageView;
    UISlider *currentSlider = currentSound.slider;
    if(![currentSound isSelected]){
        [currentSound setSelectedFlag:YES];
        currentImageView.image = currentSound.selectedIcon;

        [UIView animateWithDuration:0.2 animations:^{
            currentSlider.alpha = 1;
        }];

        if(gIsOn){
            currentSound = [sounds objectAtIndex:sender.view.tag];
            [currentSound playAudioClip];
        }

    } else {
        [currentSound setSelectedFlag: NO];
        currentImageView.image = currentSound.icon;

        [UIView animateWithDuration:0.2 animations:^{
            currentSlider.alpha = 0;
        }];
        if(gIsOn){
            currentSound = [sounds objectAtIndex:sender.view.tag];
            [currentSound pauseAudioClip];
        }
    }
}

- (void)handleSliderChange:(UISlider*)sender{
    Sound *currentSound = [sounds objectAtIndex:sender.tag];
    [currentSound changeVolume:sender.value];
}

@end
