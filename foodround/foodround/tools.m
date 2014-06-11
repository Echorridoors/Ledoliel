//
//  UIViewController+tools.m
//  foodround
//
//  Created by Devine Lu Linvega on 2014-06-05.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import "tools.h"

@implementation UIViewController (tools)

- (id)randomObjectInArray:(NSArray*)arrayInput
{
	if ([arrayInput count] == 0) {
		return nil;
	}
	return [arrayInput objectAtIndex: arc4random() % [arrayInput count]];
}

-(NSArray*)shuffleArray :(NSArray*)array
{
	NSMutableArray *shuffledArray = [[NSMutableArray alloc] initWithArray:array];
	for (int i = shuffledArray.count - 1; i >= 0; --i) {
		int r = arc4random_uniform(shuffledArray.count);
		[shuffledArray exchangeObjectAtIndex:i withObjectAtIndex:r];
	}
	
	return shuffledArray;
}


@end
