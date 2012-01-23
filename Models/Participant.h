//
//  Participant.h
//
//  Created by Philip Kleimeyer on 22.01.11.
//  Copyright 2011 Philip Kleimeyer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface Participant : BaseModel {
	NSNumber *__id;
	NSString *name;
	NSString *phone;
	NSNumber *is_admin;
   	
}
@property (nonatomic, retain) NSNumber *__id;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *phone;
@property (nonatomic, retain) NSNumber *is_admin;

@end
