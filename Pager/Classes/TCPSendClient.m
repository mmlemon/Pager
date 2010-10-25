//
//  TCPSendClient.m
//  Pad
//
//  Created by mmlemon on 09/11/27.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TCPSendClient.h"


@implementation TCPSendClient

@dynamic connected;

-(BOOL)getConnected
{
	return _connected;
}



-(void)connect:(NSString *)ip toPort:(NSInteger)port
{
	if(_connected)
	{
		return;
	}
	_connected = NO;
	servIP = [ip UTF8String];
	servPort = port;
	
	if((sock = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0)
	{
		NSLog(@"socket creation error.");
		return;
	}
	
	memset(&servAddr, 0, sizeof(servAddr));
	servAddr.sin_family = AF_INET;
	servAddr.sin_addr.s_addr = inet_addr(servIP);
	servAddr.sin_port = htons(servPort);
	
	if(connect(sock, (struct sockaddr *)&servAddr, sizeof(servAddr)) < 0)
	{
		NSLog(@"connect error.");
		return;
	}
	_connected = YES;
	NSLog(@"connect succeed.");
}
-(void)send:(NSString *)message
{
	mes = [message UTF8String];
	mesLen = strlen(mes);
	
	if(send(sock, mes, mesLen, 0) != mesLen)
	{
		NSLog(@"send failed.");
	}
	
}
-(void)close
{
	close(sock);
	_connected = NO;
}

-(id)init
{
	return [super init];
}

-(void)dealloc
{
	[super dealloc];
}

@end
