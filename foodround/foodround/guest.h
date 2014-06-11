//
//  UIViewController+guest.h
//  foodround
//
//  Created by Devine Lu Linvega on 2014-06-05.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (guest)

-(NSMutableDictionary*)guestStart;
-(NSArray*)guestAttributes;
-(NSString*)guestNameFromAttributes :(NSString*)attr1 :(NSString*)attr2 :(NSString*)attr3;
-(NSString*)customFromAttributes :(NSString*)attr1 :(NSString*)attr2 :(NSString*)attr3;
-(NSString*)syllableFromAttribute :(NSString*)attribute :(int)order;

@end
