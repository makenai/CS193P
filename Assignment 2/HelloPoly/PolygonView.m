//
//  PolygonView.m
//  HelloPoly
//
//  Created by Pawel Szymczykowski on 11/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PolygonView.h"


@implementation PolygonView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
	CGContextRef context = UIGraphicsGetCurrentContext();
	NSArray *points = [[self class] pointsForPolygonInRect:rect numberOfSides:polygonShape.numberOfSides];	
	for (int i=0; i<[points count]; i++) {
		CGPoint point = [[points objectAtIndex:i] CGPointValue];
		if (i == 0) {
			CGContextMoveToPoint(context, point.x, point.y);
		} else {
			CGContextAddLineToPoint(context, point.x, point.y);
		}
	}
	CGContextClosePath(context);
	[[UIColor redColor] setFill]; [[UIColor blackColor] setStroke]; CGContextDrawPath (context, kCGPathFillStroke);
	label.text = polygonShape.name;
}

- (void)dealloc {
    [super dealloc];
}

+ (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides {
	CGPoint center = CGPointMake(rect.size.width / 2.0, rect.size.height / 2.0);
	float radius = 0.9 * center.x;
	NSMutableArray *result = [NSMutableArray array];
	float angle = (2.0 * M_PI) / numberOfSides;
	float exteriorAngle = M_PI - angle;
	float rotationDelta = angle - (0.5 * exteriorAngle);
	for (int currentAngle = 0; currentAngle < numberOfSides; currentAngle++) {
		float newAngle = (angle * currentAngle) - rotationDelta;
		float curX = cos(newAngle) * radius;
		float curY = sin(newAngle) * radius;
		[result addObject:[NSValue valueWithCGPoint:CGPointMake(center.x + curX, center.y + curY)]];
	}
	return result;
}

@end
