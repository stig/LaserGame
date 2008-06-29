//
//  GridDirection.m
//  LaserGame
//
//  Created by Stig Brautaset on 22/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import "GridDirection.h"
#import "GridDirectionNorth.h"
#import "GridDirectionEast.h"
#import "GridDirectionSouth.h"
#import "GridDirectionWest.h"

@implementation GridDirection

+ (NSString*)directionSymbol {
    return nil;
}

+ (NSString*)adjecentInversionSymbol {
    return nil;
}

+ (NSString*)vector {
    return nil;
}

+ (Class)directionFor:(NSString*)symbol {
    if ([symbol isEqualToString:[GridDirectionNorth directionSymbol]])
        return [GridDirectionNorth class];
    if ([symbol isEqualToString:[GridDirectionEast directionSymbol]])
        return [GridDirectionEast class];
    if ([symbol isEqualToString:[GridDirectionSouth directionSymbol]])
        return [GridDirectionSouth class];
    if ([symbol isEqualToString:[GridDirectionWest directionSymbol]])
        return [GridDirectionWest class];
    return nil;
}

@end
