//
//  PresenceAppDelegate.m
//  Presence
//
//  Created by Pawel Szymczykowski on 11/3/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "PresenceAppDelegate.h"
#import "PersonList.h"

@implementation PresenceAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
	PersonList *personList = [[PersonList alloc]initWithNibName:@"PersonList" bundle:nil];
	[navController pushViewController:personList animated:NO];
	[window addSubview:navController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
