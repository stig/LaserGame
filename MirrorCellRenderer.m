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

- (void)drawInteriorWithFrame:(NSRect)r inView:(NSView*)v {
    [super drawInteriorWithFrame:r inView:v];
    
    [NSBezierPath setDefaultLineWidth:3];
    
    id path = [NSBezierPath bezierPath];
    id cell = [grid at:cellLocation];

    r = [self rect:r scaledDownBy:0.25];
    NSPoint ll = r.origin;
    NSPoint lr = NSMakePoint(r.origin.x, r.origin.y + r.size.height);
    NSPoint ul = NSMakePoint(r.origin.x + r.size.width, r.origin.y);
    NSPoint ur = NSMakePoint(r.origin.x + r.size.width, r.origin.y + r.size.height);
    
    if ([cell isRight]) {
        [path moveToPoint:ul];
        [path lineToPoint:lr];
        
    } else {
        [path moveToPoint:ll];
        [path lineToPoint:ur];
    }
    [path stroke];
}

- (void)clickCell {
    id cell = [grid at:cellLocation];
    if ([cell isLeft]) {
        [cell leanRight];
    } else {
        [cell leanLeft];
    }
    
}

@end
