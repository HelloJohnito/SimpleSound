//
//  PageOneViewController.m
//  NaturalSoundVibes
//
//  Created by Lee, John on 5/4/20.
//  Copyright © 2020 John. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeView.h"
#import "PageViewController.h"
#import "PageOneViewController.h"
#import "PageTwoViewController.h"
#import "PageThreeViewController.h"
#import "Sound.h"
#import "Constants.h"
#import <MoPub/MoPub.h>

@interface HomeViewController()<PageViewControllerDelegate, MPAdViewDelegate>{
    NSArray *pages;
    HomeView *homeView;
    PageOneViewController *pageOneViewController;
    PageTwoViewController *pageTwoViewController;
    PageThreeViewController *pageThreeViewController;
    
    NSMutableArray* allSounds;
    
    MPAdView* mopubBannerView;
}
@end


@implementation HomeViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configureNavigationBar];
    [self setState];
    [self setUI];
}

- (void)configureNavigationBar{
    UIImage *image = [[UIImage imageNamed:@"HamburgerIcon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(clickMenuBar:)];
}

- (void)setState{
    allSounds = [[NSMutableArray alloc] init];
    _pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:NULL];
    _pageViewController.dataSource = self;
    _pageViewController.delegate = self;
    
    pageOneViewController = [[PageOneViewController alloc] init];
    pageOneViewController.delegate = self;
    
    pageTwoViewController = [[PageTwoViewController alloc] init];
    pageTwoViewController.delegate = self;
    
    pageThreeViewController = [[PageThreeViewController alloc] init];
    pageThreeViewController.delegate = self;
    
    pages = [[NSArray alloc] initWithObjects:pageOneViewController,pageTwoViewController,pageThreeViewController, nil];
    [_pageViewController setViewControllers:@[pages[0]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    _pageControl = [[UIPageControl alloc] init];
    _pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    _pageControl.pageIndicatorTintColor = [UIColor grayColor];
    _pageControl.numberOfPages = [pages count];
    _pageControl.currentPage = 0;
    _pageControl.userInteractionEnabled = NO;
}

- (void)setUI{
    homeView = [[HomeView alloc] initWithVC:self];
    [homeView setHomeViewUI];
    [self addMoPubAdView];
}

- (void)clickMenuBar:(UIBarButtonItem*)sender{
    [self.delegate handleMenuToggle: NULL];
}


- (void)clickPlayButton:(UIButton*)sender{
    extern BOOL gIsOn;
    if(gIsOn){
        [self pauseAllMusic];
    } else {
        for(int i = 0; i < [allSounds count]; i++){
            Sound* currentSound = [allSounds objectAtIndex:i];
            if([currentSound isSelected]){
                [currentSound playAudioClip];
            }
        }
        [homeView setPlayButtonImage:@"PauseButton"];
    }
    gIsOn = !gIsOn;
}

- (void)pauseAllMusic{
    for(int i = 0; i < [allSounds count]; i++){
        Sound* currentSound = [allSounds objectAtIndex:i];
        [currentSound pauseAudioClip];
    }
    
    [homeView setPlayButtonImage:@"PlayButton"];
}


- (void)addMoPubAdView{
    mopubBannerView = [[MPAdView alloc] initWithAdUnitId:MOPUB_ADUNIT_ID];
    mopubBannerView.delegate = self;
    [homeView setUpBottomStack:mopubBannerView];
    [mopubBannerView loadAd];
}

#pragma mark - PageViewControllerDelegate
- (void)sendSoundObjects:(NSMutableArray *)sounds{
    for(int i = 0; i < [sounds count]; i++){
        Sound *currentSound = [sounds objectAtIndex:i];
        [allSounds addObject:currentSound];
    }
}


#pragma mark - UIPageViewControllerDataSource, UIPageViewControllerDelegate
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    
    NSInteger vcIndex = [pages indexOfObject:viewController];
    NSInteger previousIndex = vcIndex - 1;
    if(previousIndex < 0){
        return NULL;
    }
    
    NSInteger length = [pages count];
    if(previousIndex >= length){
        return NULL;
    }
    return pages[previousIndex];    
}


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    
    NSInteger vcIndex = [pages indexOfObject:viewController];
    NSInteger nextIndex = vcIndex + 1;
    if(nextIndex < 0){
        return NULL;
    }
    
    NSInteger length = [pages count];
    if(nextIndex >= length){
        return NULL;
    }
    return pages[nextIndex];
}


- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed{
    UIViewController *currentVC = [pageViewController.viewControllers objectAtIndex:0];
    NSInteger vcIndex = [pages indexOfObject:currentVC];
    _pageControl.currentPage = vcIndex;
}


#pragma mark - <MPAdViewDelegate>
- (UIViewController *)viewControllerForPresentingModalView {
    return self;
}

@end
