//
//  ContainerController.m
//  NaturalSoundVibes
//
//  Created by Lee, John on 5/6/20.
//  Copyright © 2020 John. All rights reserved.
//

#import "ContainerViewController.h"
#import "HomeViewController.h"
#import "MenuViewController.h"
#import "AboutPageViewController.h"
#import "TimerPageViewController.h"
#import "TimerHandler.h"

BOOL gIsOn = NO;

@interface ContainerViewController(){
    MenuViewController* menuVC;
    HomeViewController *homeVC;
    UIViewController* centerVC;
    BOOL isExpanded;
    
    TimerHandler* timer;
}
@end


@implementation ContainerViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    isExpanded = NO;
    timer = [[TimerHandler alloc]init];
    timer.containerVC = self;
    [self setUpHomeViewController];
}

- (void)setUpHomeViewController{
    homeVC = [[HomeViewController alloc] init];
    homeVC.delegate = self;
    centerVC = [[UINavigationController alloc] initWithRootViewController:homeVC];
    [self.view addSubview:centerVC.view];
    [self addChildViewController:centerVC];
    [centerVC didMoveToParentViewController:self];
}

- (void)setUpMenuViewController{
    if(menuVC == nil){
        menuVC = [[MenuViewController alloc] init];
        menuVC.delegate = self;
        [self.view insertSubview:menuVC.view atIndex:0];
        [self addChildViewController:menuVC];
        [menuVC didMoveToParentViewController:self];
        
    }
}

- (UIViewController*)getCenterController{
    return centerVC;
}


- (void)animatePanel:(BOOL)shouldExpand withNumber:(nullable NSNumber*)n{
    if(shouldExpand){
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            CGRect frame = [self getCenterController].view.frame;
            frame.origin.x = [self getCenterController].view.frame.size.width - 80;
            [self getCenterController].view.frame = frame;
        } completion:nil];
    } else {
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            CGRect frame = [self getCenterController].view.frame;
            frame.origin.x = 0;
            [self getCenterController].view.frame = frame;
        } completion:nil];
        
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            CGRect frame = [self getCenterController].view.frame;
            frame.origin.x = 0;
            [self getCenterController].view.frame = frame;
        } completion:^(BOOL finished){
            if(n != NULL){
                [self didSelectMenuOption:n];
            }
        }];
    }
}

- (void)didSelectMenuOption:(NSNumber*)n{
    switch ([n integerValue]) {
        case 0:{
            TimerPageViewController *timerPageVC = [[TimerPageViewController alloc] init];
            timer.timerPageVC = timerPageVC;
            timerPageVC.timer = timer;
            UINavigationController *nVC = [[UINavigationController alloc] initWithRootViewController:timerPageVC];
            [self presentViewController:nVC animated:YES completion:nil];
            break;
        }
        case 1:{
            AboutPageViewController *aboutPageVC = [[AboutPageViewController alloc] init];
            UINavigationController *nVC = [[UINavigationController alloc] initWithRootViewController:aboutPageVC];
            [self presentViewController:nVC animated:YES completion:nil];
            break;
        }
        default:
            break;
    }
}

- (void)turnOffSound{
    if(gIsOn){
        [homeVC pauseAllMusic];
        gIsOn = !gIsOn;
    }
    
}

#pragma mark - <HomeViewDelegate>
- (void)handleMenuToggle:(NSNumber*)n{
    if (!isExpanded){
        [self setUpMenuViewController];
    }
    isExpanded = !isExpanded;
    [self animatePanel:isExpanded withNumber:n];
}


@end
