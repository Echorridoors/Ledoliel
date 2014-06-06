//
//  UIViewController+user.m
//  foodround
//
//  Created by Devine Lu Linvega on 2014-06-05.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "user.h"

@implementation UIViewController (user)

-(NSMutableDictionary*)userStart
{
	NSMutableDictionary* newUser = [[NSMutableDictionary alloc]initWithCapacity:10];
	
	newUser[@"spellbook"] = [[NSMutableDictionary alloc]initWithCapacity:3];
	
	newUser[@"spellbook"][@"say"] = [[NSMutableArray alloc]initWithCapacity:2];
	newUser[@"spellbook"][@"say"][0] = [[NSMutableDictionary alloc]initWithCapacity:2];
	newUser[@"spellbook"][@"say"][0][@"name"] = @"hello";
	newUser[@"spellbook"][@"say"][0][@"status"] = @"normal";
	newUser[@"spellbook"][@"say"][1] = [[NSMutableDictionary alloc]initWithCapacity:2];
	newUser[@"spellbook"][@"say"][1][@"name"] = @"test";
	newUser[@"spellbook"][@"say"][1][@"status"] = @"normal";
	
	newUser[@"spellbook"][@"touch"] = [[NSMutableArray alloc]initWithCapacity:2];
	newUser[@"spellbook"][@"touch"][0] = [[NSMutableDictionary alloc]initWithCapacity:2];
	newUser[@"spellbook"][@"touch"][0][@"name"] = @"forehead";
	newUser[@"spellbook"][@"touch"][0][@"status"] = @"normal";
	newUser[@"spellbook"][@"touch"][1] = [[NSMutableDictionary alloc]initWithCapacity:2];
	newUser[@"spellbook"][@"touch"][1][@"name"] = @"eggs";
	newUser[@"spellbook"][@"touch"][1][@"status"] = @"normal";
	
	newUser[@"spellbook"][@"give"] = [[NSMutableArray alloc]initWithCapacity:2];
	newUser[@"spellbook"][@"give"][0] = [[NSMutableDictionary alloc]initWithCapacity:2];
	newUser[@"spellbook"][@"give"][0][@"name"] = @"fish";
	newUser[@"spellbook"][@"give"][0][@"status"] = @"normal";
	newUser[@"spellbook"][@"give"][1] = [[NSMutableDictionary alloc]initWithCapacity:2];
	newUser[@"spellbook"][@"give"][1][@"name"] = @"cardboard";
	newUser[@"spellbook"][@"give"][1][@"status"] = @"normal";
	
	newUser[@"spellbook"][@"leave"] = [[NSMutableArray alloc]initWithCapacity:2];
	newUser[@"spellbook"][@"leave"][0] = [[NSMutableDictionary alloc]initWithCapacity:2];
	newUser[@"spellbook"][@"leave"][0][@"name"] = @"1";
	newUser[@"spellbook"][@"leave"][0][@"status"] = @"1";
	newUser[@"spellbook"][@"leave"][1] = [[NSMutableDictionary alloc]initWithCapacity:2];
	newUser[@"spellbook"][@"leave"][1][@"name"] = @"1";
	newUser[@"spellbook"][@"leave"][1][@"status"] = @"1";
	
	newUser[@"session"] = [[NSMutableDictionary alloc]initWithCapacity:3];
	
	newUser[@"session"][@"guestRelationship"] = @"0";
	
	return newUser;
}

@end
