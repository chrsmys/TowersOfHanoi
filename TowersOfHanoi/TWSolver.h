//
//  TWSolver.h
//  TowersOfHanoi
//
//  Created by Chris Mays on 2/9/14.
//  Copyright (c) 2014 Chris Mays. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Queue.h"
#import "TWState.h"
#import "TWStack.h"
@interface TWSolver : NSObject{
    Queue *stateQueue;
}
-(id)initWithState:(TWState *)st;
-(TWStack *)startSolving;
@end
