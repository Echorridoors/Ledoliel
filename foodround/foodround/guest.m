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
	newGuest[@"attributes_potential"] = [[NSMutableArray alloc] init];
	newGuest[@"name"] = @"Woeful";
	return newGuest;
}

-(NSArray*)guestAttributes
{
	return @[@"deviant",@"lustful",@"childish",@"greedy",@"polite",@"tribal",@"rich",@"evil",@"sadist",@"pestilent",@"religious"];
}

-(NSString*)guestNameFromAttributes :(NSString*)attr1 :(NSString*)attr2 :(NSString*)attr3
{
	return [NSString stringWithFormat:@"%@%@%@",[self syllableFromAttribute:attr1:1],[self syllableFromAttribute:attr2:2],[self syllableFromAttribute:attr3:3]];
}

-(NSString*)guestCustomFromAttributes :(NSString*)attr1 :(NSString*)attr2 :(NSString*)attr3
{
	NSString* guestName = [self guestNameFromAttributes:attr1:attr2:attr3];
	NSString* guestAction = [self syllableFromAttribute:attr1:4];
	NSString* guesttarget = [self syllableFromAttribute:attr2:5];
	NSString* guestBody   = [self syllableFromAttribute:attr3:6];
	
	return [NSString stringWithFormat:@"As it is their customary and diplomatic salute, %@ %@ your %@ with their %@",guestName,guestAction,guesttarget,guestBody];
}

