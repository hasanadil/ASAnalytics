//
//  ASAnalytics.m
//  Maps
//
//  Created by Hasan Adil on 5/29/15.
//  Copyright (c) 2015 AssembleLabs. All rights reserved.
//

#import "ASAnalytics.h"
#import "Localytics.h"

@implementation ASAnalytics

+(void) initializeWithKey:(NSString*)key forApplication:(UIApplication*)application andLaunchOptions:(NSDictionary*)launchOptions {
#if TARGET_IPHONE_SIMULATOR
    return;
#endif
    
    [Localytics autoIntegrate:key launchOptions:launchOptions];
    if (application.applicationState != UIApplicationStateBackground) {
        [Localytics openSession];
    }
}

+(void) start {
#if TARGET_IPHONE_SIMULATOR
    return;
#endif
    
    [Localytics openSession];
    [Localytics upload];
}

+(void) stop {
#if TARGET_IPHONE_SIMULATOR
    return;
#endif
    
    [Localytics dismissCurrentInAppMessage];
    [Localytics closeSession];
    [Localytics upload];
}

+(void) tagEvent:(NSString*)event {
#if TARGET_IPHONE_SIMULATOR
    return;
#endif
    
    [Localytics tagEvent:event];
}

+(void) tagController:(UIViewController*)controller {
#if TARGET_IPHONE_SIMULATOR
    return;
#endif
    
    NSString* nibName = controller.nibName;
    if (nibName) {
        [Localytics tagScreen:nibName];
        return;
    }
    
    NSString *className = NSStringFromClass([controller class]);
    [Localytics tagScreen:className];
}

@end
