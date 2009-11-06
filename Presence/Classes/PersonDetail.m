//
//  PersonDetail.m
//  Presence
//
//  Created by Pawel Szymczykowski on 11/3/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PersonDetail.h"

@implementation PersonDetail

@synthesize person;

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [[person statuses] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Status"];
	if ( cell == nil ) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Status"];		
	}
	cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
	cell.textLabel.numberOfLines = 0;
	cell.textLabel.font = [UIFont systemFontOfSize:17.0];
	cell.textLabel.text = [[[person statuses] objectAtIndex:indexPath.row] objectForKey:@"text"]; 
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSString *text = [[[person statuses] objectAtIndex:indexPath.row] objectForKey:@"text"];
	UIFont *font = [UIFont systemFontOfSize:17.0];
	CGSize withinSize = CGSizeMake(tableView.bounds.size.width, 1000);
	CGSize size = [text sizeWithFont:font constrainedToSize:withinSize lineBreakMode:UILineBreakModeWordWrap];
	return size.height + 30;
}


- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"Detail";
}

- (void)dealloc {
    [super dealloc];
	[person release];
}


@end
