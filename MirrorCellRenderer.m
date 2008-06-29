//
//  MirrorCellRenderer.m
//  LaserGame
//
//  Created by Stig Brautaset on 23/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import "MirrorCellRenderer.h"
#import "MirrorCell.h"
#import "Grid.h"

@implementation MirrorCellRenderer

+ (Class)modelClass {
    return [MirrorCell class];
}

- (void)renderContents {
    [super renderContents];
    [NSBezierPath setDefaultLineWidth:3];
    
    id path = [NSBezierPath bezierPath];
    id cell = [grid at:cellLocation];

    NSRect r = [self rectScaledDownBy:0.25];
    NSPoint ll = r.origin;
    NSPoint lr = NSMakePoint(r.origin.x, r.origin.y + r.size.width);
    NSPoint ul = NSMakePoint(r.origin.x + r.size.height, r.origin.y);
    NSPoint ur = NSMakePoint(r.origin.x + r.size.width, r.origin.y + r.size.height);
    
    if ([cell isLeft]) {
        [path moveToPoint:ul];
        [path lineToPoint:lr];
        
    } else {
        [path moveToPoint:ll];
        [path lineToPoint:ur];
    }
    [path stroke];
}

@end
