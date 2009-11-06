//
//  Person.m
//  Presence
//
//  Created by Pawel Szymczykowski on 11/3/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Person.h"


@implementation Person

@synthesize image;
@synthesize username;
@synthesize displayName;
@synthesize statuses;

- (void)dealloc {
	[super dealloc];
	[image release];
	[username release];
	[displayName release];
	[statuses release];
}

@end
