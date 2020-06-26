//
//  PageViewController.h
//  NaturalSoundVibes
//
//  Created by Lee, John on 5/5/20.
//  Copyright © 2020 John. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Protocols.h"


@interface PageViewController : UIViewController
@property(nonatomic, strong) id<PageViewControllerDelegate> delegate;
- (void)setStateWithLabels:(NSArray*)soundLabels withSelectedLabels:(NSArray*)soundLabelsSelected;
- (void)setUI;
- (void)clickSoundButton:(UIGestureRecognizer*)sender;
- (void)handleSliderChange:(UISlider*)sender;
@end
