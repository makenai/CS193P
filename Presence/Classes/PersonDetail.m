//
//  PersonDetail.m
//  Presence
//
//  Created by Pawel Szymczykowski on 11/3/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PersonDetail.h"


@implementation PersonDetail

@synthesize userName;
@synthesize userImage;
@synthesize userStatus;

- (void)viewDidLoad {
    [super viewDidLoad];
	userNameField.text = userName;
	userImageField.image = userImage;
	userStatusField.text = userStatus;
	self.title = [[[NSString alloc] initWithFormat:@"Detail for %@", userName] autorelease];
}

- (void)dealloc {
    [super dealloc];
	[userName release];
	[userImage release];
	[userStatus release];
}


@end
