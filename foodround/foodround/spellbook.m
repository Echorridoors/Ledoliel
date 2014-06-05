//
//  UIViewController+spellbook.m
//  foodround
//
//  Created by Devine Lu Linvega on 2014-06-05.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "spellbook.h"

@implementation UIViewController (spellbook)

-(NSMutableDictionary*)spellbookStart
{
	NSMutableDictionary* newSpellbook = [[NSMutableDictionary alloc]initWithCapacity:10];
	
	newSpellbook[@"money"] = [[NSMutableDictionary alloc]initWithCapacity:3];
	newSpellbook[@"money"][@"touch"] = [[NSMutableDictionary alloc]initWithCapacity:3];
	newSpellbook[@"money"][@"touch"][@"rich"] = @"-1";
	
	newSpellbook[@"forehead"] = [[NSMutableDictionary alloc]initWithCapacity:3];
	newSpellbook[@"forehead"][@"touch"] = [[NSMutableDictionary alloc]initWithCapacity:3];
	newSpellbook[@"forehead"][@"touch"][@"rich"] = @"1";

	return newSpellbook;
}


@end
