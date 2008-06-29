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

- (void)render {
    [self renderBorder];
    [self renderContents];
}

- (void)renderBorder {
    [[NSColor blueColor] set];
    [NSBezierPath setDefaultLineWidth:1];
    [NSBezierPath strokeRect:self.rect];
}

- (void)renderContents {
    NSLog(@"%@ <%3.0f %3.0f %3.0f %3.0f>", 
          [self className],
          self.rect.origin.x, self.rect.origin.y, self.rect.size.height, self.rect.size.width);
}

- (NSRect)rectScaledDownBy:(float)scale {
    NSRect r = self.rect;
    float dw = r.size.width * scale;
    float dh = r.size.height * scale;
    r.origin.x += dw;
    r.origin.y += dh;
    r.size.height -= dh * 2;
    r.size.width -= dw * 2;
    return r;
}

@synthesize cellLocation;
@synthesize grid;
@synthesize rect;
@end
