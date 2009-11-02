//
//  PolygonView.h
//  HelloPoly
//
//  Created by Pawel Szymczykowski on 11/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PolygonShape.h"


@interface PolygonView : UIView {
	IBOutlet PolygonShape *polygonShape;
	IBOutlet UILabel *label;
}

+ (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides;

@end
