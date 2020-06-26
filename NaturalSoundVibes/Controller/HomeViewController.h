//
//  PageOneViewController.h
//  NaturalSoundVibes
//
//  Created by Lee, John on 5/4/20.
//  Copyright © 2020 John. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Protocols.h"


@interface HomeViewController : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate>
@property(nonatomic, strong) id<HomeViewControllerDelegate> delegate;
@property (nonatomic, strong) UIPageViewController *pageViewController;
@property (nonatomic, strong) UIPageControl *pageControl;

- (void)pauseAllMusic;
@end


