//
//  Controller.m
//
//  Created by Pawel Szymczykowski on 10/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Controller.h"


@implementation Controller
- (IBAction)decrease:(id)sender {
	polygonShape.numberOfSides = numberOfSidesLabel.text.integerValue - 1;
	[self updateInterface];
}

- (IBAction)increase:(id)sender {
	polygonShape.numberOfSides = numberOfSidesLabel.text.integerValue + 1;
	[self updateInterface];
}

- (void)updateInterface {
	increaseButton.enabled = polygonShape.numberOfSides < polygonShape.maximumNumberOfSides;
	decreaseButton.enabled = polygonShape.numberOfSides > polygonShape.minimumNumberOfSides;
	numberOfSidesLabel.text = [NSString stringWithFormat:@"%d", polygonShape.numberOfSides];
}

- (void)awakeFromNib { // configure your polygon here
	[polygonShape setMinimumNumberOfSides:3];
	[polygonShape setMaximumNumberOfSides:12];
	[polygonShape setNumberOfSides:numberOfSidesLabel.text.integerValue];
	NSLog (@"My polygon: %@", polygonShape);
}

@end
