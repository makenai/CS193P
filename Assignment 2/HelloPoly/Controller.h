//
//  Controller.h
//
//  Created by Pawel Szymczykowski on 10/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"
#import "PolygonView.h"

@interface Controller : NSObject {
    IBOutlet UIButton *decreaseButton;
    IBOutlet UIButton *increaseButton;
    IBOutlet UILabel *numberOfSidesLabel;
	IBOutlet PolygonShape *polygonShape;
	IBOutlet PolygonView *polygonView;
}
- (IBAction)decrease:(id)sender;
- (IBAction)increase:(id)sender;
- (void)updateInterface;
@end
