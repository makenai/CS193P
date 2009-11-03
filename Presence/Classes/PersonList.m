//
//  PersonList.m
//  Presence
//
//  Created by Pawel Szymczykowski on 11/3/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PersonList.h"
#import "PersonDetail.h"


@implementation PersonList


-(IBAction)showDetail:(id)sender {
	PersonDetail *detail = [[PersonDetail alloc] initWithNibName:@"PersonDetail" bundle:nil];
	if ([sender tag] == 1) {
		detail.userName = user1Name.text;
		detail.userImage = user1Image.image;
	} else if ([sender tag] == 2) {
		detail.userName = user2Name.text;
		detail.userImage = user2Image.image;
	}
	detail.userStatus = [[[NSString alloc] initWithFormat:@"Just being %@!", detail.userName] autorelease];
	[[self navigationController] pushViewController:detail animated:YES];
	[detail release];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"People";
}

@end
