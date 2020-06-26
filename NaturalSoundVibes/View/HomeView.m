//
//  HomeView.m
//  NaturalSoundVibes
//
//  Created by Lee, John on 5/5/20.
//  Copyright © 2020 John. All rights reserved.
//

#import "HomeView.h"

@interface HomeView(){
    HomeViewController *targetVC;
    UIButton *playButton;
}
@end

@implementation HomeView
- (instancetype)initWithVC:(HomeViewController*)vc{
    if (self = [super init]) {
        targetVC = vc;
    }
    return self;
}

-(void)setHomeViewUI{
    [targetVC.view addSubview:targetVC.pageViewController.view];
    targetVC.pageViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
    [targetVC.pageViewController.view.widthAnchor constraintEqualToAnchor: targetVC.view.widthAnchor].active = YES;
    [targetVC.pageViewController.view.heightAnchor constraintEqualToAnchor: targetVC.view.safeAreaLayoutGuide.heightAnchor multiplier:0.80].active = YES;
    [targetVC.pageViewController.view.topAnchor constraintEqualToAnchor: targetVC.view.safeAreaLayoutGuide.topAnchor].active = YES;
    [targetVC.pageViewController.view.leadingAnchor constraintEqualToAnchor: targetVC.view.leadingAnchor].active = YES;
    [targetVC.pageViewController.view.trailingAnchor constraintEqualToAnchor: targetVC.view.trailingAnchor].active = YES;
    
    // pageControl
    [targetVC.pageViewController.view addSubview:targetVC.pageControl];
    targetVC.pageControl.translatesAutoresizingMaskIntoConstraints = NO;
    [targetVC.pageControl.widthAnchor constraintEqualToAnchor:targetVC.view.widthAnchor constant:-20].active = YES;
    [targetVC.pageControl.heightAnchor constraintEqualToConstant:20].active = YES;
    [targetVC.pageControl.bottomAnchor constraintEqualToAnchor:targetVC.pageViewController.view.bottomAnchor constant:-5].active = YES;
    [targetVC.pageControl.centerXAnchor constraintEqualToAnchor:targetVC.pageViewController.view.centerXAnchor].active = YES;
    
//    [self setUpBottomStack];
}

- (void)setUpBottomStack:(MPAdView*)mopubBanner{
    UIView* bottomStackView = [[UIView alloc] init];
    [targetVC.view addSubview:bottomStackView];
    bottomStackView.translatesAutoresizingMaskIntoConstraints = NO;
    [bottomStackView.widthAnchor constraintEqualToAnchor:targetVC.view.widthAnchor].active = YES;
    [bottomStackView.topAnchor constraintEqualToAnchor:targetVC.pageViewController.view.bottomAnchor].active = YES;
    [bottomStackView.bottomAnchor constraintEqualToAnchor:targetVC.view.safeAreaLayoutGuide.bottomAnchor].active = YES;
    [bottomStackView.leadingAnchor constraintEqualToAnchor:targetVC.view.leadingAnchor].active = YES;
    [bottomStackView.trailingAnchor constraintEqualToAnchor:targetVC.view.trailingAnchor].active = YES;
    
    UIView *bottomFrame = [[UIView alloc] init];
    [bottomStackView addSubview: bottomFrame];
    bottomFrame.translatesAutoresizingMaskIntoConstraints = NO;
    [bottomFrame.widthAnchor constraintEqualToAnchor:bottomStackView.widthAnchor].active = YES;
    [bottomFrame.heightAnchor constraintEqualToConstant:50].active = YES;
    [bottomFrame.bottomAnchor constraintEqualToAnchor:bottomStackView.bottomAnchor].active = YES;
    [bottomFrame.leadingAnchor constraintEqualToAnchor:bottomStackView.leadingAnchor].active = YES;
    [bottomFrame.trailingAnchor constraintEqualToAnchor:bottomStackView.trailingAnchor].active = YES;
    
    [bottomFrame addSubview:mopubBanner];
    mopubBanner.translatesAutoresizingMaskIntoConstraints = NO;
    [mopubBanner.widthAnchor constraintEqualToConstant:320].active = YES;
    [mopubBanner.heightAnchor constraintEqualToConstant:50].active = YES;
    [mopubBanner.centerXAnchor constraintEqualToAnchor:bottomFrame.centerXAnchor].active = YES;

    UIView *topFrame = [[UIView alloc] init];
    [bottomStackView addSubview:topFrame];
    topFrame.translatesAutoresizingMaskIntoConstraints = NO;
    [topFrame.widthAnchor constraintEqualToAnchor:bottomStackView.widthAnchor].active = YES;
    [topFrame.topAnchor constraintEqualToAnchor:bottomStackView.topAnchor].active = YES;
    [topFrame.bottomAnchor constraintEqualToAnchor:bottomFrame.topAnchor].active = YES;
    [topFrame.leadingAnchor constraintEqualToAnchor:bottomStackView.leadingAnchor].active = YES;
    [topFrame.trailingAnchor constraintEqualToAnchor:bottomStackView.trailingAnchor].active = YES;
    
    [self setPlayButton:topFrame];
}

- (void)setPlayButton:(UIView*)topFrame{
    playButton = [[UIButton alloc] init];
    [self setPlayButtonImage:@"PlayButton"];
    [playButton addTarget:targetVC action:@selector(clickPlayButton:) forControlEvents:UIControlEventTouchUpInside];
    [topFrame addSubview:playButton];
    playButton.translatesAutoresizingMaskIntoConstraints = NO;
    [playButton.centerXAnchor constraintEqualToAnchor:topFrame.centerXAnchor].active = YES;
    [playButton.centerYAnchor constraintEqualToAnchor:topFrame.centerYAnchor].active = YES;
}

- (void)setPlayButtonImage:(NSString*)imageName{
    UIImage *img= [UIImage imageNamed:imageName];
    [playButton setImage:img forState:UIControlStateNormal];
}

- (void)clickPlayButton:(UIButton*)sender{}

@end
