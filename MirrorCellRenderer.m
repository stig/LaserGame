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
    [NSBezierPath setDefaultLineWidth:2];
    
    id path = [NSBezierPath bezierPath];
    id cell = [self.grid at:self.cellLocation];

    NSPoint ll = self.rect.origin;
    NSPoint lr = NSMakePoint(self.rect.origin.x, self.rect.origin.y + self.rect.size.width);
    NSPoint ul = NSMakePoint(self.rect.origin.x + self.rect.size.height, self.rect.origin.y);
    NSPoint ur = NSMakePoint(self.rect.origin.x + self.rect.size.width, self.rect.origin.y + self.rect.size.height);
    
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
