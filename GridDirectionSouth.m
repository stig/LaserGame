//
//  GridDirectionSouth.m
//  LaserGame
//
//  Created by Stig Brautaset on 22/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import "GridDirectionSouth.h"


@implementation GridDirectionSouth

+ (NSString*)directionSymbol {
    return South;
}

+ (NSString*)adjecentInversionSymbol {
    return North;
}

+ (Vector)vector {
    return MakeVector(0, 1);
}

@end
