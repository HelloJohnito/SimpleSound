//
//  Frame.h
//  NaturalSoundVibes
//
//  Created by Lee, John on 5/5/20.
//  Copyright © 2020 John. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FrameView: NSObject
- (instancetype)initWithVC:(UIViewController*)vc withSounds:(NSMutableArray*)s;
- (void)setPageViewUI;
@end
