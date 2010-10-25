//
//  TCPSendClient.h
//  Pad
//
//  Created by mmlemon on 09/11/27.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <stdio.h>
#import <sys/socket.h>
#import <arpa/inet.h>
#import <stdlib.h>
#import <string.h>
#import <unistd.h>

@interface TCPSendClient : NSObject {
	int sock;
	struct sockaddr_in servAddr;
	unsigned short servPort;
	const char *servIP;
	const char *mes;
	unsigned int mesLen;
	BOOL _connected;
}

-(void)connect:(NSString *)ip toPort:(NSInteger)port;
-(void)send:(NSString *)message;
-(void)close;
-(BOOL)getConnected;
@property(readonly) BOOL connected;

@end
