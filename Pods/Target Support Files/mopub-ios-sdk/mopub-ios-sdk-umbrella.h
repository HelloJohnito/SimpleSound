#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "MPBannerAdManager.h"
#import "MPBannerAdManagerDelegate.h"
#import "MPBannerCustomEvent+Internal.h"
#import "MPBannerCustomEventAdapter.h"
#import "MPBaseBannerAdapter.h"
#import "MPPrivateBannerCustomEventDelegate.h"
#import "MPActivityViewControllerHelper+TweetShare.h"
#import "MPActivityViewControllerHelper.h"
#import "MPAdConfiguration.h"
#import "MPAdDestinationDisplayAgent.h"
#import "MPAdImpressionTimer.h"
#import "MPAdServerCommunicator.h"
#import "MPAdServerURLBuilder.h"
#import "MPAPIEndpoints.h"
#import "MPClosableView.h"
#import "MPCountdownTimerView.h"
#import "MPEnhancedDeeplinkRequest.h"
#import "MPLastResortDelegate.h"
#import "MPProgressOverlayView.h"
#import "MPRealTimeTimer.h"
#import "MPURLActionInfo.h"
#import "MPURLResolver.h"
#import "MPVideoConfig.h"
#import "MPXMLParser.h"
#import "MPAdWebViewAgent.h"
#import "MPContentBlocker.h"
#import "MPHTMLBannerCustomEvent.h"
#import "MPHTMLInterstitialCustomEvent.h"
#import "MPHTMLInterstitialViewController.h"
#import "MPWebView.h"
#import "MPBaseInterstitialAdapter.h"
#import "MPInterstitialAdManager.h"
#import "MPInterstitialAdManagerDelegate.h"
#import "MPInterstitialCustomEventAdapter.h"
#import "MPInterstitialViewController.h"
#import "MPPrivateInterstitialCustomEventDelegate.h"
#import "MPAdServerKeys.h"
#import "MPATSSetting.h"
#import "MPConsentDialogViewController.h"
#import "MPConsentManager.h"
#import "MPCoreInstanceProvider+MRAID.h"
#import "MPCoreInstanceProvider.h"
#import "MPDeviceInformation.h"
#import "MPDiskLRUCache.h"
#import "MPExtendedHitBoxButton.h"
#import "MPHTTPNetworkSession.h"
#import "MPHTTPNetworkTaskData.h"
#import "MPMediationManager.h"
#import "MPMemoryCache.h"
#import "MPNativeAdError.h"
#import "MPNetworkStatus.h"
#import "MPRateLimitConfiguration.h"
#import "MPRateLimitManager.h"
#import "MPReachabilityManager.h"
#import "MPURL.h"
#import "MPURLRequest.h"
#import "MPVASTInterstitialCustomEvent.h"
#import "MPVASTTracking.h"
#import "MPWebBrowserUserAgentInfo.h"
#import "MPForceableOrientationProtocol.h"
#import "MPMRAIDBannerCustomEvent.h"
#import "MPMRAIDInterstitialCustomEvent.h"
#import "MPMRAIDInterstitialViewController.h"
#import "MRBridge.h"
#import "MRBundleManager.h"
#import "MRCommand.h"
#import "MRConstants.h"
#import "MRController.h"
#import "MRError.h"
#import "MRExpandModalViewController.h"
#import "MRNativeCommandHandler.h"
#import "MRProperty.h"
#import "MRVideoPlayerManager.h"
#import "MoPub+Utility.h"
#import "NSBundle+MPAdditions.h"
#import "NSDate+MPAdditions.h"
#import "NSDictionary+MPAdditions.h"
#import "NSError+MPAdditions.h"
#import "NSHTTPURLResponse+MPAdditions.h"
#import "NSJSONSerialization+MPAdditions.h"
#import "NSMutableArray+MPAdditions.h"
#import "NSString+MPAdditions.h"
#import "NSString+MPConsentStatus.h"
#import "NSURL+MPAdditions.h"
#import "SKStoreProductViewController+MPAdditions.h"
#import "UIButton+MPAdditions.h"
#import "UIColor+MPAdditions.h"
#import "UIView+MPAdditions.h"
#import "MOPUBExperimentProvider.h"
#import "MPAnalyticsTracker.h"
#import "MPError.h"
#import "MPGeolocationProvider.h"
#import "MPGlobal.h"
#import "MPIdentityProvider.h"
#import "MPImageDownloadQueue.h"
#import "MPImageLoader.h"
#import "MPNativeCache.h"
#import "MPReachability.h"
#import "MPSessionTracker.h"
#import "MPStopwatch.h"
#import "MPTimer.h"
#import "MPUserInteractionGestureRecognizer.h"
#import "MPMediaFileCache.h"
#import "MPVASTAd.h"
#import "MPVASTCompanionAd.h"
#import "MPVASTConstant.h"
#import "MPVASTCreative.h"
#import "MPVASTDurationOffset.h"
#import "MPVASTError.h"
#import "MPVASTIndustryIcon.h"
#import "MPVASTInline.h"
#import "MPVASTLinearAd.h"
#import "MPVASTMacroProcessor.h"
#import "MPVASTManager.h"
#import "MPVASTMediaFile.h"
#import "MPVASTModel.h"
#import "MPVASTResource.h"
#import "MPVASTResponse.h"
#import "MPVASTStringUtilities.h"
#import "MPVASTTrackingEvent.h"
#import "MPVASTWrapper.h"
#import "MPVideoEvent.h"
#import "MPVASTCompanionAdView.h"
#import "MPVASTIndustryIconView.h"
#import "MPVASTResourceView.h"
#import "MPVideoPlayer.h"
#import "MPVideoPlayerContainerView.h"
#import "MPVideoPlayerFullScreenVASTAdOverlay.h"
#import "MPVideoPlayerView.h"
#import "MPVideoPlayerViewController.h"
#import "MPVideoPlayerViewOverlay.h"
#import "MPConsoleLogger.h"
#import "MPLogManager.h"
#import "MPBLogger.h"
#import "MPBLogLevel.h"
#import "MPLogEvent.h"
#import "MPLogging.h"
#import "MoPub.h"
#import "MOPUBDisplayAgentType.h"
#import "MPAdapterConfiguration.h"
#import "MPAdConversionTracker.h"
#import "MPAdTargeting.h"
#import "MPAdView.h"
#import "MPAdViewDelegate.h"
#import "MPBannerCustomEvent.h"
#import "MPBannerCustomEventDelegate.h"
#import "MPBaseAdapterConfiguration.h"
#import "MPBool.h"
#import "MPConsentChangedNotification.h"
#import "MPConsentChangedReason.h"
#import "MPConsentError.h"
#import "MPConsentStatus.h"
#import "MPConstants.h"
#import "MPEngineInfo.h"
#import "MPImpressionData.h"
#import "MPImpressionTrackedNotification.h"
#import "MPInterstitialAdController.h"
#import "MPInterstitialAdControllerDelegate.h"
#import "MPInterstitialCustomEvent.h"
#import "MPInterstitialCustomEventDelegate.h"
#import "MPMediationSettingsProtocol.h"
#import "MPMoPubAd.h"
#import "MPMoPubAdPlacer.h"
#import "MPMoPubConfiguration.h"
#import "MPMoPubRewardedPlayableCustomEvent.h"
#import "MPMoPubRewardedVideoCustomEvent.h"
#import "MPPrivateRewardedVideoCustomEventDelegate.h"
#import "MPRewardedVideo+Internal.h"
#import "MPRewardedVideoAdapter.h"
#import "MPRewardedVideoAdManager.h"
#import "MPRewardedVideoConnection.h"
#import "MPRewardedVideo.h"
#import "MPRewardedVideoCustomEvent.h"
#import "MPRewardedVideoError.h"
#import "MPRewardedVideoReward.h"
#import "MPViewabilityAdapter.h"
#import "MPViewabilityOption.h"
#import "MPViewabilityTracker.h"
#import "MPWebView+Viewability.h"

FOUNDATION_EXPORT double MoPubVersionNumber;
FOUNDATION_EXPORT const unsigned char MoPubVersionString[];

