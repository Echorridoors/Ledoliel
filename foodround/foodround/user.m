//
//  UIViewController+user.m
//  foodround
//
//  Created by Devine Lu Linvega on 2014-06-05.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "user.h"
#import "tools.h"

@implementation UIViewController (user)

-(NSMutableDictionary*)userStart
{
	NSLog(@"+ USER | Created");
	
	NSMutableDictionary* newUser = [[NSMutableDictionary alloc]initWithCapacity:10];
	
	NSArray* spellRandom = [self shuffleArray:[self userSpells]];
	
	NSLog(@"! %@",spellRandom);
	
	newUser[@"spellbook"] = [[NSMutableDictionary alloc]initWithCapacity:3];
	
	newUser[@"spellbook"][@"say"] = [[NSMutableArray alloc]initWithCapacity:2];
	newUser[@"spellbook"][@"say"][0] = [[NSMutableDictionary alloc]initWithCapacity:2];
	newUser[@"spellbook"][@"say"][0][@"name"] = spellRandom[0];
	newUser[@"spellbook"][@"say"][0][@"status"] = @"normal";
	newUser[@"spellbook"][@"say"][1] = [[NSMutableDictionary alloc]initWithCapacity:2];
	newUser[@"spellbook"][@"say"][1][@"name"] = spellRandom[1];
	newUser[@"spellbook"][@"say"][1][@"status"] = @"normal";
	
	newUser[@"spellbook"][@"touch"] = [[NSMutableArray alloc]initWithCapacity:2];
	newUser[@"spellbook"][@"touch"][0] = [[NSMutableDictionary alloc]initWithCapacity:2];
	newUser[@"spellbook"][@"touch"][0][@"name"] = spellRandom[2];
	newUser[@"spellbook"][@"touch"][0][@"status"] = @"normal";
	newUser[@"spellbook"][@"touch"][1] = [[NSMutableDictionary alloc]initWithCapacity:2];
	newUser[@"spellbook"][@"touch"][1][@"name"] = spellRandom[3];
	newUser[@"spellbook"][@"touch"][1][@"status"] = @"normal";
	
	newUser[@"spellbook"][@"give"] = [[NSMutableArray alloc]initWithCapacity:2];
	newUser[@"spellbook"][@"give"][0] = [[NSMutableDictionary alloc]initWithCapacity:2];
	newUser[@"spellbook"][@"give"][0][@"name"] = spellRandom[4];
	newUser[@"spellbook"][@"give"][0][@"status"] = @"normal";
	newUser[@"spellbook"][@"give"][1] = [[NSMutableDictionary alloc]initWithCapacity:2];
	newUser[@"spellbook"][@"give"][1][@"name"] = spellRandom[5];
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

-(NSArray*)userSpells
{
	return @[@"money",@"food",@"toys",@"weapons",@"potato",@"gold",@"coal"];
}


@end
