//
//  MenuViewController.h
//  NaturalSoundVibes
//
//  Created by Lee, John on 5/6/20.
//  Copyright © 2020 John. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Protocols.h"

@interface MenuViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) id<HomeViewControllerDelegate> delegate;
@end

