//
//  Event.m
//
//  Created by Philip Kleimeyer on 22.01.11.
//  Copyright 2011 Philip Kleimeyer. All rights reserved.
//

#import "Event.h"
#import <objc/runtime.h>

@implementation Project

@synthesize __id, title, description, participants;

-(void) dealloc {
	[super dealloc];
	[__id release];
	[title release];
	[description release];
	[participants release];
}

@end
