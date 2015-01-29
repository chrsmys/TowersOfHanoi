//
//  Queue.m
//  TowersOfHanoi
//
//  Created by Chris Mays on 2/8/14.
//  Copyright (c) 2014 Chris Mays. All rights reserved.
//

#import "Queue.h"

@implementation Queue
-(id)init{
    self=[super init];
    queue=[[NSMutableArray alloc] init];
    return self;
}
-(BOOL)add:(NSObject*)obj{
    if(obj!=NULL){
        [queue addObject:obj];
        return true;
    }
    return false; 
}
-(NSObject *)remove{
    if(![self isEmpty]){
        NSObject *ob=[queue objectAtIndex:0];
        [queue removeObjectAtIndex:0];
        return ob;
    }else{
        return NULL;
    }
}
-(NSObject *)peek{
    if(![self isEmpty]){
        NSObject *ob=[queue objectAtIndex:0];
        return ob;
    }else{
        return NULL;
    }
}
-(NSMutableArray *)getQueue{
    return queue;
}
-(BOOL)isEmpty{
    return [queue count]==0;
}


@end
