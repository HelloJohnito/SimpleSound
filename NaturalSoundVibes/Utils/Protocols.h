//
//  Protocols.h
//  NaturalSoundVibes
//
//  Created by Lee, John on 5/6/20.
//  Copyright © 2020 John. All rights reserved.
//

@protocol HomeViewControllerDelegate <NSObject>
- (void)handleMenuToggle:(nullable NSNumber*)n;
@end

@protocol PageViewControllerDelegate <NSObject>
- (void)sendSoundObjects:(nullable NSMutableArray*)sounds;
@end



