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
	return @[@"deviant",@"lustful",@"childish",@"greedy",@"tribal",@"rich",@"evil",@"sadist",@"pestilent",@"religious",@"industrial",@"scientific",@"violent",@"gentle",@"wise",@"ancient"];
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
	NSString* guestAdjective = [self syllableFromAttribute:attr1:10];
	
	return [NSString stringWithFormat:@"As it is their customary and diplomatic salute, %@ %@ your %@ with their %@ %@.",guestName,guestAction,guesttarget,guestAdjective,guestBody];
}

-(NSString*)syllableFromAttribute :(NSString*)attribute :(int)order
{
	if([attribute isEqualToString:@"deviant"] && order == 1){ return @"Eln"; }
	if([attribute isEqualToString:@"deviant"] && order == 2){ return @"iobl"; }
	if([attribute isEqualToString:@"deviant"] && order == 3){ return @"esse"; }
	if([attribute isEqualToString:@"deviant"] && order == 4){ return @"slaps"; }
	if([attribute isEqualToString:@"deviant"] && order == 5){ return @"genitals"; }
	if([attribute isEqualToString:@"deviant"] && order == 6){ return @"orifice"; }
	if([attribute isEqualToString:@"deviant"] && order == 7){ return @"lays"; }
	if([attribute isEqualToString:@"deviant"] && order == 8){ return @"eggs"; }
	if([attribute isEqualToString:@"deviant"] && order == 9){ return @"skull"; }
	if([attribute isEqualToString:@"deviant"] && order == 10){ return @"disgusting"; }
	
	if([attribute isEqualToString:@"lustful"] && order == 1){ return @"Ishm"; }
	if([attribute isEqualToString:@"lustful"] && order == 2){ return @"anev"; }
	if([attribute isEqualToString:@"lustful"] && order == 3){ return @"iel"; }
	if([attribute isEqualToString:@"lustful"] && order == 4){ return @"rubs"; }
	if([attribute isEqualToString:@"lustful"] && order == 5){ return @"thongue"; }
	if([attribute isEqualToString:@"lustful"] && order == 6){ return @"index"; }
	if([attribute isEqualToString:@"lustful"] && order == 7){ return @"injects"; }
	if([attribute isEqualToString:@"lustful"] && order == 8){ return @"acid"; }
	if([attribute isEqualToString:@"lustful"] && order == 9){ return @"veins"; }
	if([attribute isEqualToString:@"lustful"] && order == 10){ return @"wet"; }
	
	if([attribute isEqualToString:@"childish"] && order == 1){ return @"Bian"; }
	if([attribute isEqualToString:@"childish"] && order == 2){ return @"ub"; }
	if([attribute isEqualToString:@"childish"] && order == 3){ return @"eflo"; }
	if([attribute isEqualToString:@"childish"] && order == 4){ return @"pokes"; }
	if([attribute isEqualToString:@"childish"] && order == 5){ return @"nose"; }
	if([attribute isEqualToString:@"childish"] && order == 6){ return @"stump"; }
	if([attribute isEqualToString:@"childish"] && order == 7){ return @"spits"; }
	if([attribute isEqualToString:@"childish"] && order == 8){ return @"poison"; }
	if([attribute isEqualToString:@"childish"] && order == 9){ return @"eyelids"; }
	if([attribute isEqualToString:@"childish"] && order == 10){ return @"stumpy"; }
	
	if([attribute isEqualToString:@"greedy"] && order == 1){ return @"Arc"; }
	if([attribute isEqualToString:@"greedy"] && order == 2){ return @"onim"; }
	if([attribute isEqualToString:@"greedy"] && order == 3){ return @"eq"; }
	if([attribute isEqualToString:@"greedy"] && order == 4){ return @"scratches"; }
	if([attribute isEqualToString:@"greedy"] && order == 5){ return @"mother"; }
	if([attribute isEqualToString:@"greedy"] && order == 6){ return @"cane"; }
	if([attribute isEqualToString:@"greedy"] && order == 7){ return @"blows"; }
	if([attribute isEqualToString:@"greedy"] && order == 8){ return @"puke"; }
	if([attribute isEqualToString:@"greedy"] && order == 9){ return @"heart"; }
	if([attribute isEqualToString:@"greedy"] && order == 10){ return @"rusty"; }
	
	if([attribute isEqualToString:@"tribal"] && order == 1){ return @"Bras"; }
	if([attribute isEqualToString:@"tribal"] && order == 2){ return @"arg"; }
	if([attribute isEqualToString:@"tribal"] && order == 3){ return @"ulb"; }
	if([attribute isEqualToString:@"tribal"] && order == 4){ return @"bashes"; }
	if([attribute isEqualToString:@"tribal"] && order == 5){ return @"breast"; }
	if([attribute isEqualToString:@"tribal"] && order == 6){ return @"tail"; }
	if([attribute isEqualToString:@"tribal"] && order == 7){ return @"cooks"; }
	if([attribute isEqualToString:@"tribal"] && order == 8){ return @"tar"; }
	if([attribute isEqualToString:@"tribal"] && order == 9){ return @"entrails"; }
	if([attribute isEqualToString:@"tribal"] && order == 10){ return @"hairy"; }
	
	if([attribute isEqualToString:@"rich"] && order == 1){ return @"Den"; }
	if([attribute isEqualToString:@"rich"] && order == 2){ return @"aml"; }
	if([attribute isEqualToString:@"rich"] && order == 3){ return @"ivec"; }
	if([attribute isEqualToString:@"rich"] && order == 4){ return @"pats"; }
	if([attribute isEqualToString:@"rich"] && order == 5){ return @"head"; }
	if([attribute isEqualToString:@"rich"] && order == 6){ return @"hand"; }
	if([attribute isEqualToString:@"rich"] && order == 7){ return @"fires"; }
	if([attribute isEqualToString:@"rich"] && order == 8){ return @"rocks"; }
	if([attribute isEqualToString:@"rich"] && order == 9){ return @"hands"; }
	if([attribute isEqualToString:@"rich"] && order == 10){ return @"shaved"; }
	
	if([attribute isEqualToString:@"evil"] && order == 1){ return @"Khav"; }
	if([attribute isEqualToString:@"evil"] && order == 2){ return @"iol"; }
	if([attribute isEqualToString:@"evil"] && order == 3){ return @"olat"; }
	if([attribute isEqualToString:@"evil"] && order == 4){ return @"stabs"; }
	if([attribute isEqualToString:@"evil"] && order == 5){ return @"eyes"; }
	if([attribute isEqualToString:@"evil"] && order == 6){ return @"chest"; }
	if([attribute isEqualToString:@"evil"] && order == 7){ return @"pushes"; }
	if([attribute isEqualToString:@"evil"] && order == 8){ return @"brambles"; }
	if([attribute isEqualToString:@"evil"] && order == 9){ return @"ears"; }
	if([attribute isEqualToString:@"evil"] && order == 10){ return @"spiky"; }
	
	if([attribute isEqualToString:@"sadist"] && order == 1){ return @"Il"; }
	if([attribute isEqualToString:@"sadist"] && order == 2){ return @"ol"; }
	if([attribute isEqualToString:@"sadist"] && order == 3){ return @"lem"; }
	if([attribute isEqualToString:@"sadist"] && order == 4){ return @"cuts"; }
	if([attribute isEqualToString:@"sadist"] && order == 5){ return @"back"; }
	if([attribute isEqualToString:@"sadist"] && order == 6){ return @"bloody toenails"; }
	if([attribute isEqualToString:@"sadist"] && order == 7){ return @"inflates"; }
	if([attribute isEqualToString:@"sadist"] && order == 8){ return @"needles"; }
	if([attribute isEqualToString:@"sadist"] && order == 9){ return @"skin"; }
	if([attribute isEqualToString:@"sadist"] && order == 10){ return @"sharp"; }
	
	if([attribute isEqualToString:@"pestilent"] && order == 1){ return @"erq"; }
	if([attribute isEqualToString:@"pestilent"] && order == 2){ return @"ash"; }
	if([attribute isEqualToString:@"pestilent"] && order == 3){ return @"mol"; }
	if([attribute isEqualToString:@"pestilent"] && order == 4){ return @"rubs"; }
	if([attribute isEqualToString:@"pestilent"] && order == 5){ return @"troath"; }
	if([attribute isEqualToString:@"pestilent"] && order == 6){ return @"fat"; }
	if([attribute isEqualToString:@"pestilent"] && order == 7){ return @"vomits"; }
	if([attribute isEqualToString:@"pestilent"] && order == 8){ return @"flies"; }
	if([attribute isEqualToString:@"pestilent"] && order == 9){ return @"legs"; }
	if([attribute isEqualToString:@"pestilent"] && order == 10){ return @"stinky"; }
	
	if([attribute isEqualToString:@"religious"] && order == 1){ return @"arch"; }
	if([attribute isEqualToString:@"religious"] && order == 2){ return @"orell"; }
	if([attribute isEqualToString:@"religious"] && order == 3){ return @"stef"; }
	if([attribute isEqualToString:@"religious"] && order == 4){ return @"gropes"; }
	if([attribute isEqualToString:@"religious"] && order == 5){ return @"forehead"; }
	if([attribute isEqualToString:@"religious"] && order == 6){ return @"mouth"; }
	if([attribute isEqualToString:@"religious"] && order == 7){ return @"shoots"; }
	if([attribute isEqualToString:@"religious"] && order == 8){ return @"beeds"; }
	if([attribute isEqualToString:@"religious"] && order == 9){ return @"head"; }
	if([attribute isEqualToString:@"religious"] && order == 10){ return @"gold"; }
	
	if([attribute isEqualToString:@"industrial"] && order == 1){ return @"bol"; }
	if([attribute isEqualToString:@"industrial"] && order == 2){ return @"one"; }
	if([attribute isEqualToString:@"industrial"] && order == 3){ return @"mel"; }
	if([attribute isEqualToString:@"industrial"] && order == 4){ return @"pulls at"; }
	if([attribute isEqualToString:@"industrial"] && order == 5){ return @"arms"; }
	if([attribute isEqualToString:@"industrial"] && order == 6){ return @"arms"; }
	if([attribute isEqualToString:@"industrial"] && order == 7){ return @"hammers"; }
	if([attribute isEqualToString:@"industrial"] && order == 8){ return @"nails"; }
	if([attribute isEqualToString:@"industrial"] && order == 9){ return @"chest"; }
	if([attribute isEqualToString:@"industrial"] && order == 10){ return @"metal"; }
	
	if([attribute isEqualToString:@"scientific"] && order == 1){ return @"selm"; }
	if([attribute isEqualToString:@"scientific"] && order == 2){ return @"anis"; }
	if([attribute isEqualToString:@"scientific"] && order == 3){ return @"grev"; }
	if([attribute isEqualToString:@"scientific"] && order == 4){ return @"studies"; }
	if([attribute isEqualToString:@"scientific"] && order == 5){ return @"suprasternal notch"; }
	if([attribute isEqualToString:@"scientific"] && order == 6){ return @"telescope"; }
	if([attribute isEqualToString:@"scientific"] && order == 7){ return @"sews"; }
	if([attribute isEqualToString:@"scientific"] && order == 8){ return @"spores"; }
	if([attribute isEqualToString:@"scientific"] && order == 9){ return @"lungs"; }
	if([attribute isEqualToString:@"scientific"] && order == 10){ return @"misformed"; }
	
	if([attribute isEqualToString:@"violent"] && order == 1){ return @"kash"; }
	if([attribute isEqualToString:@"violent"] && order == 2){ return @"iat"; }
	if([attribute isEqualToString:@"violent"] && order == 3){ return @"det"; }
	if([attribute isEqualToString:@"violent"] && order == 4){ return @"stabs"; }
	if([attribute isEqualToString:@"violent"] && order == 5){ return @"back"; }
	if([attribute isEqualToString:@"violent"] && order == 6){ return @"elbow"; }
	if([attribute isEqualToString:@"violent"] && order == 7){ return @"installs"; }
	if([attribute isEqualToString:@"violent"] && order == 8){ return @"bolts"; }
	if([attribute isEqualToString:@"violent"] && order == 9){ return @"spine"; }
	if([attribute isEqualToString:@"violent"] && order == 10){ return @"bloody"; }
	
	if([attribute isEqualToString:@"gentle"] && order == 1){ return @"faun"; }
	if([attribute isEqualToString:@"gentle"] && order == 2){ return @"iol"; }
	if([attribute isEqualToString:@"gentle"] && order == 3){ return @"ven"; }
	if([attribute isEqualToString:@"gentle"] && order == 4){ return @"pats"; }
	if([attribute isEqualToString:@"gentle"] && order == 5){ return @"shoulder"; }
	if([attribute isEqualToString:@"gentle"] && order == 6){ return @"tentacles"; }
	if([attribute isEqualToString:@"gentle"] && order == 7){ return @"mixes"; }
	if([attribute isEqualToString:@"gentle"] && order == 8){ return @"puss"; }
	if([attribute isEqualToString:@"gentle"] && order == 9){ return @"thongue"; }
	if([attribute isEqualToString:@"gentle"] && order == 10){ return @"soft"; }
	
	if([attribute isEqualToString:@"wise"] && order == 1){ return @"erl"; }
	if([attribute isEqualToString:@"wise"] && order == 2){ return @"ionel"; }
	if([attribute isEqualToString:@"wise"] && order == 3){ return @"dente"; }
	if([attribute isEqualToString:@"wise"] && order == 4){ return @"blows"; }
	if([attribute isEqualToString:@"wise"] && order == 5){ return @"hair"; }
	if([attribute isEqualToString:@"wise"] && order == 6){ return @"horn"; }
	if([attribute isEqualToString:@"wise"] && order == 7){ return @"plants"; }
	if([attribute isEqualToString:@"wise"] && order == 8){ return @"vines"; }
	if([attribute isEqualToString:@"wise"] && order == 9){ return @"scalp"; }
	if([attribute isEqualToString:@"wise"] && order == 10){ return @"scaly"; }
	
	if([attribute isEqualToString:@"ancient"] && order == 1){ return @"cloc"; }
	if([attribute isEqualToString:@"ancient"] && order == 2){ return @"elan"; }
	if([attribute isEqualToString:@"ancient"] && order == 3){ return @"fil"; }
	if([attribute isEqualToString:@"ancient"] && order == 4){ return @"shouts at"; }
	if([attribute isEqualToString:@"ancient"] && order == 5){ return @"children"; }
	if([attribute isEqualToString:@"ancient"] && order == 6){ return @"mandibles"; }
	if([attribute isEqualToString:@"ancient"] && order == 7){ return @"hatches"; }
	if([attribute isEqualToString:@"ancient"] && order == 8){ return @"maggots"; }
	if([attribute isEqualToString:@"ancient"] && order == 9){ return @"throat"; }
	if([attribute isEqualToString:@"ancient"] && order == 10){ return @"rough"; }
	
	return @"";
}


