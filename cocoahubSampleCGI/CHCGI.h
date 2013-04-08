//
//  CHCGI.h
//  cocoahubSampleCGI
//
//  Created by ilja on 03.04.13.
//  Copyright (c) 2013 iwascoding. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHCGI : NSObject

- (void) generateResponse;

@property (strong) NSData	*responseHTTPBody;
@property (strong) NSString	*contentType;

@end
