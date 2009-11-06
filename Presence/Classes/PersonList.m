//
//  PersonList.m
//  Presence
//
//  Created by Pawel Szymczykowski on 11/3/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PersonList.h"
#import "PersonDetail.h"
#import "Person.h"
#import "TwitterHelper.h"


@implementation PersonList

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [people count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Person"];
	if ( cell == nil ) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Person"];
	}
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	cell.textLabel.text = [[people objectAtIndex:indexPath.row] displayName];
	cell.imageView.image = [[people objectAtIndex:indexPath.row] image]; 
	return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	PersonDetail *detail = [[PersonDetail alloc] initWithStyle:UITableViewStyleGrouped];
	detail.person = [people objectAtIndex:indexPath.row];
	[[self navigationController] pushViewController:detail animated:YES];
	[detail release];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"People";
	[self loadPeople];
}

- (void)loadPeople {
	people = [[NSMutableArray alloc] init];
	NSArray *userNames = [[NSArray alloc] 
						  initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"TwitterUsers" ofType:@"plist"]];
	for (NSString *userName in userNames) {
		Person *person = [Person new];
		@try {
			NSDictionary *user = [TwitterHelper fetchInfoForUsername:userName];
			person.username = [user objectForKey:@"screen_name"];
			person.displayName = [user objectForKey:@"name"];
			person.image = [self getImage:[user objectForKey:@"profile_image_url"]];
			person.statuses = [TwitterHelper fetchTimelineForUsername:userName];
			[people addObject:person];
		}
		@catch (NSException * e) {
			NSLog(@"Error loading user %@", userName);
		}
		[person release];
	}
	[userNames release];
}
						
- (UIImage *)getImage:(NSString *)url {
	NSData *urlData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
	UIImage *image = [UIImage imageWithData:urlData];
	if ( image == nil ) {
		NSLog(@"Null image");
		image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"default_profile_5_bigger" ofType:@"png"]];
	}
	return image;
}

- (void)dealloc {
	[super dealloc];
	[people release];
}

@end
