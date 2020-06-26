//
//  FrameView.m
//  NaturalSoundVibes
//
//  Created by Lee, John on 5/5/20.
//  Copyright © 2020 John. All rights reserved.
//

#import "FrameView.h"
#import "PageOneViewController.h"
#import "Sound.h"

@interface FrameView(){
    UIViewController *targetVC;
    NSMutableArray *sounds;
}
@end


@implementation FrameView
- (instancetype)initWithVC:(UIViewController*)vc withSounds:(NSMutableArray*)s{
    if (self = [super init]) {
        targetVC = vc;
        sounds = s;
    }
    return self;
}

- (void)setPageViewUI{
    PageViewController* currentVC = (PageViewController*) targetVC;
    UIView* prev;
    for(int i = 0; i < [sounds count]; i++){
        UIView *frameView = [[UIView alloc] init];
//        frameView.layer.borderWidth = 0.2;
        [currentVC.view addSubview:frameView];
        frameView.translatesAutoresizingMaskIntoConstraints = NO;
        [frameView.widthAnchor constraintEqualToAnchor:currentVC.view.widthAnchor multiplier:.5].active = YES;
        [frameView.heightAnchor constraintEqualToAnchor:currentVC.view.heightAnchor multiplier:.333].active = YES;
        
        if(i == 0 || i == 3){
            [frameView.topAnchor constraintEqualToAnchor: currentVC.view.topAnchor].active = YES;
        } else {
            [frameView.topAnchor constraintEqualToAnchor:prev.bottomAnchor].active = YES;
        }
        
        if(i < 3){
            [frameView.leadingAnchor constraintEqualToAnchor:currentVC.view.leadingAnchor].active = YES;
        } else {
            [frameView.trailingAnchor constraintEqualToAnchor:currentVC.view.trailingAnchor].active = YES;
        }
        
        prev = frameView;
        
        [self setImageAndSliderToFrame:frameView withNum:i];
    }
}

- (void)setImageAndSliderToFrame:(UIView*)frameView withNum:(int)i{
    Sound *sound = [sounds objectAtIndex:i];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:sound.icon];
    imageView.tag = i;
    imageView.userInteractionEnabled = YES;
    [self addGestureRecogniser:imageView];
    [frameView addSubview: imageView];
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [imageView.centerXAnchor constraintEqualToAnchor:frameView.centerXAnchor].active = YES;
    [imageView.centerYAnchor constraintEqualToAnchor:frameView.centerYAnchor].active = YES;
    sound.imageView = imageView;
    
    UISlider *volumeSlider = [[UISlider alloc] init];
    volumeSlider.minimumTrackTintColor = [UIColor redColor];
    volumeSlider.maximumTrackTintColor = [UIColor blackColor];
    volumeSlider.tag = i;
    volumeSlider.value = .50;
    volumeSlider.alpha = 0;
    [volumeSlider addTarget:targetVC action:@selector(handleSliderChange:) forControlEvents:UIControlEventValueChanged];
    [frameView addSubview: volumeSlider];
    volumeSlider.translatesAutoresizingMaskIntoConstraints = NO;
    [volumeSlider.heightAnchor constraintEqualToConstant:30].active = YES;
    [volumeSlider.topAnchor constraintEqualToAnchor:imageView.bottomAnchor].active = YES;
    [volumeSlider.leadingAnchor constraintEqualToAnchor:imageView.leadingAnchor constant:-10].active = YES;
    [volumeSlider.trailingAnchor constraintEqualToAnchor:imageView.trailingAnchor].active = YES;
    sound.slider = volumeSlider;
}

-(void)addGestureRecogniser:(UIView *)touchView{
    UITapGestureRecognizer *singleTap=[[UITapGestureRecognizer alloc]initWithTarget:targetVC action:@selector(clickSoundButton:)];
    [touchView addGestureRecognizer:singleTap];
}

- (void)clickSoundButton:(UIGestureRecognizer*)sender{};
- (void)handleSliderChange:(UISlider*)sender{};

@end
