//
//  MirrorCell.h
//  LaserGame
//
//  Created by Stig Brautaset on 22/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Cell.h"

@interface MirrorCell : Cell {
    BOOL leansLeft;
}
@property BOOL leansLeft;

+ (id)leanLeft;
+ (id)leanRight;

- (BOOL)isLeft;
- (BOOL)isRight;
- (void)leanLeft;
- (void)leanRight;

@end
