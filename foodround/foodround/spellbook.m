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
	
	newSpellbook[@"say"] = [[NSMutableDictionary alloc]initWithCapacity:100];
	newSpellbook[@"say"][@"hello"] = @[@"hey",@"hey"];
	newSpellbook[@"touch"] = [[NSMutableArray alloc]initWithCapacity:100];
	newSpellbook[@"give"] = [[NSMutableArray alloc]initWithCapacity:100];
	
	return newSpellbook;
}


@end