-(int)multiplayerFromAttribute :(NSString*)attribute :(NSString*)action
{
	int multiplyer = 0;
	
	// Plus
	
	if( [attribute isEqualToString:@"deviant"] && [action isEqualToString:@"touch"])	{ multiplyer = 1;}
	if( [attribute isEqualToString:@"lustful"] && [action isEqualToString:@"touch"])	{ multiplyer = 1;}
	if( [attribute isEqualToString:@"childish"] && [action isEqualToString:@"give"])	{ multiplyer = 1;}
	if( [attribute isEqualToString:@"greedy"] && [action isEqualToString:@"give"])		{ multiplyer = 1;}
	if( [attribute isEqualToString:@"tribal"] && [action isEqualToString:@"give"])		{ multiplyer = 1;}
	if( [attribute isEqualToString:@"rich"] && [action isEqualToString:@"say"])			{ multiplyer = 1;}
	if( [attribute isEqualToString:@"evil"] && [action isEqualToString:@"say"])			{ multiplyer = 1;}
	if( [attribute isEqualToString:@"sadist"] && [action isEqualToString:@"touch"])		{ multiplyer = 1;}
	if( [attribute isEqualToString:@"pestilent"] && [action isEqualToString:@"touch"])	{ multiplyer = 1;}
	if( [attribute isEqualToString:@"religious"] && [action isEqualToString:@"say"])	{ multiplyer = 1;}
	if( [attribute isEqualToString:@"industrial"] && [action isEqualToString:@"give"])	{ multiplyer = 1;}
	if( [attribute isEqualToString:@"scientific"] && [action isEqualToString:@"say"])	{ multiplyer = 1;}
	if( [attribute isEqualToString:@"violent"] && [action isEqualToString:@"touch"])	{ multiplyer = 1;}
	if( [attribute isEqualToString:@"gentle"] && [action isEqualToString:@"say"])		{ multiplyer = 1;}
	if( [attribute isEqualToString:@"wise"] && [action isEqualToString:@"give"])		{ multiplyer = 1;}
	if( [attribute isEqualToString:@"ancient"] && [action isEqualToString:@"say"])		{ multiplyer = 1;}
	
	return multiplyer;
}


