//
//  HomeView.h
//  NaturalSoundVibes
//
//  Created by Lee, John on 5/5/20.
//  Copyright © 2020 John. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MoPub/MoPub.h>
#import "HomeViewController.h"


@interface HomeView: NSObject
- (instancetype)initWithVC:(HomeViewController*)vc;
- (void)setHomeViewUI;
- (void)setUpBottomStack:(MPAdView*)mpAdView;
- (void)setPlayButtonImage:(NSString*)imageName;
@end
