//
//  Queue.h
//  TowersOfHanoi
//
//  Created by Chris Mays on 2/8/14.
//  Copyright (c) 2014 Chris Mays. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Queue : NSObject{
    NSMutableArray *queue;
}
-(BOOL)add:(NSObject*)obj;
-(NSObject *)remove;
-(NSObject *)peek; //View the item in the front of the queue
-(BOOL)isEmpty; //Returns true if empty
-(NSMutableArray *)getQueue; //Returns the NSMutableArray behind the scenes
//Yes I know that queues shouldn't have this feature, but I find it useful 
@end
