//
//  CellRenderer.m
//  LaserGame
//
//  Created by Stig Brautaset on 23/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import "CellRenderer.h"
#import "BlankCellRenderer.h"
#import "MirrorCellRenderer.h"
#import "TargetCellRenderer.h"

@implementation CellRenderer

+ (Class)modelClass {
    return nil;
}

+ (Class)rendererFor:(id)cell {
    if ([cell isKindOfClass:[BlankCellRenderer modelClass]])
        return [BlankCellRenderer class];
    else if ([cell isKindOfClass:[MirrorCellRenderer modelClass]])
        return [MirrorCellRenderer class];
    else if ([cell isKindOfClass:[TargetCellRenderer modelClass]])
        return [TargetCellRenderer class];
    @throw(@"unrecognised cell");
}

- (void)drawInteriorWithFrame:(NSRect)r inView:(NSView*)v {
    [[NSColor blueColor] set];
    [NSBezierPath setDefaultLineWidth:2];
    [NSBezierPath strokeRect:r];
}

- (NSRect)rect:(NSRect)r scaledDownBy:(float)scale {
    float dw = r.size.width * scale;
    float dh = r.size.height * scale;
    r.origin.x += dw;
    r.origin.y += dh;
    r.size.height -= dh * 2;
    r.size.width -= dw * 2;
    return r;
}

- (void)clickCell {
    NSLog(@"-[%@ clickCell]", [self className]);
}

@synthesize cellLocation;
@synthesize grid;
@end