-(int)reactionFromAttribute :(NSString*)attribute :(NSString*)action :(NSString*)spell :(int)order
{	
	int value = 0;
	int orderMultiplyer = 3-order;
	
	// 8 each
	
	if( [attribute isEqualToString:@"deviant"] ){
		
		// Positive
		if( [spell isEqualToString:@"toys"])		{ value = 1;}
		if( [spell isEqualToString:@"ink"])			{ value = 1;}
		if( [spell isEqualToString:@"acid"])		{ value = 1;}
		if( [spell isEqualToString:@"guts"])		{ value = 1;}
		if( [spell isEqualToString:@"alcohol"])		{ value = 1;}
		if( [spell isEqualToString:@"feces"])		{ value = 1;}
		if( [spell isEqualToString:@"food"])		{ value = 1;}
		if( [spell isEqualToString:@"pain"])		{ value = 1;}
		if( [spell isEqualToString:@"drugs"])		{ value = 1;}

		// Negative
		if( [spell isEqualToString:@"money"])		{ value = -1;}
		if( [spell isEqualToString:@"mansion"])		{ value = -1;}
		if( [spell isEqualToString:@"paperwork"])	{ value = -1;}
		if( [spell isEqualToString:@"education"])	{ value = -1;}
		if( [spell isEqualToString:@"faith"])		{ value = -1;}
		if( [spell isEqualToString:@"weapons"])		{ value = -1;}
		if( [spell isEqualToString:@"gold"])		{ value = -1;}
		if( [spell isEqualToString:@"army"])		{ value = -2;}

		return value*orderMultiplyer;
	}
	if( [attribute isEqualToString:@"lustful"] ){
		
		// Positive
		if( [spell isEqualToString:@"food"])		{ value = 1;}
		if( [spell isEqualToString:@"children"])	{ value = 1;}
		if( [spell isEqualToString:@"genitals"])	{ value = 1;}
		if( [spell isEqualToString:@"love"])		{ value = 1;}
		if( [spell isEqualToString:@"alcohol"])		{ value = 1;}
		if( [spell isEqualToString:@"kitten"])		{ value = 1;}
		if( [spell isEqualToString:@"toys"])		{ value = 1;}
		if( [spell isEqualToString:@"blood"])		{ value = 1;}
		if( [spell isEqualToString:@"drugs"])		{ value = 1;}
		if( [spell isEqualToString:@"guts"])		{ value = 1;}
		
		// Negative
		if( [spell isEqualToString:@"garbage"])		{ value = -3;}
		if( [spell isEqualToString:@"ego"])			{ value = -2;}
		if( [spell isEqualToString:@"faith"])		{ value = -3;}
		if( [spell isEqualToString:@"paperwork"])	{ value = -2;}
		
		return value*orderMultiplyer;
	}
	if( [attribute isEqualToString:@"childish"] ){
		
		// Positive
		if( [spell isEqualToString:@"food"])		{ value = 2;}
		if( [spell isEqualToString:@"toys"])		{ value = 2;}
		if( [spell isEqualToString:@"children"])	{ value = 3;}
		if( [spell isEqualToString:@"love"])		{ value = 1;}

		// Negative
		if( [spell isEqualToString:@"money"])		{ value = -1;}
		if( [spell isEqualToString:@"blood"])		{ value = -1;}
		if( [spell isEqualToString:@"alcohol"])		{ value = -2;}
		if( [spell isEqualToString:@"pain"])		{ value = -2;}
		if( [spell isEqualToString:@"education"])	{ value = -1;}
		if( [spell isEqualToString:@"books"])		{ value = -1;}
		
		return value*orderMultiplyer;
	}
	if( [attribute isEqualToString:@"rich"] ){
		
		// Positive
		if( [spell isEqualToString:@"money"])		{ value = 1;}
		if( [spell isEqualToString:@"food"])		{ value = 1;}
		if( [spell isEqualToString:@"weapons"])		{ value = 1;}
		if( [spell isEqualToString:@"blood"])		{ value = 1;}
		if( [spell isEqualToString:@"paperwork"])	{ value = 1;}
		if( [spell isEqualToString:@"mansion"])		{ value = 1;}
		if( [spell isEqualToString:@"ego"])			{ value = 1;}
		if( [spell isEqualToString:@"gold"])		{ value = 1;}
		if( [spell isEqualToString:@"drugs"])		{ value = 1;}
		
		// Negative
		if( [spell isEqualToString:@"children"])	{ value = -2;}
		if( [spell isEqualToString:@"toys"])		{ value = -2;}
		if( [spell isEqualToString:@"garbage"])		{ value = -2;}
		if( [spell isEqualToString:@"pain"])		{ value = -2;}
		if( [spell isEqualToString:@"faith"])		{ value = -1;}
		
		return value*orderMultiplyer;
	}
	if( [attribute isEqualToString:@"greedy"] ){
		
		// Positive
		if( [spell isEqualToString:@"money"])		{ value = 1;}
		if( [spell isEqualToString:@"food"])		{ value = 1;}
		if( [spell isEqualToString:@"children"])	{ value = 1;}
		if( [spell isEqualToString:@"mansion"])		{ value = 1;}
		if( [spell isEqualToString:@"world"])		{ value = 2;}
		if( [spell isEqualToString:@"ego"])			{ value = 1;}
		
		// Negative
		if( [spell isEqualToString:@"love"])		{ value = -1;}
		if( [spell isEqualToString:@"blood"])		{ value = -1;}
		if( [spell isEqualToString:@"paperwork"])	{ value = -1;}
		if( [spell isEqualToString:@"garbage"])		{ value = -1;}
		if( [spell isEqualToString:@"genitals"])	{ value = -1;}
		if( [spell isEqualToString:@"mud"])			{ value = -1;}
		if( [spell isEqualToString:@"feces"])		{ value = -1;}
		if( [spell isEqualToString:@"faith"])		{ value = -1;}
		
		return value*orderMultiplyer;
	}
	if( [attribute isEqualToString:@"tribal"] ){
		
		// Positive
		if( [spell isEqualToString:@"food"])		{ value = 1;}
		if( [spell isEqualToString:@"weapons"])		{ value = 2;}
		if( [spell isEqualToString:@"gold"])		{ value = 1;}
		if( [spell isEqualToString:@"alcohol"])		{ value = 1;}
		if( [spell isEqualToString:@"army"])		{ value = 1;}
		if( [spell isEqualToString:@"faith"])		{ value = 1;}
		if( [spell isEqualToString:@"world"])		{ value = 1;}

		// Negative
		if( [spell isEqualToString:@"money"])		{ value = -2;}
		if( [spell isEqualToString:@"paperwork"])	{ value = -2;}
		if( [spell isEqualToString:@"mansion"])		{ value = -2;}
		if( [spell isEqualToString:@"education"])	{ value = -1;}
		if( [spell isEqualToString:@"technology"])	{ value = -1;}
		if( [spell isEqualToString:@"books"])		{ value = -1;}
		
		return value*orderMultiplyer;
	}
	if( [attribute isEqualToString:@"evil"] ){
		
		// Positive
		if( [spell isEqualToString:@"money"])		{ value = 1;}
		if( [spell isEqualToString:@"weapons"])		{ value = 1;}
		if( [spell isEqualToString:@"blood"])		{ value = 1;}
		if( [spell isEqualToString:@"solar system"]){ value = 1;}
		if( [spell isEqualToString:@"paperwork"])	{ value = 1;}
		if( [spell isEqualToString:@"army"])		{ value = 1;}
		if( [spell isEqualToString:@"mansion"])		{ value = 1;}
		if( [spell isEqualToString:@"ego"])			{ value = 1;}
		if( [spell isEqualToString:@"kitten"])		{ value = 1;}
		if( [spell isEqualToString:@"faith"])		{ value = 1;}

		// Negative
		if( [spell isEqualToString:@"toys"])		{ value = -2;}
		if( [spell isEqualToString:@"children"])	{ value = -3;}
		if( [spell isEqualToString:@"genitals"])	{ value = -1;}
		if( [spell isEqualToString:@"food"])		{ value = -2;}
		if( [spell isEqualToString:@"love"])		{ value = -2;}
		
		return value*orderMultiplyer;
	}
	if( [attribute isEqualToString:@"sadist"] ){
		
		// Positive
		if( [spell isEqualToString:@"blood"])		{ value = 2;}
		if( [spell isEqualToString:@"weapons"])		{ value = 2;}
		if( [spell isEqualToString:@"guts"])		{ value = 1;}
		if( [spell isEqualToString:@"toys"])		{ value = 1;}
		if( [spell isEqualToString:@"drugs"])		{ value = 1;}
		if( [spell isEqualToString:@"pain"])		{ value = 1;}
		
		// Negative
		if( [spell isEqualToString:@"kittens"])		{ value = -2;}
		if( [spell isEqualToString:@"children"])	{ value = -2;}
		if( [spell isEqualToString:@"money"])		{ value = -2;}
		if( [spell isEqualToString:@"education"])	{ value = -2;}
		
		return value*orderMultiplyer;
	}
	if( [attribute isEqualToString:@"pestilent"] ){
		
		// Positive
		if( [spell isEqualToString:@"guts"])		{ value = 1;}
		if( [spell isEqualToString:@"blood"])		{ value = 1;}
		if( [spell isEqualToString:@"feces"])		{ value = 2;}
		if( [spell isEqualToString:@"kittens"])		{ value = 1;}
		if( [spell isEqualToString:@"animals"])		{ value = 1;}
		if( [spell isEqualToString:@"gold"])		{ value = 1;}
		if( [spell isEqualToString:@"garbage"])		{ value = 1;}
		
		// Negative
		if( [spell isEqualToString:@"education"])	{ value = -1;}
		if( [spell isEqualToString:@"mansion"])		{ value = -1;}
		if( [spell isEqualToString:@"money"])		{ value = -1;}
		if( [spell isEqualToString:@"love"])		{ value = -3;}
		if( [spell isEqualToString:@"paperwork"])	{ value = -1;}
		if( [spell isEqualToString:@"faith"])		{ value = -1;}
		
		return value*orderMultiplyer;
	}
	if( [attribute isEqualToString:@"religious"] ){
		
		// Positive
		if( [spell isEqualToString:@"money"])		{ value = 1;}
		if( [spell isEqualToString:@"faith"])		{ value = 2;}
		if( [spell isEqualToString:@"weapons"])		{ value = 1;}
		if( [spell isEqualToString:@"children"])	{ value = 1;}
		if( [spell isEqualToString:@"blood"])		{ value = 1;}
		if( [spell isEqualToString:@"books"])		{ value = 1;}
		if( [spell isEqualToString:@"gold"])		{ value = 1;}
		
		// Negative
		if( [spell isEqualToString:@"love"])		{ value = -2;}
		if( [spell isEqualToString:@"alcohol"])		{ value = -2;}
		if( [spell isEqualToString:@"feces"])		{ value = -1;}
		if( [spell isEqualToString:@"kittens"])		{ value = -1;}
		if( [spell isEqualToString:@"ego"])			{ value = -1;}
		if( [spell isEqualToString:@"technology"])	{ value = -1;}
		
		return value*orderMultiplyer;
	}
	
	if( [attribute isEqualToString:@"industrial"] ){
		
		// Positive
		if( [spell isEqualToString:@"money"])		{ value = 2;}
		if( [spell isEqualToString:@"gold"])		{ value = 1;}
		if( [spell isEqualToString:@"weapons"])		{ value = 1;}
		if( [spell isEqualToString:@"army"])		{ value = 1;}
		if( [spell isEqualToString:@"garbage"])		{ value = 1;}
		if( [spell isEqualToString:@"alcohol"])		{ value = 1;}
		if( [spell isEqualToString:@"drugs"])		{ value = 1;}
		
		// Negative
		if( [spell isEqualToString:@"education"])	{ value = -2;}
		if( [spell isEqualToString:@"love"])		{ value = -2;}
		if( [spell isEqualToString:@"toys"])		{ value = -2;}
		if( [spell isEqualToString:@"paperwork"])	{ value = -2;}
		
		return value*orderMultiplyer;
	}
	if( [attribute isEqualToString:@"scientific"] ){
		
		// Positive
		if( [spell isEqualToString:@"kittens"])		{ value = 1;}
		if( [spell isEqualToString:@"money"])		{ value = 1;}
		if( [spell isEqualToString:@"paperwork"])	{ value = 1;}
		if( [spell isEqualToString:@"alcohol"])		{ value = 1;}
		if( [spell isEqualToString:@"technology"])	{ value = 1;}
		if( [spell isEqualToString:@"books"])		{ value = 1;}
		if( [spell isEqualToString:@"guts"])		{ value = 1;}
		if( [spell isEqualToString:@"education"])	{ value = 1;}
		if( [spell isEqualToString:@"world"])		{ value = 1;}
		
		// Negative
		if( [spell isEqualToString:@"children"])	{ value = -2;}
		if( [spell isEqualToString:@"food"])		{ value = -2;}
		if( [spell isEqualToString:@"love"])		{ value = -2;}
		if( [spell isEqualToString:@"faith"])		{ value = -1;}
		if( [spell isEqualToString:@"alcohol"])		{ value = -2;}
		
		return value*orderMultiplyer;
	}
	if( [attribute isEqualToString:@"violent"] ){
		
		// Positive
		if( [spell isEqualToString:@"kittens"])		{ value = 2;}
		if( [spell isEqualToString:@"money"])		{ value = 2;}
		if( [spell isEqualToString:@"gold"])		{ value = 2;}
		if( [spell isEqualToString:@"love"])		{ value = 1;}
		if( [spell isEqualToString:@"genitals"])	{ value = 1;}
		if( [spell isEqualToString:@"alcohol"])		{ value = 1;}
		
		// Negative
		if( [spell isEqualToString:@"gold"])		{ value = -2;}
		if( [spell isEqualToString:@"toys"])		{ value = -2;}
		if( [spell isEqualToString:@"education"])	{ value = -2;}
		if( [spell isEqualToString:@"pain"])		{ value = -2;}
		
		return value*orderMultiplyer;
	}
	if( [attribute isEqualToString:@"gentle"] ){
		
		// Positive
		if( [spell isEqualToString:@"food"])		{ value = 1;}
		if( [spell isEqualToString:@"toys"])		{ value = 1;}
		if( [spell isEqualToString:@"children"])	{ value = 1;}
		if( [spell isEqualToString:@"genitals"])	{ value = 1;}
		if( [spell isEqualToString:@"education"])	{ value = 1;}
		if( [spell isEqualToString:@"love"])		{ value = 1;}
		if( [spell isEqualToString:@"faith"])		{ value = 1;}
		if( [spell isEqualToString:@"books"])		{ value = 1;}
		if( [spell isEqualToString:@"guts"])		{ value = 1;}
		
		// Negative
		if( [spell isEqualToString:@"pain"])		{ value = -2;}
		if( [spell isEqualToString:@"money"])		{ value = -2;}
		if( [spell isEqualToString:@"gold"])		{ value = -2;}
		if( [spell isEqualToString:@"army"])		{ value = -2;}
		if( [spell isEqualToString:@"alcohol"])		{ value = -1;}
		if( [spell isEqualToString:@"weapons"])		{ value = -1;}
		
		return value*orderMultiplyer;
	}
	if( [attribute isEqualToString:@"wise"] ){
		
		// Positive
		if( [spell isEqualToString:@"education"])	{ value = 2;}
		if( [spell isEqualToString:@"love"])		{ value = 2;}
		if( [spell isEqualToString:@"money"])		{ value = 2;}
		if( [spell isEqualToString:@"food"])		{ value = 1;}
		if( [spell isEqualToString:@"technology"])	{ value = 1;}
		
		// Negative
		if( [spell isEqualToString:@"pain"])		{ value = -2;}
		if( [spell isEqualToString:@"blood"])		{ value = -2;}
		if( [spell isEqualToString:@"genitals"])	{ value = -2;}
		if( [spell isEqualToString:@"alcohol"])		{ value = -1;}
		if( [spell isEqualToString:@"faith"])		{ value = -1;}
		
		return value*orderMultiplyer;
	}
	if( [attribute isEqualToString:@"ancient"] ){
		
		// Positive
		if( [spell isEqualToString:@"gold"])		{ value = 2;}
		if( [spell isEqualToString:@"love"])		{ value = 2;}
		if( [spell isEqualToString:@"children"])	{ value = 1;}
		if( [spell isEqualToString:@"faith"])		{ value = 1;}
		if( [spell isEqualToString:@"alcohol"])		{ value = 1;}
		if( [spell isEqualToString:@"books"])		{ value = 1;}
		
		// Negative
		if( [spell isEqualToString:@"education"])	{ value = -2;}
		if( [spell isEqualToString:@"blood"])		{ value = -2;}
		if( [spell isEqualToString:@"genitals"])	{ value = -1;}
		if( [spell isEqualToString:@"alcohol"])		{ value = -1;}
		if( [spell isEqualToString:@"mansion"])		{ value = -1;}
		if( [spell isEqualToString:@"technology"])	{ value = -1;}
		
		return value*orderMultiplyer;
	}
	
	return 0;
}

