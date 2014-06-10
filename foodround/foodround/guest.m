//
//  UIViewController+guest.m
//  foodround
//
//  Created by Devine Lu Linvega on 2014-06-05.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "guest.h"

@implementation UIViewController (guest)

-(NSMutableDictionary*)guestStart
{
	NSMutableDictionary* newGuest = [[NSMutableDictionary alloc]initWithCapacity:10];
	newGuest[@"attributes"] = @[@"rich",@"tribal",@"deviant"];
	newGuest[@"name"] = @"Woeful";
	return newGuest;
}

-(NSArray*)guestAttributes
{
	NSArray* attributes = @[@"deviant",@"lustful",@"childish",@"greedy",@"polite",@"tribal",@"rich"];
	
	return attributes;
}

-(NSString*)guestNameFromAttributes :(NSString*)attr1 :(NSString*)attr2 :(NSString*)attr3
{
	return [NSString stringWithFormat:@"%@%@%@",[self syllableFromAttribute:attr1:1],[self syllableFromAttribute:attr2:2],[self syllableFromAttribute:attr3:3]];
}

-(NSString*)syllableFromAttribute :(NSString*)attribute :(int)order
{
	
	if([attribute isEqualToString:@"deviant"] && order == 1){ return @"Eln"; }
	if([attribute isEqualToString:@"deviant"] && order == 2){ return @"iobl"; }
	if([attribute isEqualToString:@"deviant"] && order == 3){ return @"esse"; }
	
	if([attribute isEqualToString:@"lustful"] && order == 1){ return @"Ishm"; }
	if([attribute isEqualToString:@"lustful"] && order == 2){ return @"anev"; }
	if([attribute isEqualToString:@"lustful"] && order == 3){ return @"iel"; }
	
	if([attribute isEqualToString:@"childish"] && order == 1){ return @"Bian"; }
	if([attribute isEqualToString:@"childish"] && order == 2){ return @"ub"; }
	if([attribute isEqualToString:@"childish"] && order == 3){ return @"eflo"; }
	
	if([attribute isEqualToString:@"greedy"] && order == 1){ return @"Arc"; }
	if([attribute isEqualToString:@"greedy"] && order == 2){ return @"onim"; }
	if([attribute isEqualToString:@"greedy"] && order == 3){ return @"eq"; }
	
	if([attribute isEqualToString:@"polite"] && order == 1){ return @"Led"; }
	if([attribute isEqualToString:@"polite"] && order == 2){ return @"erl"; }
	if([attribute isEqualToString:@"polite"] && order == 3){ return @"der"; }
	
	if([attribute isEqualToString:@"tribal"] && order == 1){ return @"Bras"; }
	if([attribute isEqualToString:@"tribal"] && order == 2){ return @"arg"; }
	if([attribute isEqualToString:@"tribal"] && order == 3){ return @"ulb"; }
	
	if([attribute isEqualToString:@"rich"] && order == 1){ return @"Den"; }
	if([attribute isEqualToString:@"rich"] && order == 2){ return @"aml"; }
	if([attribute isEqualToString:@"rich"] && order == 3){ return @"ivec"; }
	
	return @"wip";
}



@end
