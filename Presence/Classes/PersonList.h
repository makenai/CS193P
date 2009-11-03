//
//  PersonList.h
//  Presence
//
//  Created by Pawel Szymczykowski on 11/3/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PersonList : UIViewController {
	IBOutlet UIImageView *user1Image;
	IBOutlet UILabel *user1Name;
	IBOutlet UIImageView *user2Image;
	IBOutlet UILabel *user2Name;
}

-(IBAction)showDetail:(id)sender;

@end
