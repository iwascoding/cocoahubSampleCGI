//
//  CHCGI.m
//  cocoahubSampleCGI
//
//  Created by ilja on 03.04.13.
//  Copyright (c) 2013 iwascoding. All rights reserved.
//

#import "CHCGI.h"

@interface CHCGI ()

@property (strong) NSData	*responseHTTPBody;
@property (strong) NSString	*contentType;

@end

@implementation CHCGI

- (void) generateResponse
{
	NSURLRequest		*request = [self receivedRequest];
	NSHTTPURLResponse	*response = [self responseForRequest:request];
	
	[self printResponse:response];
}

- (NSURLRequest*) receivedRequest
{
	NSDictionary		*environment = [[NSProcessInfo processInfo] environment];
	NSURL				*requestURL = [NSURL URLWithString:environment[@"REQUEST_URI"]];
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:requestURL];
	//NSFileHandle		*input = [NSFileHandle fileHandleWithStandardInput];
	
	request.HTTPMethod = environment[@"REQUEST_METHOD"];
	
	//request.HTTPBody = [input readDataToEndOfFile];
	
	return request;
}

- (NSHTTPURLResponse*) responseForRequest:(NSURLRequest*)inRequest
{
	NSString			*responseString;
	NSHTTPURLResponse	*response = [[NSHTTPURLResponse alloc] initWithURL:nil
															  statusCode:200
															 HTTPVersion:@"1.1"
															headerFields:@{}];
	
	self.contentType = @"text/html";
	responseString = [NSString stringWithFormat:@"<html><head></head><body>Hello World, this is cocoahub!<br/><br/> \
	I received a %@ request for URI %@</body></html>", inRequest.HTTPMethod, [inRequest.URL absoluteString]];
	
	self.responseHTTPBody = [responseString dataUsingEncoding:NSUTF8StringEncoding];
	
	return response;
}

- (void) printResponse:(NSHTTPURLResponse*) inResponse
{
	//TODO: we need to parse status code and response headers on the cocoahub side
	//printf ("Status: %ld \n", inResponse.statusCode);
	//printf ("\n");
	if (self.responseHTTPBody)
	{
		printf("%s", [[[NSString alloc] initWithData:self.responseHTTPBody encoding:NSUTF8StringEncoding] cStringUsingEncoding:NSUTF8StringEncoding]);
	}
}

@end
