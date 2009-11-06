//
//  PersonDetail.h
//  Presence
//
//  Created by Pawel Szymczykowski on 11/3/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"


@interface PersonDetail : UITableViewController {
	Person *person;
}

@property (retain) Person *person;

@end
