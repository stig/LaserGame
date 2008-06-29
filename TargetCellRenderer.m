//
//  TargetCellRenderer.m
//  LaserGame
//
//  Created by Stig Brautaset on 23/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import "TargetCellRenderer.h"
#import "TargetCell.h"

@implementation TargetCellRenderer

+ (Class)modelClass {
    return [TargetCell class];
}

- (void)renderContents {
    [super renderContents];
    [NSBezierPath setDefaultLineWidth:3];
    id path = [NSBezierPath bezierPath];     
    [path appendBezierPathWithOvalInRect:[self rectScaledDownBy:0.25]];
    
    [[NSColor cyanColor] set];
    [path fill];
    
    [[NSColor blueColor] set];
    [path stroke];
}

@end