-(NSString*)failureFromAttributes :(NSString*)name :(NSArray*)attr
{
	return [NSString stringWithFormat:@"%@ %@ %@ in your %@, killing you.", [name capitalizedString], [self syllableFromAttribute:attr[0]:7], [self syllableFromAttribute:attr[1]:8], [self syllableFromAttribute:attr[2]:9] ];
}
-(NSString*)successFromAttributes :(NSArray*)attr
{
	return @"";
}


-(NSString*)relatioshipNameFromValue :(int)value
{
	if(value > 15){ return @"loving"; }
	else if(value > 10){ return @"friendly"; }
	else if(value > 5){ return @"accepting"; }
	else if(value > 1){ return @"casual"; }
	
	else if(value < -15){ return @"enemy"; }
	else if(value < -10){ return @"homicidal"; }
	else if(value < -5){ return @"hostile"; }
	else if(value < -1){ return @"annoyed"; }
	
	return @"neutral";
}

-(NSString*)actionFromRelationship :(int)relationship
{
	if(relationship < -15 ){ return @"punches you with their"; }
	if(relationship < -10 ){ return @"slaps you with their"; }
	if(relationship < -5 ){ return @"hits you with their"; }
	
	if(relationship == 0 ){ return @"shows you their"; }
	
	if(relationship > 15 ){ return @"offers you their"; }
	if(relationship > 10 ){ return @"presents you their"; }
	if(relationship > 5 ){ return @"shows you their"; }
	
	
	return @"punches";
}

@end
