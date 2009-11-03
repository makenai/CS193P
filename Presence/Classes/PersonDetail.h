//
//  PersonDetail.h
//  Presence
//
//  Created by Pawel Szymczykowski on 11/3/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PersonDetail : UIViewController {
	IBOutlet UIImageView *userImageField;
	IBOutlet UILabel *userNameField;
	IBOutlet UITextView *userStatusField;
	NSString *userName;
	UIImage *userImage;	
	NSString *userStatus;
}

@property (retain) NSString *userName;
@property (retain) UIImage *userImage;
@property (retain) NSString *userStatus;

@end
