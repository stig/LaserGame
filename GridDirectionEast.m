//
//  GridDirectionEast.m
//  LaserGame
//
//  Created by Stig Brautaset on 22/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import "GridDirectionEast.h"


@implementation GridDirectionEast

+ (NSString*)directionSymbol {
    return @"East";
}

+ (NSString*)adjecentInversionSymbol {
    return @"West";
}

+ (NSString*)vector {
    return @"1@0";
}
@end
