//
//  main.m
//  cocoahubSampleCGI
//
//  Created by ilja on 02.04.13.
//  Copyright (c) 2013 iwascoding. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CHSampleCGI.h"

int main(int argc, const char * argv[])
{
	@autoreleasepool {
	    // insert code here...
	    [[[CHSampleCGI alloc] init] generateResponse];
		
	}
    return 0;
}

