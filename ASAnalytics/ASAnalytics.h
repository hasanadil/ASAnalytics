//
//  ASAnalytics.h
//  Maps
//
//  Created by Hasan Adil on 5/29/15.
//  Copyright (c) 2015 AssembleLabs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASAnalytics : NSObject

+(void) initializeWithKey:(NSString*)key forApplication:(UIApplication*)application andLaunchOptions:(NSDictionary*)launchOptions;

+(void) start;

+(void) stop;

+(void) tagEvent:(NSString*)event;

+(void) tagController:(UIViewController*)controller;

@end
