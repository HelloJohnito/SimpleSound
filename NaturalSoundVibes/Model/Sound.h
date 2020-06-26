//
//  Sound.h
//  NaturalSoundVibes
//
//  Created by Lee, John on 5/3/20.
//  Copyright © 2020 John. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

@interface Sound : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) UIImage *icon;
@property (nonatomic, strong) UIImage *selectedIcon;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UISlider *slider;

- (instancetype)initWithIconLabel:(NSString*)soundLabel withSelectedLabel:(NSString*)selectedSoundLabel;
- (void)playAudioClip;
- (void)pauseAudioClip;
- (void)changeVolume:(float)i;
- (BOOL)isSelected;
- (void)setSelectedFlag:(BOOL)b;
@end
