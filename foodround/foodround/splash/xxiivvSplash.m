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

UIImageView * logoView;
UIView * ecosystemContainer;


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
	
	[self ecosystemCheck];
}

- (void) splashTemplate
{
	CGRect screen = [[UIScreen mainScreen] bounds];
	float screenMargin = screen.size.width/8;
	
	logoView = [[UIImageView alloc] initWithFrame:CGRectMake((screen.size.width/2)-60, (screen.size.height/2)-60, 120, 120)];
	[logoView setImage:[UIImage imageNamed:@"splash.logo.png"]];
	logoView.contentMode = UIViewContentModeCenter;
	logoView.contentMode = UIViewContentModeScaleAspectFit;
	[self.view addSubview:logoView];
	
	UIButton * testButton = [[UIButton alloc] initWithFrame:CGRectMake(0, screen.size.height*0.75, screen.size.width, screenMargin)];
	[testButton setTitle:@"APPLICATION SUPPORT" forState:UIControlStateNormal];
	testButton.titleLabel.font = [UIFont fontWithName:@"DINAlternate-Bold" size:11];
	[self.view addSubview:testButton];
		
	ecosystemContainer = [[UIView alloc] initWithFrame:CGRectMake( (screen.size.width/2)-(screenMargin/2), screen.size.height-(screen.size.height/2)-screenMargin, screenMargin, screen.size.height/2)];
	[self.view addSubview:ecosystemContainer];
}

-(void)ecosystemCheck
{
	NSArray *schemesList = @[@"between",@"test",@"ledoliel",@"sdgsdfgsf",@"something",@"what",@"sdgsdfgsf",@"ledoliel",@"what",@"ledoliel"];
	CGFloat schemeIconTile = (ecosystemContainer.frame.size.width/4);
	CGFloat schemeIconSize = (ecosystemContainer.frame.size.width/4)-5;
	
	int count = 0;
	for (NSString* schemeName in schemesList) {
		
		NSString * schemeString = [NSString stringWithFormat:@"%@://",schemeName];
		BOOL installed = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:schemeString]];
		
		UIView * schemeView = [[UIView alloc] initWithFrame:CGRectMake( (schemeIconTile * (count % 4)), ecosystemContainer.frame.size.height - ((count/4)+1) * schemeIconTile, schemeIconSize, schemeIconSize)];
		schemeView.layer.cornerRadius = schemeIconSize/2;
		
		if( installed ) {
			NSLog(@"%@ -> working!",schemeName);
			schemeView.backgroundColor = [UIColor whiteColor];
		}else {
			NSLog(@"%@ -> failed!",schemeName);
		schemeView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.15];
		}
		
		[ecosystemContainer addSubview:schemeView];
		
		count += 1;
		
	}
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
