//
//  Participant.m
//
//  Created by Philip Kleimeyer on 22.01.11.
//  Copyright 2011 Philip Kleimeyer. All rights reserved.
//

#import "Event.h"
#import <objc/runtime.h>

@implementation Participant

@synthesize __id, is_admin, name, phone;

-(void) dealloc {
	[super dealloc];
	[__id release];
	[is_admin release];
	[name release];
	[phone release];
}

@end