-(NSString*)syllableFromAttribute :(NSString*)attribute :(int)order
{
	if([attribute isEqualToString:@"deviant"] && order == 1){ return @"Eln"; }
	if([attribute isEqualToString:@"deviant"] && order == 2){ return @"iobl"; }
	if([attribute isEqualToString:@"deviant"] && order == 3){ return @"esse"; }
	if([attribute isEqualToString:@"deviant"] && order == 4){ return @"slaps"; }
	if([attribute isEqualToString:@"deviant"] && order == 5){ return @"genitals"; }
	if([attribute isEqualToString:@"deviant"] && order == 6){ return @"face"; }
	
	if([attribute isEqualToString:@"lustful"] && order == 1){ return @"Ishm"; }
	if([attribute isEqualToString:@"lustful"] && order == 2){ return @"anev"; }
	if([attribute isEqualToString:@"lustful"] && order == 3){ return @"iel"; }
	if([attribute isEqualToString:@"lustful"] && order == 4){ return @"rubs"; }
	if([attribute isEqualToString:@"lustful"] && order == 5){ return @"thongue"; }
	if([attribute isEqualToString:@"lustful"] && order == 6){ return @"index"; }
	
	if([attribute isEqualToString:@"childish"] && order == 1){ return @"Bian"; }
	if([attribute isEqualToString:@"childish"] && order == 2){ return @"ub"; }
	if([attribute isEqualToString:@"childish"] && order == 3){ return @"eflo"; }
	if([attribute isEqualToString:@"childish"] && order == 4){ return @"poke"; }
	if([attribute isEqualToString:@"childish"] && order == 5){ return @"nose"; }
	if([attribute isEqualToString:@"childish"] && order == 6){ return @"thumb"; }
	
	if([attribute isEqualToString:@"greedy"] && order == 1){ return @"Arc"; }
	if([attribute isEqualToString:@"greedy"] && order == 2){ return @"onim"; }
	if([attribute isEqualToString:@"greedy"] && order == 3){ return @"eq"; }
	if([attribute isEqualToString:@"greedy"] && order == 4){ return @"scratches"; }
	if([attribute isEqualToString:@"greedy"] && order == 5){ return @"hand"; }
	if([attribute isEqualToString:@"greedy"] && order == 6){ return @"wand"; }
	
	if([attribute isEqualToString:@"polite"] && order == 1){ return @"Led"; }
	if([attribute isEqualToString:@"polite"] && order == 2){ return @"erl"; }
	if([attribute isEqualToString:@"polite"] && order == 3){ return @"der"; }
	if([attribute isEqualToString:@"polite"] && order == 4){ return @"holds"; }
	if([attribute isEqualToString:@"polite"] && order == 5){ return @"mouth"; }
	if([attribute isEqualToString:@"polite"] && order == 6){ return @"cane"; }
	
	if([attribute isEqualToString:@"tribal"] && order == 1){ return @"Bras"; }
	if([attribute isEqualToString:@"tribal"] && order == 2){ return @"arg"; }
	if([attribute isEqualToString:@"tribal"] && order == 3){ return @"ulb"; }
	if([attribute isEqualToString:@"tribal"] && order == 4){ return @"bashes"; }
	if([attribute isEqualToString:@"tribal"] && order == 5){ return @"breast"; }
	if([attribute isEqualToString:@"tribal"] && order == 6){ return @"tail"; }
	
	if([attribute isEqualToString:@"rich"] && order == 1){ return @"Den"; }
	if([attribute isEqualToString:@"rich"] && order == 2){ return @"aml"; }
	if([attribute isEqualToString:@"rich"] && order == 3){ return @"ivec"; }
	if([attribute isEqualToString:@"rich"] && order == 4){ return @"pats"; }
	if([attribute isEqualToString:@"rich"] && order == 5){ return @"hand"; }
	if([attribute isEqualToString:@"rich"] && order == 6){ return @"gloved hand"; }
	
	if([attribute isEqualToString:@"evil"] && order == 1){ return @"Khav"; }
	if([attribute isEqualToString:@"evil"] && order == 2){ return @"iol"; }
	if([attribute isEqualToString:@"evil"] && order == 3){ return @"olat"; }
	if([attribute isEqualToString:@"evil"] && order == 4){ return @"stabs"; }
	if([attribute isEqualToString:@"evil"] && order == 5){ return @"eyes"; }
	if([attribute isEqualToString:@"evil"] && order == 6){ return @"knife"; }
	
	if([attribute isEqualToString:@"sadist"] && order == 1){ return @"Il"; }
	if([attribute isEqualToString:@"sadist"] && order == 2){ return @"ol"; }
	if([attribute isEqualToString:@"sadist"] && order == 3){ return @"lem"; }
	if([attribute isEqualToString:@"sadist"] && order == 4){ return @"cuts"; }
	if([attribute isEqualToString:@"sadist"] && order == 5){ return @"head"; }
	if([attribute isEqualToString:@"sadist"] && order == 6){ return @"toenails"; }
	
	if([attribute isEqualToString:@"pestilent"] && order == 1){ return @"Erq"; }
	if([attribute isEqualToString:@"pestilent"] && order == 2){ return @"ash"; }
	if([attribute isEqualToString:@"pestilent"] && order == 3){ return @"mol"; }
	if([attribute isEqualToString:@"pestilent"] && order == 4){ return @"rubs"; }
	if([attribute isEqualToString:@"pestilent"] && order == 5){ return @"troath"; }
	if([attribute isEqualToString:@"pestilent"] && order == 6){ return @"armpit"; }
	
	if([attribute isEqualToString:@"religious"] && order == 1){ return @"arch"; }
	if([attribute isEqualToString:@"religious"] && order == 2){ return @"orell"; }
	if([attribute isEqualToString:@"religious"] && order == 3){ return @"stef"; }
	if([attribute isEqualToString:@"religious"] && order == 4){ return @"gropes"; }
	if([attribute isEqualToString:@"religious"] && order == 5){ return @"forehead"; }
	if([attribute isEqualToString:@"religious"] && order == 6){ return @"robe"; }
	
	return @"wip";
}

