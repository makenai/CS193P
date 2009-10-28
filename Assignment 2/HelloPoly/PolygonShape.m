//
//  PolygonShape.m
//  WhatATool
//
//  Created by Pawel Szymczykowski on 10/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PolygonShape.h"


@implementation PolygonShape

@synthesize numberOfSides;
@synthesize minimumNumberOfSides;
@synthesize maximumNumberOfSides;

- (void) setNumberOfSides:(int)newNumberOfSides {
	if ( newNumberOfSides < self.minimumNumberOfSides ) {
		NSLog(@"Invalid number of sides: %d is less than the minimum of %d allowed", newNumberOfSides, self.minimumNumberOfSides);
	} else if ( newNumberOfSides > self.maximumNumberOfSides ) {
		NSLog(@"Invalid number of sides: %d is greater than the maximum of %d allowed", newNumberOfSides, self.maximumNumberOfSides);
	} else {
		numberOfSides = newNumberOfSides;
	}
}

- (void) setMinimumNumberOfSides:(int)newMinimumNumberOfSides {
	if (newMinimumNumberOfSides < 3) {
		NSLog(@"Invalid number of sides: %d is less than the minimum of 3 allowed", newMinimumNumberOfSides);
	} else {
		minimumNumberOfSides = newMinimumNumberOfSides;
	}
}

- (void) setMaximumNumberOfSides:(int)newMaximumNumberOfSides {
	if (newMaximumNumberOfSides > 12) {
		NSLog(@"Invalid number of sides: %d is more than the maximum of 12 allowed", newMaximumNumberOfSides);
	} else {
		maximumNumberOfSides = newMaximumNumberOfSides;
	}	
}

- (float)angleInDegrees {
	return (180 * (self.numberOfSides - 2) / self.numberOfSides);
}

- (float)angleInRadians {
	return self.angleInDegrees * M_PI / 180;
}

- (NSString *)name {
	NSArray *shapeLookup = [[NSArray alloc]	initWithObjects:
							@"",
							@"monogon",
							@"digon",
							@"triangle",
							@"square",
							@"pentagon",
							@"hexagon",
							@"heptagon",
							@"octagon",
							@"nonagon",
							@"decagon",
							@"hendecagon",
							@"dodecagon",
							nil							 
	];
	NSString *name = [shapeLookup objectAtIndex:self.numberOfSides];
	[NSString autorelease];
	[NSArray release];
	return name;
}

- (NSString *)description {
	NSString *desc = [[NSString alloc] initWithFormat:@"Hello I am a %d-sided polygon (aka a %@) with angles of %0.f degrees (%f radians).", 
					  self.numberOfSides, self.name, self.angleInDegrees, self.angleInRadians];
	[desc autorelease];
	return desc;
}

- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max {
	self.minimumNumberOfSides = min;
	self.maximumNumberOfSides = max;
	self.numberOfSides = sides;
	return self;
}

- (id)init {
	return [self initWithNumberOfSides:5 minimumNumberOfSides:3 maximumNumberOfSides:10];
}

- (void)dealloc {
	[super dealloc];
	NSLog(@"Deallocating!");
}

@end
