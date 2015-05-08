//
//  UIViewController+tools.m
//  foodround
//
//  Created by Devine Lu Linvega on 2014-06-05.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

#import "tools.h"

@implementation UIViewController (tools)

- (id)randomObjectInArray:(NSArray*)arrayInput
{
	if ([arrayInput count] == 0) {
		return nil;
	}
	return [arrayInput objectAtIndex: arc4random() % [arrayInput count]];
}

- (NSMutableArray*)shuffleArray :(NSArray*)targetArray
{
	NSMutableArray * newArray = [[NSMutableArray alloc] initWithArray:targetArray];
	
	NSUInteger count = [targetArray count];
	for (uint i = 0; i < count; ++i)
	{
		// Select a random element between i and end of array to swap with.
		int nElements = (int)count - i;
		int n = arc4random_uniform(nElements) + i;
		[newArray exchangeObjectAtIndex:i withObjectAtIndex:n];
	}
	
	return newArray;
}



@end