-(int)reactionFromAttribute :(NSString*)attribute :(NSString*)action :(NSString*)spell :(int)order
{
	NSLog(@"! %@ %@ %@",attribute,action,spell);
	
	int mod = 0;
	int value = 0;
	int orderMultiplyer = 3-order;
	
	if( [attribute isEqualToString:@"deviant"] ){
		
		if([action isEqualToString:@"say"]){ mod = 0; }
		if([action isEqualToString:@"touch"]){ mod = 1; }
		if([action isEqualToString:@"give"]){ mod = 0; }
		
		if( [spell isEqualToString:@"money"])	{ value = -1;}
		if( [spell isEqualToString:@"food"])	{ value = 1;}
		if( [spell isEqualToString:@"toys"])	{ value = 1;}
		if( [spell isEqualToString:@"weapons"])	{ value = -1;}
		if( [spell isEqualToString:@"gold"])	{ value = 1;}
		if( [spell isEqualToString:@"cocktail"]){ value = 1;}
		if( [spell isEqualToString:@"children"]){ value = -1;}
		if( [spell isEqualToString:@"flower"])	{ value = -1;}
		
		return (value+mod)*orderMultiplyer;
		
	}
	if( [attribute isEqualToString:@"lustful"] ){
		
		if([action isEqualToString:@"say"]){ mod = 0; }
		if([action isEqualToString:@"touch"]){ mod = 1; }
		if([action isEqualToString:@"give"]){ mod = 0; }
		
		if( [spell isEqualToString:@"money"])	{ value = 1;}
		if( [spell isEqualToString:@"food"])	{ value = 1;}
		if( [spell isEqualToString:@"toys"])	{ value = 1;}
		if( [spell isEqualToString:@"weapons"])	{ value = -1;}
		if( [spell isEqualToString:@"gold"])	{ value = -1;}
		if( [spell isEqualToString:@"cocktail"]){ value = -1;}
		if( [spell isEqualToString:@"children"]){ value = 1;}
		if( [spell isEqualToString:@"flower"])	{ value = -1;}
		
		return (value+mod)*orderMultiplyer;
	}
	if( [attribute isEqualToString:@"childish"] ){
		
		if([action isEqualToString:@"say"]){ mod = 0; }
		if([action isEqualToString:@"touch"]){ mod = 0; }
		if([action isEqualToString:@"give"]){ mod = 1; }
		
		if( [spell isEqualToString:@"money"])	{ value = -1;}
		if( [spell isEqualToString:@"food"])	{ value = 1;}
		if( [spell isEqualToString:@"toys"])	{ value = 1;}
		if( [spell isEqualToString:@"weapons"])	{ value = -1;}
		if( [spell isEqualToString:@"gold"])	{ value = -1;}
		if( [spell isEqualToString:@"cocktail"]){ value = -1;}
		if( [spell isEqualToString:@"children"]){ value = 1;}
		if( [spell isEqualToString:@"flower"])	{ value = 1;}
		
		return (value+mod)*orderMultiplyer;
	}
	if( [attribute isEqualToString:@"rich"] ){
		
		if([action isEqualToString:@"say"]){ mod = 0; }
		if([action isEqualToString:@"touch"]){ mod = 0; }
		if([action isEqualToString:@"give"]){ mod = 1; }
		
		if( [spell isEqualToString:@"money"])	{ value = 1;}
		if( [spell isEqualToString:@"food"])	{ value = 1;}
		if( [spell isEqualToString:@"toys"])	{ value = -1;}
		if( [spell isEqualToString:@"weapons"])	{ value = 1;}
		if( [spell isEqualToString:@"gold"])	{ value = 1;}
		if( [spell isEqualToString:@"cocktail"]){ value = 1;}
		if( [spell isEqualToString:@"children"]){ value = -1;}
		if( [spell isEqualToString:@"flower"])	{ value = -1;}
		
		return (value+mod)*orderMultiplyer;
	}
	if( [attribute isEqualToString:@"greedy"] ){
		
		if([action isEqualToString:@"say"]){ mod = 0; }
		if([action isEqualToString:@"touch"]){ mod = 1; }
		if([action isEqualToString:@"give"]){ mod = 0; }
		
		if( [spell isEqualToString:@"money"])	{ value = 2;}
		if( [spell isEqualToString:@"food"])	{ value = 2;}
		if( [spell isEqualToString:@"toys"])	{ value = -1;}
		if( [spell isEqualToString:@"weapons"])	{ value = -1;}
		if( [spell isEqualToString:@"gold"])	{ value = 2;}
		if( [spell isEqualToString:@"cocktail"]){ value = -1;}
		if( [spell isEqualToString:@"children"]){ value = -1;}
		if( [spell isEqualToString:@"flower"])	{ value = -1;}
		
		return (value+mod)*orderMultiplyer;
	}
	if( [attribute isEqualToString:@"polite"] ){
		
		if([action isEqualToString:@"say"]){ mod = 1; }
		if([action isEqualToString:@"touch"]){ mod = 0; }
		if([action isEqualToString:@"give"]){ mod = 0; }
		
		if( [spell isEqualToString:@"money"])	{ value = 1;}
		if( [spell isEqualToString:@"food"])	{ value = 2;}
		if( [spell isEqualToString:@"toys"])	{ value = -1;}
		if( [spell isEqualToString:@"weapons"])	{ value = 1;}
		if( [spell isEqualToString:@"gold"])	{ value = 1;}
		if( [spell isEqualToString:@"cocktail"]){ value = 1;}
		if( [spell isEqualToString:@"children"]){ value = -2;}
		if( [spell isEqualToString:@"flower"])	{ value = -1;}
		
		return (value+mod)*orderMultiplyer;
	}
	if( [attribute isEqualToString:@"tribal"] ){
		
		if([action isEqualToString:@"say"]){ mod = 0; }
		if([action isEqualToString:@"touch"]){ mod = 1; }
		if([action isEqualToString:@"give"]){ mod = 0; }
		
		if( [spell isEqualToString:@"money"])	{ value = -2;}
		if( [spell isEqualToString:@"food"])	{ value = 2;}
		if( [spell isEqualToString:@"toys"])	{ value = -2;}
		if( [spell isEqualToString:@"weapons"])	{ value = 1;}
		if( [spell isEqualToString:@"gold"])	{ value = 2;}
		if( [spell isEqualToString:@"cocktail"]){ value = -1;}
		if( [spell isEqualToString:@"children"]){ value = 0;}
		if( [spell isEqualToString:@"flower"])	{ value = -2;}
		
		return (value+mod)*orderMultiplyer;
	}
	if( [attribute isEqualToString:@"evil"] ){
		
		if([action isEqualToString:@"say"]){ mod = 0; }
		if([action isEqualToString:@"touch"]){ mod = 1; }
		if([action isEqualToString:@"give"]){ mod = 0; }
		
		if( [spell isEqualToString:@"money"])	{ value = 2;}
		if( [spell isEqualToString:@"food"])	{ value = -1;}
		if( [spell isEqualToString:@"toys"])	{ value = 1;}
		if( [spell isEqualToString:@"weapons"])	{ value = 1;}
		if( [spell isEqualToString:@"gold"])	{ value = 1;}
		if( [spell isEqualToString:@"cocktail"]){ value = -1;}
		if( [spell isEqualToString:@"children"]){ value = -2;}
		if( [spell isEqualToString:@"flower"])	{ value = -5;}
		
		return (value+mod)*orderMultiplyer;
	}
	if( [attribute isEqualToString:@"sadist"] ){
		
		if([action isEqualToString:@"say"]){ mod = 0; }
		if([action isEqualToString:@"touch"]){ mod = 1; }
		if([action isEqualToString:@"give"]){ mod = 0; }
		
		if( [spell isEqualToString:@"money"])	{ value = -1;}
		if( [spell isEqualToString:@"food"])	{ value = -1;}
		if( [spell isEqualToString:@"toys"])	{ value = 2;}
		if( [spell isEqualToString:@"weapons"])	{ value = 2;}
		if( [spell isEqualToString:@"gold"])	{ value = 1;}
		if( [spell isEqualToString:@"cocktail"]){ value = -1;}
		if( [spell isEqualToString:@"children"]){ value = 2;}
		if( [spell isEqualToString:@"flower"])	{ value = 0;}
		
		return (value+mod)*orderMultiplyer;
	}
	if( [attribute isEqualToString:@"pestilent"] ){
		
		if([action isEqualToString:@"say"]){ mod = 0; }
		if([action isEqualToString:@"touch"]){ mod = 1; }
		if([action isEqualToString:@"give"]){ mod = 0; }
		
		if( [spell isEqualToString:@"money"])	{ value = 1;}
		if( [spell isEqualToString:@"food"])	{ value = -1;}
		if( [spell isEqualToString:@"toys"])	{ value = -1;}
		if( [spell isEqualToString:@"weapons"])	{ value = -1;}
		if( [spell isEqualToString:@"gold"])	{ value = 1;}
		if( [spell isEqualToString:@"cocktail"]){ value = 1;}
		if( [spell isEqualToString:@"children"]){ value = 1;}
		if( [spell isEqualToString:@"flower"])	{ value = -3;}
		
		return (value+mod)*orderMultiplyer;
	}
	if( [attribute isEqualToString:@"religious"] ){
		
		if([action isEqualToString:@"say"]){ mod = 1; }
		if([action isEqualToString:@"touch"]){ mod = 0; }
		if([action isEqualToString:@"give"]){ mod = 0; }
		
		if( [spell isEqualToString:@"money"])	{ value = 2;}
		if( [spell isEqualToString:@"food"])	{ value = -1;}
		if( [spell isEqualToString:@"toys"])	{ value = -1;}
		if( [spell isEqualToString:@"weapons"])	{ value = 2;}
		if( [spell isEqualToString:@"gold"])	{ value = 2;}
		if( [spell isEqualToString:@"cocktail"]){ value = -3;}
		if( [spell isEqualToString:@"children"]){ value = 3;}
		if( [spell isEqualToString:@"flower"])	{ value = -3;}
		
		return (value+mod)*orderMultiplyer;
	}
	
	return 0;
}




@end
