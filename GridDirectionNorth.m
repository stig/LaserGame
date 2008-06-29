//
//  GridDirectionNorth.m
//  LaserGame
//
//  Created by Stig Brautaset on 22/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import "GridDirectionNorth.h"


@implementation GridDirectionNorth

+ (NSString*)directionSymbol {
    return North;
}

+ (NSString*)adjecentInversionSymbol {
    return South;
}

+ (Vector)vector {
    return MakeVector(0, 1);
}

@end
