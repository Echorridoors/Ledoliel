//
//  xxiivvViewController.m
//  foodround
//
//  Created by Devine Lu Linvega on 2014-06-04.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//
#define console(arg) NSLog(arg)
#define to_i(arg) [arg intValue]
#define to_s(arg) [NSString stringWithFormat:@"%d",arg]

#define screenWidth self.view.frame.size.width
#define screenHeight self.view.frame.size.height

#import "xxiivvViewController.h"
#import "template.h"
#import "user.h"
#import "guest.h"
#import "spellbook.h"
#import "tools.h"

@interface xxiivvViewController ()

@end

@implementation xxiivvViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self start];
}

-(void)start
{
	console(@"GAME  | Init");
	
	user = [self userStart];
	guest = [self guestStart];
	spellbook = [self spellbookStart];
	[self templateStart];
	[self sessionStart];
}

-(void)sessionStart
{
	console(@"GAME  | Start");
	
	self.guestNameLabel.text = guest[@"name"];
	self.guestAttrLabel.text = [NSString stringWithFormat:@"%@ %@ %@", guest[@"attributes"][0], guest[@"attributes"][1], guest[@"attributes"][2]];
	
	[self alignSelection:0];
	[self menuSelectionLoad];
	[self statusBarUpdate];
}


