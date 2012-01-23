//
//  Project.h
//
//  Created by Philip Kleimeyer on 22.01.11.
//  Copyright 2011 Eventknecht. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface Project : BaseModel {
	NSNumber *__id;
	NSArray *participants;
	
	NSString *title;
	NSString *description;
	
   	
}
@property (nonatomic, retain) NSNumber *__id;
@property (nonatomic, retain) NSArray *participants;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *description;
@end
