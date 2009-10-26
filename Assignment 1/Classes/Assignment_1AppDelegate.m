//
//  Assignment_1AppDelegate.m
//  Assignment 1
//
//  Created by Pawel Szymczykowski on 10/25/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "Assignment_1AppDelegate.h"

@implementation Assignment_1AppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
