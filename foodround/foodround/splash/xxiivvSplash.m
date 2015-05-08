//
//  splash.m
//  Entaloneralie
//
//  Created by Devine Lu Linvega on 2013-06-06.
//  Copyright (c) 2013 XXIIVV. All rights reserved.
//

#import "xxiivvSplash.h"

#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

AVAudioPlayer *audioPlayerSplash;

@implementation splash

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self start];
}

-(void)start
{
	supportUrl = @"http://wiki.xxiivv.com/Ledoliel";
	
	[self splashTemplate];
//	[self audioPlayerSplash:@"splash.tune.wav"];
	[self apiContact:@"ledoliel":@"analytics":@"launch":@"1"];
//	[NSTimer scheduledTimerWithTimeInterval:3.5 target:self selector:@selector(splashClose) userInfo:nil repeats:NO]; // Uncomment
	
	NSArray *schemesList = @[@"between",@"test",@"ledoliel",@"sdgsdfgsf"];
	
	for (NSString* scheme in schemesList) {
		
		NSString * schemeString = [NSString stringWithFormat:@"%@://",scheme];
		
		BOOL installed = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:schemeString]];
		
		if( installed ) {
			NSLog(@"%@ -> working!",scheme);
		}else {
			NSLog(@"%@ -> failed!",scheme);
		}
	}
	
}

- (void) splashTemplate
{
	CGRect screen = [[UIScreen mainScreen] bounds];
	float screenMargin = screen.size.width/4;
	
	UIImageView * logoView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
	logoView.backgroundColor = [UIColor redColor];
	[logoView setImage:[UIImage imageNamed:@"splash.logo.png"]];
	logoView.contentMode = UIViewContentModeCenter;
	logoView.contentMode = UIViewContentModeScaleAspectFit;
	[self.view addSubview:logoView];
	
	UIButton * testButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
	testButton.backgroundColor = [UIColor blueColor];
	[testButton setTitle:@"test time" forState:UIControlStateNormal];
	[self.view addSubview:testButton];
}

- (void) splashClose
{
	[self performSegueWithIdentifier: @"skip" sender: self];
}

- (IBAction)btnSplashSupport:(id)sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:supportUrl]];
}

-(void)setImage :(UIImageView*)viewName :(NSString*)imageName
{
    NSString *imgFile = [[NSBundle mainBundle] pathForResource:imageName ofType:nil];
    viewName.image = nil;
	viewName.image = [UIImage imageWithContentsOfFile:imgFile];
}

-(void)audioPlayerSplash: (NSString *)filename;
{
	NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
	resourcePath = [resourcePath stringByAppendingString: [NSString stringWithFormat:@"/%@", filename] ];
	NSError* err;
	audioPlayerSplash = [[AVAudioPlayer alloc] initWithContentsOfURL: [NSURL fileURLWithPath:resourcePath] error:&err];
	
	audioPlayerSplash.volume = 0.5;
	audioPlayerSplash.numberOfLoops = 0;
	audioPlayerSplash.currentTime = 0;
	
	if(err)	{ NSLog(@"%@",err); }
	else	{
		[audioPlayerSplash prepareToPlay];
		[audioPlayerSplash play];
	}
}

-(void)apiContact:(NSString*)source :(NSString*)method :(NSString*)term :(NSString*)value
{
	NSString *post = [NSString stringWithFormat:@"values={\"term\":\"%@\",\"value\":\"%@\"}",term,value];
	NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
	
	NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
	
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
	[request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://api.xxiivv.com/%@/%@",source,method]]];
	[request setHTTPMethod:@"POST"];
	[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
	[request setValue:@"application/x-www-form-urlencoded;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
	[request setHTTPBody:postData];
	
	NSURLResponse *response;
	NSData *POSTReply = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
	NSString *theReply = [[NSString alloc] initWithBytes:[POSTReply bytes] length:[POSTReply length] encoding: NSASCIIStringEncoding];
	NSLog(@"&  API | %@: %@",method, theReply);
	
	return;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
