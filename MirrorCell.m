//
//  MirrorCell.m
//  LaserGame
//
//  Created by Stig Brautaset on 22/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import "MirrorCell.h"


@implementation MirrorCell

+ (id)leanLeft {
    id this = [self new];
    [this leanLeft];
    return this;
}

+ (id)leanRight {
    id this = [self new];
    [this leanRight];
    return this;
}

- (id)init {
    [super init];
    self.exitSides = [NSMutableDictionary new];
    if (!self.exitSides)
        return nil;
    
    [self leanLeft];    
    return self;
}

- (BOOL)isLeft {
    return self.leansLeft;
}

- (BOOL)isRight {
    return !self.isLeft;
}

- (void)leanLeft {
    self.leansLeft = YES;
    [self.exitSides setObject:@"East" forKey:@"North"];
    [self.exitSides setObject:@"North" forKey:@"East"];
    [self.exitSides setObject:@"West" forKey:@"South"];
    [self.exitSides setObject:@"South" forKey:@"West"];
}

- (void)leanRight {
    self.leansLeft = NO;
    [self.exitSides setObject:@"West" forKey:@"North"];
    [self.exitSides setObject:@"South" forKey:@"East"];
    [self.exitSides setObject:@"East" forKey:@"South"];
    [self.exitSides setObject:@"North" forKey:@"West"];
}

- (NSString*)description {
    return leansLeft ? @"Left-leaning mirror" : @"Right-leaning mirror";
}

@synthesize leansLeft;
@end
