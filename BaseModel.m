//
//  BaseModel.m
//  Eventknecht
//
//  Created by Philip Kleimeyer on 23.01.11.
//  Copyright 2011 Eventknecht. All rights reserved.
//

#import "BaseModel.h"
#import <objc/runtime.h>

@implementation BaseModel

-(NSString *)getClassName {	
	return [NSStringFromClass([self class]) lowercaseString];
}

-(void)initWithDictionary:(NSDictionary *)dictionary {
	if ([dictionary count] > 1) {
		[self initWithValueList:dictionary];
	} else {
		NSDictionary *values = [dictionary objectForKey: [self getClassName]];
		[self initWithValueList:values];
	}
}

-(void)initWithValueList:(NSDictionary *)dictionary {
	unsigned int count = 0;
	
	objc_property_t* properties = class_copyPropertyList([self class], &count);
	
	for (int i = 0; i < count ; i++)
	{
		const char* propertyName = property_getName(properties[i]);
		NSString *name = [NSString  stringWithCString:propertyName encoding:NSUTF8StringEncoding];
		id val = [dictionary objectForKey:[name stringByReplacingOccurrencesOfString:@"__" withString:@""]];
		//id *val = [dictionary objectForKey:name];
		
		if ([val isKindOfClass:[NSDictionary class]]) {
			id cls = [[NSClassFromString([name capitalizedString]) alloc] init];
			[cls initWithValueList:(NSDictionary *)val];
			[self setValue:cls forKey:name];
			[cls release];
        } else if ([val isKindOfClass:[NSMutableArray class]]) {
            NSMutableArray *some_arr = [[NSMutableArray alloc] init];
            for (NSDictionary *d in val) {
                NSString *tml_name = [name substringToIndex:[name length] -1];
                id cls = [[NSClassFromString([tml_name capitalizedString]) alloc] init];
                [cls initWithValueList:(NSDictionary *)d];
                [some_arr addObject:cls];
                
                [cls release];
            }
            [self setValue:some_arr forKey:name];
            
		} else	{
			if (val != nil) {
				[self setValue:val forKey:name];
			}
		}
	}
	free( properties );
}

-(void) dealloc {
	[super dealloc];
}

@end