-(void)templateStart
{
	console(@"TMPL  | Start");
	self.menuView.frame = CGRectMake(0, screenHeight-(5*templateMenuButtonHeight), screenWidth, 4*templateMenuButtonHeight);
	
	self.guestNameLabel.frame = CGRectMake(templateMenuButtonHeight, 0, screenWidth-templateMenuButtonHeight, templateMenuButtonHeight);
	self.guestAttrLabel.frame = CGRectMake(0, 0, screenWidth-templateMenuButtonHeight, templateMenuButtonHeight);
	
	self.resultView.hidden = YES;
	self.resultView.alpha = 0;
	self.resultView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
	self.resultView.frame = CGRectMake(0, templateMenuButtonHeight, screenWidth, screenHeight-(6*templateMenuButtonHeight));
	
	self.resultCloseButton.hidden = YES;
	self.resultCloseButton.alpha = 0;
	self.resultCloseButton.backgroundColor = [UIColor redColor];
	self.resultCloseButton.frame = CGRectMake(0, screenHeight-(5*templateMenuButtonHeight), screenWidth, (templateMenuButtonHeight*4));
	
	self.resultPaneLabel1.text = @"You touch the woeful's money";
	self.resultPaneLabel2.text = @"The woeful's tentacular eyeballs are thrilling with lust, you are excelent at diplomacy.";
	self.resultPaneLabel3.text = @"The woeful's species are known to display excitement before the beheading of their enemies.";
	self.resultPaneLabel4.text = @"The woeful jumps you and beheads you, before wearing your body as a costume.";
	
	self.resultPaneLabel1.textColor = [UIColor whiteColor];
	self.resultPaneLabel2.textColor = [UIColor whiteColor];
	self.resultPaneLabel3.textColor = [UIColor whiteColor];
	self.resultPaneLabel4.textColor = [UIColor whiteColor];
	
	self.resultPaneLabel1.frame = CGRectMake(templateMenuButtonHeight, (self.resultView.frame.size.height/4)*0, screenWidth-(2*templateMenuButtonHeight), self.resultView.frame.size.height/4);
	self.resultPaneLabel2.frame = CGRectMake(templateMenuButtonHeight, (self.resultView.frame.size.height/4)*1, screenWidth-(2*templateMenuButtonHeight), self.resultView.frame.size.height/4);
	self.resultPaneLabel3.frame = CGRectMake(templateMenuButtonHeight, (self.resultView.frame.size.height/4)*2, screenWidth-(2*templateMenuButtonHeight), self.resultView.frame.size.height/4);
	self.resultPaneLabel4.frame = CGRectMake(templateMenuButtonHeight, (self.resultView.frame.size.height/4)*3, screenWidth-(2*templateMenuButtonHeight), self.resultView.frame.size.height/4);
	
	self.menuOption1Button.frame = CGRectMake(templateMenuButtonHeight, 0, screenWidth-templateMenuButtonHeight, templateMenuButtonHeight);
	self.menuOption2Button.frame = CGRectMake(templateMenuButtonHeight, templateMenuButtonHeight, screenWidth-templateMenuButtonHeight, templateMenuButtonHeight);
	self.menuOption3Button.frame = CGRectMake(templateMenuButtonHeight, templateMenuButtonHeight*2, screenWidth-templateMenuButtonHeight, templateMenuButtonHeight);
	self.menuOption4Button.frame = CGRectMake(templateMenuButtonHeight, templateMenuButtonHeight*3, screenWidth-templateMenuButtonHeight, templateMenuButtonHeight);
	
	self.submenuOption1Button.titleLabel.font = [UIFont boldSystemFontOfSize:14];
	self.submenuOption2Button.titleLabel.font = [UIFont boldSystemFontOfSize:14];
	
	self.selectorView.frame = CGRectMake(0, 0, templateMenuButtonHeight, templateMenuButtonHeight);
	
	self.statusView.frame = CGRectMake(0, screenHeight-templateMenuButtonHeight, screenWidth, templateMenuButtonHeight);
	self.relationshipLabel.frame = CGRectMake(templateMenuButtonHeight, 0, screenWidth-templateMenuButtonHeight, templateMenuButtonHeight);
	
	self.hintView.backgroundColor = [UIColor redColor];
	self.hintView.frame = CGRectMake(0, screenHeight-(5*templateMenuButtonHeight), screenWidth, templateMenuButtonHeight);
	self.hintLabel.frame = CGRectMake(templateMenuButtonHeight, 0, screenWidth-templateMenuButtonHeight, templateMenuButtonHeight);
	self.hintLabel.font = [UIFont boldSystemFontOfSize:12];
	
	self.statusView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
	self.relationshipRating.backgroundColor = [UIColor blackColor];
	self.relationshipRating.frame = CGRectMake(screenWidth/2, templateMenuButtonHeight/2-2, (screenWidth/2)-templateMenuButtonHeight, 4);
	self.relationshipRatingBar.backgroundColor = [UIColor redColor];
	self.relationshipRatingBar.frame = CGRectMake(0, 0, self.relationshipRating.frame.size.width, 4);
	
	[self.confirmButton setFrame:CGRectMake(0, 0, screenWidth-templateMenuButtonHeight, templateMenuButtonHeight)];
	[self.confirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)alignSelection:(int)menuOption
{
	if( currentMenuSelection == menuOption){ return; }
	currentMenuSelection = menuOption;
	currentSubmenuSelection = -1;
	
	// Set Original
	
	self.submenuOption1Button.hidden = NO;
	self.submenuOption2Button.hidden = NO;
	
	[self.menuOption1Button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[self.menuOption2Button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[self.menuOption3Button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[self.menuOption4Button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	
	self.selectorView.frame = CGRectMake(-1*templateMenuButtonHeight, 0, templateMenuButtonHeight, templateMenuButtonHeight);
	self.selectionView.frame = CGRectMake(0, templateMenuButtonHeight*menuOption-1, 0, templateMenuButtonHeight);
	
	self.submenuView.frame = CGRectMake(screenWidth/2, templateMenuButtonHeight*menuOption-1, screenWidth/2, templateMenuButtonHeight);
	
	self.submenuOption1Button.frame = CGRectMake(-5, 0, screenWidth/2, templateMenuButtonHeight);
	self.submenuOption2Button.frame = CGRectMake(-5, templateMenuButtonHeight, screenWidth/2, templateMenuButtonHeight);
	
	// Set Change
	
	[UIView beginAnimations:@"advancedAnimations" context:nil];
	[UIView setAnimationDuration:0.2];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	
	if(menuOption == 0){ [self.menuOption1Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal]; }
	if(menuOption == 1){ [self.menuOption2Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal]; }
	if(menuOption == 2){ [self.menuOption3Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal]; }
	if(menuOption == 3){ [self.menuOption4Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal]; }
	
	self.selectorView.frame = CGRectMake(0, 0, templateMenuButtonHeight, templateMenuButtonHeight);
	self.selectionView.frame = CGRectMake(0, templateMenuButtonHeight*menuOption-1, screenWidth, templateMenuButtonHeight);
	
	self.submenuView.frame = CGRectMake(screenWidth/2, templateMenuButtonHeight*menuOption-1, screenWidth/2, templateMenuButtonHeight*2);
	
	[UIView commitAnimations];
	
	// Set Change
	
	[UIView beginAnimations:@"advancedAnimations" context:nil];
	[UIView setAnimationDuration:0.2];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	[UIView setAnimationDelay:0.1];
	
	self.submenuOption1Button.frame = CGRectMake(0, 0, screenWidth/2, templateMenuButtonHeight);
	self.submenuOption2Button.frame = CGRectMake(0, templateMenuButtonHeight, screenWidth/2, templateMenuButtonHeight);
	
	if(menuOption == 3){
		self.submenuOption2Button.hidden = YES;
		self.submenuView.frame = CGRectMake(screenWidth/2, templateMenuButtonHeight*menuOption-1, screenWidth/2, 0);
		self.submenuView.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
	}
	else{
		self.submenuOption2Button.hidden = NO;
		self.submenuView.backgroundColor = [UIColor blackColor];
	}
	
	[UIView commitAnimations];
	
	[self.submenuOption1Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[self.submenuOption2Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

}

-(void)alignDeselection
{
	
	[UIView beginAnimations:@"advancedAnimations" context:nil];
	[UIView setAnimationDuration:0.2];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	
	self.submenuOption1Button.frame = CGRectMake(0, 0, screenWidth/2, templateMenuButtonHeight);
	self.submenuOption2Button.frame = CGRectMake(0, templateMenuButtonHeight, screenWidth/2, templateMenuButtonHeight);
	
	self.submenuView.frame = CGRectMake(self.submenuView.frame.origin.x, self.submenuView.frame.origin.y, self.submenuView.frame.size.width, templateMenuButtonHeight);
	
	[UIView commitAnimations];
	
	[self.submenuOption1Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[self.submenuOption2Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	
	self.submenuOption1Button.hidden = YES;
	self.submenuOption2Button.hidden = YES;
}

-(void)menuSelectionLoad
{
	if(currentMenuSelection == 0){
		[self.submenuOption1Button setTitle:user[@"spellbook"][@"say"][0] forState:UIControlStateNormal];
		[self.submenuOption2Button setTitle:user[@"spellbook"][@"say"][1] forState:UIControlStateNormal];
	}
	if(currentMenuSelection == 1){
		[self.submenuOption1Button setTitle:user[@"spellbook"][@"touch"][0] forState:UIControlStateNormal];
		[self.submenuOption2Button setTitle:user[@"spellbook"][@"touch"][1] forState:UIControlStateNormal];
	}
	if(currentMenuSelection == 2){
		[self.submenuOption1Button setTitle:user[@"spellbook"][@"give"][0] forState:UIControlStateNormal];
		[self.submenuOption2Button setTitle:user[@"spellbook"][@"give"][1] forState:UIControlStateNormal];
	}
	if(currentMenuSelection == 3){
		[self.submenuOption1Button setTitle:user[@"spellbook"][@"leave"][0] forState:UIControlStateNormal];
	}
}

-(void)hintDisplay
{
	NSString *menuSel = [self menuSelectionIdToName:currentMenuSelection];
	NSString *submenuSel = user[@"spellbook"][menuSel][currentSubmenuSelection];
	
	[UIView beginAnimations:@"advancedAnimations" context:nil];
	[UIView setAnimationDuration:0.2];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	
	self.hintView.frame = CGRectMake(0, screenHeight-(6*templateMenuButtonHeight), screenWidth, templateMenuButtonHeight);
	
	if([menuSel isEqualToString:@"say"]){
		self.hintLabel.text = [NSString stringWithFormat:@"%@ %@ to %@",[menuSel capitalizedString],submenuSel,guest[@"name"]];
	}
	if([menuSel isEqualToString:@"give"]){
		self.hintLabel.text = [NSString stringWithFormat:@"%@ %@ to %@",[menuSel capitalizedString],submenuSel,guest[@"name"]];
	}
	if([menuSel isEqualToString:@"touch"]){
		self.hintLabel.text = [NSString stringWithFormat:@"%@ %@'s %@",[menuSel capitalizedString],guest[@"name"],submenuSel];
	}
	
	[UIView commitAnimations];
}

-(void)hintHide
{
	[UIView beginAnimations:@"advancedAnimations" context:nil];
	[UIView setAnimationDuration:0.2];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	
	self.hintView.frame = CGRectMake(0, screenHeight-(5*templateMenuButtonHeight), screenWidth, templateMenuButtonHeight);
	self.hintLabel.text = @"The WU Tang Hordes do not like monarchy.";
	[UIView commitAnimations];
}

-(NSString*)menuSelectionIdToName :(int)selection
{
	if(selection == 0){ return @"say";}
	if(selection == 1){ return @"touch";}
	if(selection == 2){ return @"give";}
	return @"leave";
}

-(void)playTurn :(NSString*)action :(NSString*)spell
{
	NSLog(@"TURN  | %@ -> %@",action,spell);
	
	int guestAttributeReaction1 = to_i(spellbook[spell][action][guest[@"attributes"][0]]);
	int guestAttributeReaction2 = to_i(spellbook[spell][action][guest[@"attributes"][1]]);
	int guestAttributeReaction3 = to_i(spellbook[spell][action][guest[@"attributes"][2]]);
	
	int guestAttributeReactionSum = guestAttributeReaction1 + guestAttributeReaction2 + guestAttributeReaction3;
	
	user[@"relationship"] = to_s(to_i(user[@"relationship"])+guestAttributeReactionSum);
	
	[self sessionResultScreenDisplay];

}

-(void)sessionResultScreenDisplay
{
	
	self.resultView.alpha = 0;
	self.resultCloseButton.alpha = 0;
	self.resultView.hidden = NO;
	self.resultCloseButton.hidden = NO;
	
	self.resultPaneLabel1.alpha = 0;
	self.resultPaneLabel2.alpha = 0;
	self.resultPaneLabel3.alpha = 0;
	self.resultPaneLabel4.alpha = 0;
	
	self.resultView.frame = CGRectMake(0, templateMenuButtonHeight, screenWidth, 1);
	
	[self.resultCloseButton setTitle:@"Skip" forState:UIControlStateNormal];
	
	[UIView animateWithDuration:0.3 animations:^(void){
		
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
		
		self.resultView.frame = CGRectMake(0, templateMenuButtonHeight, screenWidth, screenHeight-(6*templateMenuButtonHeight));
		self.resultView.alpha = 1;
		self.resultCloseButton.alpha = 1;
		
	} completion:^(BOOL finished){ [UIView animateWithDuration:0.2 animations:^(void){
		
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
		
		self.resultPaneLabel1.alpha = 1;
			
	} completion:^(BOOL finished){ [UIView animateWithDuration:0.2 animations:^(void){
		[UIView setAnimationDelay:1.5];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
		
//		self.resultPaneLabel2.alpha = 1;
	}];
	}];
	}];
}
-(void)sessionResultScreenSkip
{
	[UIView beginAnimations:@"advancedAnimations" context:nil];
	[UIView setAnimationDuration:0.2];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	
	if(currentSessionResultscreenPosition == 0){
		self.resultPaneLabel2.alpha = 1;
	}
	if(currentSessionResultscreenPosition == 1){
		self.resultPaneLabel3.alpha = 1;
	}
	if(currentSessionResultscreenPosition == 2){
		self.resultPaneLabel4.alpha = 1;
		[self.resultCloseButton setTitle:@"Close" forState:UIControlStateNormal];
		[self statusBarUpdate];
	}
	
	[UIView commitAnimations];
	
	if(currentSessionResultscreenPosition == 3){
		[self sessionResultScreenHide];
	}
	
	currentSessionResultscreenPosition += 1;
	
}

-(void)sessionResultScreenHide
{
	[UIView animateWithDuration:0.2 animations:^(void){
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
		self.resultCloseButton.alpha = 0;
		self.resultView.alpha = 0;
	} completion:^(BOOL finished){
		[UIView animateWithDuration:0.2 animations:^(void){
			[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
			self.resultView.hidden = YES;
			self.resultCloseButton.hidden = YES;
		} completion:^(BOOL finished){
		}];
	}];
}

-(void)statusBarUpdate
{
	
	[UIView beginAnimations:@"advancedAnimations" context:nil];
	[UIView setAnimationDuration:0.2];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	
	
	if(to_i(user[@"relationship"]) == -2){
		self.relationshipRatingBar.frame = CGRectMake(0, 0, self.relationshipRating.frame.size.width/2, 4);
		self.relationshipRatingBar.backgroundColor = [UIColor redColor];
		self.relationshipLabel.text = @"enemy";
	}
	else if(to_i(user[@"relationship"]) == -1){
		self.relationshipRatingBar.frame = CGRectMake(self.relationshipRating.frame.size.width/4, 0, self.relationshipRating.frame.size.width/4, 4);
		self.relationshipRatingBar.backgroundColor = [UIColor redColor];
		self.relationshipLabel.text = @"hostile";
	}
	else if(to_i(user[@"relationship"]) == 0){
		self.relationshipRatingBar.frame = CGRectMake(self.relationshipRating.frame.size.width/2, 0, 1, 4);
		self.relationshipRatingBar.backgroundColor = [UIColor whiteColor];
		self.relationshipLabel.text = @"neutral";
	}
	else if(to_i(user[@"relationship"]) == 1){
		self.relationshipRatingBar.frame = CGRectMake(self.relationshipRating.frame.size.width/2, 0, self.relationshipRating.frame.size.width/4, 4);
		self.relationshipRatingBar.backgroundColor = [UIColor whiteColor];
		self.relationshipLabel.text = @"friendly";
	}
	else if(to_i(user[@"relationship"]) == 2){
		self.relationshipRatingBar.frame = CGRectMake(self.relationshipRating.frame.size.width/2, 0, self.relationshipRating.frame.size.width/2, 4);
		self.relationshipRatingBar.backgroundColor = [UIColor whiteColor];
		self.relationshipLabel.text = @"mate";
	}
	
	[UIView commitAnimations];
			
	NSLog(@"GUEST | Alignment: %d",to_i(user[@"relationship"]));
}


- (IBAction)resultCloseButton:(id)sender {
	[self sessionResultScreenSkip];
}

- (IBAction)menuOption1Button:(id)sender
{
	[self alignSelection:0];
	[self menuSelectionLoad];
	[self hintHide];
}
- (IBAction)menuOption2Button:(id)sender
{
	[self alignSelection:1];
	[self menuSelectionLoad];
	[self hintHide];
}
- (IBAction)menuOption3Button:(id)sender
{
	[self alignSelection:2];
	[self menuSelectionLoad];
	[self hintHide];
}
- (IBAction)menuOption4Button:(id)sender
{
	[self alignSelection:3];
	[self menuSelectionLoad];
	[self hintHide];
}

- (IBAction)submenuOption1Button:(id)sender {
	
	if( currentSubmenuSelection == 0){ return; }
	currentSubmenuSelection = 0;
	
	[self.submenuOption1Button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
	[self.submenuOption2Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[self hintDisplay];
}

- (IBAction)submenuOption2Button:(id)sender {
	
	if( currentSubmenuSelection == 1){ return; }
	currentSubmenuSelection = 1;
	
	[self.submenuOption1Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[self.submenuOption2Button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
	[self hintDisplay];
	
}

- (IBAction)confirmButton:(id)sender {
	
	currentGameRound += 1;
	
	NSString *menuSel = [self menuSelectionIdToName:currentMenuSelection];
	NSString *submenuSel = user[@"spellbook"][menuSel][currentSubmenuSelection];
	
	[self playTurn:menuSel:submenuSel];
	
	[self hintHide];
	[self alignDeselection];
	
//	user[@"spellbook"][menuSel][currentSubmenuSelection] = @"--";
	
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
