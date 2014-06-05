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
	newUser[@"spellbook"][@"say"][0] = @"hello";
	newUser[@"spellbook"][@"say"][1] = @"test";
	
	newUser[@"spellbook"][@"touch"] = [[NSMutableArray alloc]initWithCapacity:2];
	newUser[@"spellbook"][@"touch"][0] = @"money";
	newUser[@"spellbook"][@"touch"][1] = @"forehead";
	
	newUser[@"spellbook"][@"give"] = [[NSMutableArray alloc]initWithCapacity:2];
	newUser[@"spellbook"][@"give"][0] = @"fish";
	newUser[@"spellbook"][@"give"][1] = @"money";
	
	newUser[@"spellbook"][@"leave"] = [[NSMutableArray alloc]initWithCapacity:1];
	newUser[@"spellbook"][@"leave"][0] = @"hastily";
	
	newUser[@"session"] = [[NSMutableDictionary alloc]initWithCapacity:3];
	
	newUser[@"session"][@"guestRelationship"] = @"0";
	
	return newUser;
}

@end
