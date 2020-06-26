//
//  AboutPageViewController.m
//  NaturalSoundVibes
//
//  Created by Lee, John on 5/6/20.
//  Copyright © 2020 John. All rights reserved.
//

#import "AboutPageViewController.h"

@interface AboutPageViewController(){
    UITextView* textView;
}

@end


@implementation AboutPageViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configureUI];
    [self configureLabel];
}

- (void) configureUI{
    self.navigationController.navigationBar.barTintColor = [UIColor lightGrayColor];
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationItem.title = @"About";
    UIImage *image = [[UIImage imageNamed:@"XButton"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(clickXbutton:)];
}

- (void)configureLabel{
    textView = [[UITextView alloc] init];
    [textView setFont:[UIFont systemFontOfSize:16]];
    textView.text = @"About App: \n\nSimpleVibes is a simple project that I have built to listen to a combination of various sounds. You can set the volume for each sound and adjust it to your liking. You can simply turn this app on for background noise during sleep, study, meditation, and more. \n\nThe images used on this app are all from icons8.com. The icon images for this app are from flaticon.com, specifically from Freepik (https://www.flaticon.com/authors/freepik) and Good Ware (https://www.flaticon.com/free-icon/sun_861076). The sounds were from http://www.freesoundslibrary.com, http://www.orangefreesounds.com, and https://freesound.org. \n\n Thank you, \n John.";
    [self.view addSubview:textView];
    textView.translatesAutoresizingMaskIntoConstraints = NO;
    [textView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = YES;
    [textView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor].active = YES;
    [textView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [textView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
}


- (void)clickXbutton:(UIBarButtonItem*)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end

