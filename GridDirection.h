//
//  GridDirection.h
//  LaserGame
//
//  Created by Stig Brautaset on 22/06/2008.
//  Copyright 2008 Stig Brautaset. All rights reserved.
//

#import <Cocoa/Cocoa.h>

extern NSString * const North;
extern NSString * const East;
extern NSString * const South;
extern NSString * const West;

@interface GridDirection : NSObject {

}

+ (Class)directionFor:(NSString*)symbol;
+ (NSString*)directionSymbol;
+ (NSString*)adjecentInversionSymbol;
+ (NSString*)vector;

@end
