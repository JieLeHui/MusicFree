#import "AppDelegate.h"

#if __has_include(<React-RCTAppDelegate/RCTDefaultReactNativeFactoryDelegate.h>)
#import <React-RCTAppDelegate/RCTDefaultReactNativeFactoryDelegate.h>
#import <React-RCTAppDelegate/RCTReactNativeFactory.h>
#elif __has_include(<React_RCTAppDelegate/RCTDefaultReactNativeFactoryDelegate.h>)
#import <React_RCTAppDelegate/RCTDefaultReactNativeFactoryDelegate.h>
#import <React_RCTAppDelegate/RCTReactNativeFactory.h>
#else
#import <RCTDefaultReactNativeFactoryDelegate.h>
#import <RCTReactNativeFactory.h>
#endif

#import <React/RCTBundleURLProvider.h>

@interface MusicFreeReactNativeFactoryDelegate : RCTDefaultReactNativeFactoryDelegate
@end

@implementation MusicFreeReactNativeFactoryDelegate

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
  return [self bundleURL];
}

- (NSURL *)bundleURL
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@".expo/.virtual-metro-entry"];
#else
  return [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
#endif
}

- (BOOL)newArchEnabled
{
  return NO;
}

- (BOOL)bridgelessEnabled
{
  return NO;
}

@end

@interface AppDelegate () {
  RCTReactNativeFactory *_musicFreeReactNativeFactory;
  MusicFreeReactNativeFactoryDelegate *_musicFreeReactNativeFactoryDelegate;
}
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.moduleName = @"main";
  self.initialProps = @{};

  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  _musicFreeReactNativeFactoryDelegate = [MusicFreeReactNativeFactoryDelegate new];

  _musicFreeReactNativeFactory = [[RCTReactNativeFactory alloc] initWithDelegate:_musicFreeReactNativeFactoryDelegate];

  [_musicFreeReactNativeFactory startReactNativeWithModuleName:self.moduleName
                                                      inWindow:self.window
                                             initialProperties:self.initialProps
                                                 launchOptions:launchOptions];

  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
