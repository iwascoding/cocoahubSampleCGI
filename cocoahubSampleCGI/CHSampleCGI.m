//
//  CHSampleCGI.m
//  cocoahubSampleCGI
//
//  Created by ilja on 03.04.13.
//  Copyright (c) 2013 iwascoding. All rights reserved.
//

#import "CHSampleCGI.h"

@implementation CHSampleCGI

- (NSHTTPURLResponse*) responseForRequest:(NSURLRequest*)inRequest
{
	NSString			*responseString;
	NSHTTPURLResponse	*response = [[NSHTTPURLResponse alloc] initWithURL:nil
															  statusCode:200
															 HTTPVersion:@"1.1"
															headerFields:@{@"Customer Header" : @"Value"}];
	
	responseString = [NSString stringWithFormat:@"<html><head></head><body>Hello World, this is cocoahub!<br/><br/> \
					  I received a %@ request for URI %@</body></html>",
					  inRequest.HTTPMethod,
					  [inRequest.URL absoluteString]];
	
	self.responseHTTPBody = [responseString dataUsingEncoding:NSUTF8StringEncoding];
	self.contentType = @"text/html";
	
	return response;
}

@end
