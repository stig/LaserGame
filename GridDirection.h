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

typedef NSPoint Vector;

Vector MakeVector(float x, float y);

@interface GridDirection : NSObject {

}

+ (Class)directionFor:(NSString*)symbol;
+ (NSString*)directionSymbol;
+ (NSString*)adjecentInversionSymbol;
+ (Vector)vector;

@end
