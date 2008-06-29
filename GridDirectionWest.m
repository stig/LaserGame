//
//  GridDirectionWest.m
//  LaserGame
//
//  Created by Stig Brautaset on 22/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import "GridDirectionWest.h"


@implementation GridDirectionWest

+ (NSString*)directionSymbol {
    return @"West";
}

+ (NSString*)adjecentInversionSymbol {
    return @"East";
}

+ (NSString*)vector {
    return @"-1@0";
}

@end
