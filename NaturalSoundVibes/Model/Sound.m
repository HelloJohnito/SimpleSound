//
//  Sound.m
//  NaturalSoundVibes
//
//  Created by Lee, John on 5/3/20.
//  Copyright © 2020 John. All rights reserved.
//

#import "Sound.h"

@interface Sound(){
    AVAudioPlayer *audioClip;
    BOOL selectedFlag;
}
@end



@implementation Sound
- (instancetype)initWithIconLabel:(NSString*)soundLabel withSelectedLabel:(NSString*)selectedSoundLabel{
    if (self = [super init]) {
        _name = soundLabel;
        _icon = [UIImage imageNamed:soundLabel];
        _selectedIcon = [UIImage imageNamed:selectedSoundLabel];
        audioClip = [self setUpAudio:soundLabel];
        selectedFlag = NO;
    }
    return self;
}

- (void)playAudioClip{
    [audioClip play];
}

- (void)pauseAudioClip{
    [audioClip pause];
}

- (void)changeVolume:(float)i{
    audioClip.volume = i;
}

- (BOOL)isSelected{
    return selectedFlag;
}

- (void)setSelectedFlag:(BOOL)b{
    selectedFlag = b;
}

- (AVAudioPlayer*)setUpAudio:(NSString*)label{
    NSString *path = [[NSBundle mainBundle] pathForResource:label ofType:@"mp3"];
    NSURL *url = [NSURL URLWithString:path];
    AVAudioPlayer *currentSound;
    currentSound = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:NULL];
    currentSound.numberOfLoops = -1;
    currentSound.volume = 0.50;
    return currentSound;
}


@end
