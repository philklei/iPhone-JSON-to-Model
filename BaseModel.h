//
//  BaseModel.h
//  Eventknecht
//
//  Created by Philip Kleimeyer on 23.01.11.
//  Copyright 2011 Eventknecht. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BaseModel : NSObject {

}

-(void)initWithDictionary:(NSDictionary *)dictionary;
-(void)initWithValueList:(NSDictionary *)dictionary;
-(NSString *)getClassName;

@end
