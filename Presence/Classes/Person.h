//
//  Person.h
//  Presence
//
//  Created by Pawel Szymczykowski on 11/3/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject {
	UIImage *image;
	NSString *username;
	NSString *displayName;
	NSArray *statuses;
}

@property (retain) UIImage *image;
@property (retain) NSString *username;
@property (retain) NSString *displayName;
@property (retain) NSArray *statuses;

@end
