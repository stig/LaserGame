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
    id loc = [[self.cell gridLocation] componentsSeparatedByString:@"@"];
    id dirSym = [self.cell exitSideFor:self.entrySide];
    if ([dirSym isKindOfClass:[NSNull class]])
        return nil;
    id direction = [GridDirection directionFor:dirSym];
    id vector = [[direction vector] componentsSeparatedByString:@"@"];
    id newLoc = [NSString stringWithFormat:@"%u@%u",
                 [[loc objectAtIndex:0] intValue] + [[vector objectAtIndex:0] intValue],
                 [[loc objectAtIndex:1] intValue] + [[vector objectAtIndex:1] intValue],
                 nil];
    id newCell = [grid at:newLoc];
    return newCell == nil ? nil : [[self class] laserPathElementWithCell:newCell entrySide:[direction adjecentInversionSymbol]];
}

- (void)activateCell {
    [self.cell setLaserEntersFrom:self.entrySide];
}


@synthesize cell;
@synthesize entrySide;
@end
