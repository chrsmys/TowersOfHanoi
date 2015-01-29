//
//  TWStack.h
//  TowersOfHanoi
//
//  Created by Chris Mays on 2/8/14.
//  Copyright (c) 2014 Chris Mays. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TWStack : NSObject{
    NSMutableArray *stack;
}
-(id)init;
-(BOOL)push:(NSObject *)item;
-(NSObject *)pop;
-(NSObject *)peek;
-(BOOL)isEmpty;
-(int)getCount;
@end
