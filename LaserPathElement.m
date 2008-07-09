//
//  LaserPathElement.m
//  LaserGame
//
//  Created by Stig Brautaset on 22/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import "LaserPathElement.h"
#import "Grid.h"
#import "GridDirection.h"
#import "Cell.h"

@implementation LaserPathElement

+ (id)laserPathElementWithCell:(Cell*)cell entrySide:(NSString*)entrySide {
    return [[self alloc] initWithCell:cell entrySide:entrySide];
}

- (id)initWithCell:(Cell*)aCell entrySide:(NSString*)aSide {
    [super init];
    self.cell = aCell;
    self.entrySide = aSide;
    return self;
}

- (id)nextElementIn:(Grid*)grid {
    NSPoint loc = [cell gridLocation];
    id dirSym = [cell exitSideFor:entrySide];
    if ([dirSym isKindOfClass:[NSNull class]])
        return nil;
    id direction = [GridDirection directionFor:dirSym];
    Vector vector = [direction vector];
    id newCell = [grid at:NSMakePoint(loc.x + vector.x, loc.y + vector.y)];
    return newCell == nil ? nil : [[self class] laserPathElementWithCell:newCell entrySide:[direction adjecentInversionSymbol]];
}

- (void)activateCell {
    [cell setLaserEntersFrom:self.entrySide];
}

- (void)clearCell {
    [cell clearCell];
}

- (NSString*)description {
    return [NSString stringWithFormat:@"LPE through %@", self.cell];
}


@synthesize cell;
@synthesize entrySide;
@end
