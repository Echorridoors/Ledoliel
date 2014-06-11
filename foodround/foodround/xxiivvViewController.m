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
	
	guest = [self guestStart];
	spellbook = [self spellbookStart];
	[self menuViewInit];
	[self modalViewInit];
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
	
	self.selectorView.frame = CGRectMake(-1*templateUnit, 0, templateUnit, templateUnit);
	self.selectionView.frame = CGRectMake(0, templateUnit*menuOption-1, 0, templateUnit);
	
	self.submenuView.frame = CGRectMake(screenWidth/2, templateUnit*menuOption-1, screenWidth/2, templateUnit);
	
	self.submenuOption1Button.frame = CGRectMake(-5, 0, screenWidth/2, templateUnit);
	self.submenuOption2Button.frame = CGRectMake(-5, templateUnit, screenWidth/2, templateUnit);
	
	// Set Change
	
	[UIView beginAnimations:@"advancedAnimations" context:nil];
	[UIView setAnimationDuration:0.2];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	
	if(menuOption == 0){ [self.menuOption1Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal]; }
	if(menuOption == 1){ [self.menuOption2Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal]; }
	if(menuOption == 2){ [self.menuOption3Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal]; }
	if(menuOption == 3){ [self.menuOption4Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal]; }
	
	self.selectorView.frame = CGRectMake(0, 0, templateUnit, templateUnit);
	self.selectionView.frame = CGRectMake(0, templateUnit*menuOption-1, screenWidth, templateUnit);
	
	self.submenuView.frame = CGRectMake(screenWidth/2, templateUnit*menuOption-1, screenWidth/2, templateUnit*2);
	
	[UIView commitAnimations];
	
	// Set Change
	
	[UIView beginAnimations:@"advancedAnimations" context:nil];
	[UIView setAnimationDuration:0.2];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	[UIView setAnimationDelay:0.1];
	
	self.submenuOption1Button.frame = CGRectMake(0, 0, screenWidth/2, templateUnit);
	self.submenuOption2Button.frame = CGRectMake(0, templateUnit, screenWidth/2, templateUnit);
	
	if(menuOption == 3){
		self.submenuView.hidden = YES;
	}
	else{
		self.submenuView.hidden = NO;
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
	
	self.submenuOption1Button.frame = CGRectMake(0, 0, screenWidth/2, templateUnit);
	self.submenuOption2Button.frame = CGRectMake(0, templateUnit, screenWidth/2, templateUnit);
	
	self.submenuView.frame = CGRectMake(self.submenuView.frame.origin.x, self.submenuView.frame.origin.y, self.submenuView.frame.size.width, templateUnit);
	
	[UIView commitAnimations];
	
	[self.submenuOption1Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[self.submenuOption2Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	
	self.submenuOption1Button.hidden = YES;
	self.submenuOption2Button.hidden = YES;
}

-(void)menuSelectionLoad
{
	[self.submenuOption1Button setEnabled:NO];
	[self.submenuOption2Button setEnabled:NO];
	
	if(currentMenuSelection == 0){
		
		if( [user[@"spellbook"][@"say"][0][@"status"] isEqualToString:@"normal"] ){ [self.submenuOption1Button setEnabled:YES]; }
		if( [user[@"spellbook"][@"say"][1][@"status"] isEqualToString:@"normal"] ){ [self.submenuOption2Button setEnabled:YES]; }
		
		[self.submenuOption1Button setTitle:user[@"spellbook"][@"say"][0][@"name"] forState:UIControlStateNormal];
		[self.submenuOption2Button setTitle:user[@"spellbook"][@"say"][1][@"name"] forState:UIControlStateNormal];
		[self.submenuOption1Button setTitle:user[@"spellbook"][@"say"][0][@"name"] forState:UIControlStateDisabled];
		[self.submenuOption2Button setTitle:user[@"spellbook"][@"say"][1][@"name"] forState:UIControlStateDisabled];
		
	}
	if(currentMenuSelection == 1){
		
		[self.submenuOption1Button setTitle:user[@"spellbook"][@"touch"][0][@"name"] forState:UIControlStateNormal];
		[self.submenuOption2Button setTitle:user[@"spellbook"][@"touch"][1][@"name"] forState:UIControlStateNormal];
		[self.submenuOption1Button setTitle:user[@"spellbook"][@"touch"][0][@"name"] forState:UIControlStateDisabled];
		[self.submenuOption2Button setTitle:user[@"spellbook"][@"touch"][1][@"name"] forState:UIControlStateDisabled];
		
		if( [user[@"spellbook"][@"touch"][0][@"status"] isEqualToString:@"normal"] ){ [self.submenuOption1Button setEnabled:YES]; }
		if( [user[@"spellbook"][@"touch"][1][@"status"] isEqualToString:@"normal"] ){ [self.submenuOption2Button setEnabled:YES]; }
		
	}
	if(currentMenuSelection == 2){
		
		if( [user[@"spellbook"][@"give"][0][@"status"] isEqualToString:@"normal"] ){ [self.submenuOption1Button setEnabled:YES]; }
		if( [user[@"spellbook"][@"give"][1][@"status"] isEqualToString:@"normal"] ){ [self.submenuOption2Button setEnabled:YES]; }
		
		[self.submenuOption1Button setTitle:user[@"spellbook"][@"give"][0][@"name"] forState:UIControlStateNormal];
		[self.submenuOption2Button setTitle:user[@"spellbook"][@"give"][1][@"name"] forState:UIControlStateNormal];
		[self.submenuOption1Button setTitle:user[@"spellbook"][@"give"][0][@"name"] forState:UIControlStateDisabled];
		[self.submenuOption2Button setTitle:user[@"spellbook"][@"give"][1][@"name"] forState:UIControlStateDisabled];
	}
	
	
}

-(void)hintDisplay
{
	NSLog(@"%d",currentSubmenuSelection);
	NSString *menuSel = [self menuSelectionIdToName:currentMenuSelection];
	NSString *submenuSel = user[@"spellbook"][menuSel][currentSubmenuSelection][@"name"];

	if([menuSel isEqualToString:@"say"]){
		self.hintLabel.text = [NSString stringWithFormat:@"%@ \"%@\" to %@",[menuSel capitalizedString],submenuSel,guest[@"name"]];
	}
	if([menuSel isEqualToString:@"give"]){
		self.hintLabel.text = [NSString stringWithFormat:@"%@ %@ to %@",[menuSel capitalizedString],submenuSel,guest[@"name"]];
	}
	if([menuSel isEqualToString:@"touch"]){
		self.hintLabel.text = [NSString stringWithFormat:@"%@ %@'s %@",[menuSel capitalizedString],guest[@"name"],submenuSel];
	}
	if([menuSel isEqualToString:@"leave"]){
		self.hintLabel.text = @"Run away? ";
	}
	
	[UIView beginAnimations:@"advancedAnimations" context:nil];
	[UIView setAnimationDuration:0.2];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	
	self.hintView.frame = CGRectMake(0, screenHeight-(6*templateUnit), screenWidth, templateUnit);
	
	[UIView commitAnimations];
}

-(void)hintHide
{
	[UIView beginAnimations:@"advancedAnimations" context:nil];
	[UIView setAnimationDuration:0.2];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	
	self.hintView.frame = CGRectMake(0, screenHeight-(5*templateUnit), screenWidth, templateUnit);
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

-(void)playTurn
{
	NSString *action = [self menuSelectionIdToName:currentMenuSelection];
	NSString *spell = user[@"spellbook"][action][currentSubmenuSelection][@"name"];
	
	NSLog(@"TURN  | #%d:%@ -> %@",currentGameRound,action,spell);
	
	// replace with New Spell
	user[@"spellbook"][action][currentSubmenuSelection][@"name"] = @"eggs";
	user[@"spellbook"][action][currentSubmenuSelection][@"status"] = @"new";
	
	int guestAttributeReaction1 = to_i(spellbook[spell][action][guest[@"attributes"][0]]);
	int guestAttributeReaction2 = to_i(spellbook[spell][action][guest[@"attributes"][1]]);
	int guestAttributeReaction3 = to_i(spellbook[spell][action][guest[@"attributes"][2]]);
	
	int guestAttributeReactionSum = guestAttributeReaction1 + guestAttributeReaction2 + guestAttributeReaction3;
	
	user[@"relationship"] = to_s(to_i(user[@"relationship"])+guestAttributeReactionSum);
	
	[self sessionResultScreenUpdate:action:spell];
	[self sessionResultScreenDisplay];
	[self sessionRoundsViewUpdate];
}

-(void)sessionRoundsViewUpdate
{
	float roundsCircleSize = templateUnit*0.35;
	
	[UIView animateWithDuration:0.5 animations:^(void){
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
		if( currentGameRound > -1 ){
			_roundsCount1View.backgroundColor = [UIColor blackColor];
			_roundsProgressView.frame = CGRectMake(screenWidth/2+(roundsCircleSize/2), templateUnit/2-(roundsCircleSize/2)/2+1, 0, 3);
		}
		if( currentGameRound > 0 ){
			_roundsCount2View.backgroundColor = [UIColor blackColor];
			_roundsProgressView.frame = CGRectMake(screenWidth/2+(roundsCircleSize/2), templateUnit/2-(roundsCircleSize/2)/2+1, 1*templateUnit-(roundsCircleSize/2), 3);
		}
		if( currentGameRound > 1 ){
			_roundsCount3View.backgroundColor = [UIColor blackColor];
			_roundsProgressView.frame = CGRectMake(screenWidth/2+(roundsCircleSize/2), templateUnit/2-(roundsCircleSize/2)/2+1, 2*templateUnit-(roundsCircleSize/2), 3);
		}
		if( currentGameRound > 2 ){
			_roundsCount4View.backgroundColor = [UIColor blackColor];
			_roundsProgressView.frame = CGRectMake(screenWidth/2+(roundsCircleSize/2), templateUnit/2-(roundsCircleSize/2)/2+1, 3*templateUnit-(roundsCircleSize/2), 3);
		}
	} completion:^(BOOL finished){}];
}

-(void)sessionResultScreenUpdate :(NSString*)action :(NSString*)spell
{
	NSString* guestName = guest[@"name"];
	NSString* guestAttr1 = guest[@"attributes"][0];
	// action process
	
	if([action isEqualToString:@"say"]){
		_resultPaneLabel1.text = [NSString stringWithFormat:@"You %@ \"%@\" to %@.",action,spell,guestName];
	}
	if([action isEqualToString:@"give"]){
		_resultPaneLabel1.text = [NSString stringWithFormat:@"You %@ %@ to %@",action,spell,guestName];
	}
	if([action isEqualToString:@"touch"]){
		_resultPaneLabel1.text = [NSString stringWithFormat:@"You %@ %@'s %@",action,spell,guestName];
	}
	if([action isEqualToString:@"leave"]){
		_resultPaneLabel1.text = @"Run away? ";
	}
	
	if( [self reactionFromAttribute:guestAttr1:action:spell] > 0){
	
	}
	_resultPaneLabel2.text = [NSString stringWithFormat:@"%@ likes to talk",guestName];
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
	
	self.resultView.frame = CGRectMake(0, templateUnit, screenWidth, 1);
	
	[self.resultCloseButton setTitle:@"Skip" forState:UIControlStateNormal];
	
	[UIView animateWithDuration:0.3 animations:^(void){
		
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
		
		self.resultView.frame = CGRectMake(0, templateUnit, screenWidth, screenHeight-(6*templateUnit));
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
		[self guestResponseDisplay];
		
	}else{
		currentSessionResultscreenPosition += 1;	
	}
}

-(void)guestResponseDisplay
{
	self.guestStatusLabel.text = @"The Woeful touches your eggs.";
	self.guestStatusNoteLabel.text = @"Added \"eggs\" to your inventory";
	
	self.guestStatusView.hidden = NO;
	
	[UIView beginAnimations:@"advancedAnimations" context:nil];
	[UIView setAnimationDuration:0.2];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
//	[UIView setAnimationDelay:0.5];
	
	self.guestStatusView.frame = CGRectMake(0, templateUnit, screenWidth, screenHeight-(6*templateUnit));
	self.guestStatusView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.95];
	self.guestStatusView.alpha = 1;
	
	self.guestStatusLabel.frame = CGRectMake(templateUnit, templateUnit, screenWidth-(2*templateUnit), screenHeight-(6*templateUnit));
	self.guestStatusLabel.alpha = 1;
	
	[UIView commitAnimations];
}

-(void)guestResponseHide
{
	NSLog(@"> close");
	[UIView beginAnimations:@"advancedAnimations" context:nil];
	[UIView setAnimationDuration:0.3];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	[UIView setAnimationDelay:0.2];
	
	self.guestStatusView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.95];
	self.guestStatusView.alpha = 0;
	self.guestStatusLabel.alpha = 0;
	
	[UIView commitAnimations];
}

-(void)sessionResultScreenHide
{
	currentSessionResultscreenPosition = 0;
	
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
	[self guestResponseHide];
}
- (IBAction)menuOption2Button:(id)sender
{
	[self alignSelection:1];
	[self menuSelectionLoad];
	[self hintHide];
	[self guestResponseHide];
}
- (IBAction)menuOption3Button:(id)sender
{
	[self alignSelection:2];
	[self menuSelectionLoad];
	[self hintHide];
	[self guestResponseHide];
}
- (IBAction)menuOption4Button:(id)sender
{
//	[self hintHide];
	[self alignSelection:3];
	[self menuSelectionLoad];
	[self guestResponseHide];
	currentSubmenuSelection = 0;
	[self hintDisplay];
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
	
	[self playTurn];
	[self hintHide];
	[self alignDeselection];
	
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark 1.Menu

-(void)menuViewInit
{
	console(@"! VIEW | Menu View Init");
	
	[self menuViewTemplate];
}

-(void)menuViewTemplate
{
	console(@"+ TMPL | Menu");
	self.mainMenuView.hidden = NO;
}

#pragma mark 2.Map

-(void)mapViewInit
{
	console(@"! VIEW | Map View Init");
	
	user = [self userStart];
	
	[self mapViewGeneratePlanets];
	[self mapViewTemplate];
	[self mapViewSpellUpdate];
	
}

-(void)mapViewTemplate
{
	console(@"+ TMPL | World Map");
	// Spellbook preview
	
	self.spellbookPreviewView.backgroundColor = [UIColor whiteColor];
	
	float templateThirdUnit = (screenWidth-(2*templateUnit))/3;
	
	self.spellbookSayLabel.frame = CGRectMake(templateUnit, templateUnit*0.5, templateThirdUnit, templateUnit);
	self.spellbookSaySpell1.frame = CGRectMake(templateUnit, templateUnit*1, templateThirdUnit, templateUnit);
	self.spellbookSaySpell2.frame = CGRectMake(templateUnit, templateUnit*1.5, templateThirdUnit, templateUnit);
	
	self.spellbookTouchLabel.frame = CGRectMake(templateUnit+templateThirdUnit, templateUnit*0.5, templateThirdUnit, templateUnit);
	self.spellbookTouchSpell1.frame = CGRectMake(templateUnit+templateThirdUnit, templateUnit*1, templateThirdUnit, templateUnit);
	self.spellbookTouchSpell2.frame = CGRectMake(templateUnit+templateThirdUnit, templateUnit*1.5, templateThirdUnit, templateUnit);
	
	self.spellbookGiveLabel.frame = CGRectMake(templateUnit+templateThirdUnit*2, templateUnit*0.5, templateThirdUnit, templateUnit);
	self.spellbookGiveSpell1.frame = CGRectMake(templateUnit+templateThirdUnit*2, templateUnit*1, templateThirdUnit, templateUnit);
	self.spellbookGiveSpell2.frame = CGRectMake(templateUnit+templateThirdUnit*2, templateUnit*1.5, templateThirdUnit, templateUnit);
	
	self.spellbookPreviewLabel.frame = CGRectMake(templateUnit, screenHeight-(4.5*templateUnit), screenWidth-(2*templateUnit), templateUnit);
	
	self.destinationLabel.frame = CGRectMake(templateUnit, 0, screenWidth-(2*templateUnit), templateUnit);
	self.quitButton.frame = CGRectMake(screenWidth/2, 0, (screenWidth/2)-templateUnit, templateUnit);
	
	self.planetChoice1View.frame = CGRectMake(templateUnit, templateUnit*3, screenWidth-(2*templateUnit), templateUnit*4);
	self.planetChoice1GuestLabel.frame = CGRectMake(self.planetChoice1View.frame.size.width/2, 0, self.planetChoice1View.frame.size.width/2+templateUnit, templateUnit);
	self.planetChoice1GuestAttr1Label.frame = CGRectMake(self.planetChoice1View.frame.size.width/2, templateUnit*1, self.planetChoice1View.frame.size.width/2+templateUnit, templateUnit);
	self.planetChoice1GuestAttr2Label.frame = CGRectMake(self.planetChoice1View.frame.size.width/2, templateUnit*1.5, self.planetChoice1View.frame.size.width/2+templateUnit, templateUnit);
	self.planetChoice1GuestAttr3Label.frame = CGRectMake(self.planetChoice1View.frame.size.width/2, templateUnit*2, self.planetChoice1View.frame.size.width/2+templateUnit, templateUnit);
	self.planetChoice1Graphics.frame = CGRectMake(0, templateUnit*-0.25, self.planetChoice1View.frame.size.width/2-templateUnit/2, self.planetChoice1View.frame.size.width/2-templateUnit/2);
	self.planetChoice1Graphic1.frame = self.planetChoice1Graphics.frame;
	self.planetChoice1Graphic1.image = [UIImage imageNamed:@"planet1.png"];
	
	[self.planetChoice1Button setTitle:@"" forState:UIControlStateNormal];
	self.planetChoice1Button.frame = CGRectMake(0, 0, _planetChoice1View.frame.size.width, _planetChoice1View.frame.size.height);
	
	self.planetChoice2View.frame = CGRectMake(templateUnit, templateUnit*9, screenWidth-(2*templateUnit), templateUnit*4);
	self.planetChoice2GuestLabel.frame = CGRectMake(self.planetChoice1View.frame.size.width/2, 0, self.planetChoice1View.frame.size.width/2+templateUnit, templateUnit);
	self.planetChoice2GuestAttr1Label.frame = CGRectMake(self.planetChoice1View.frame.size.width/2, templateUnit*1, self.planetChoice1View.frame.size.width/2+templateUnit, templateUnit);
	self.planetChoice2GuestAttr2Label.frame = CGRectMake(self.planetChoice1View.frame.size.width/2, templateUnit*1.5, self.planetChoice1View.frame.size.width/2+templateUnit, templateUnit);
	self.planetChoice2GuestAttr3Label.frame = CGRectMake(self.planetChoice1View.frame.size.width/2, templateUnit*2, self.planetChoice1View.frame.size.width/2+templateUnit, templateUnit);
	self.planetChoice2Graphics.frame = CGRectMake(0, templateUnit*-0.25, self.planetChoice1View.frame.size.width/2-templateUnit/2, self.planetChoice1View.frame.size.width/2-templateUnit/2);
	self.planetChoice2Graphic1.frame = self.planetChoice2Graphics.frame;
	self.planetChoice2Graphic1.image = [UIImage imageNamed:@"planet1.png"];
	
	[self.planetChoice2Button setTitle:@"" forState:UIControlStateNormal];
	self.planetChoice2Button.frame = CGRectMake(0, 0, _planetChoice1View.frame.size.width, _planetChoice1View.frame.size.height);
	
	self.planetSelectionView.frame = CGRectMake(0, self.planetChoice1View.frame.origin.y-templateUnit, 0, self.planetChoice1View.frame.size.height + (templateUnit));
	self.planetSelectionView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.2];
	
}

-(void)mapViewSpellUpdate
{
	self.spellbookSaySpell1.text = user[@"spellbook"][@"say"][0][@"name"];
	self.spellbookSaySpell2.text = user[@"spellbook"][@"say"][1][@"name"];
	self.spellbookTouchSpell1.text = user[@"spellbook"][@"touch"][0][@"name"];
	self.spellbookTouchSpell2.text = user[@"spellbook"][@"touch"][1][@"name"];
	self.spellbookGiveSpell1.text = user[@"spellbook"][@"give"][0][@"name"];
	self.spellbookGiveSpell2.text = user[@"spellbook"][@"give"][1][@"name"];
}

-(void)mapViewGeneratePlanets
{
	console(@"  VIEW | (map)Generate Planets");
	
	NSArray* attributeShuffle1 = [self shuffleArray:[self guestAttributes]];
	NSArray* attributeShuffle2 = [self shuffleArray:[self guestAttributes]];
	
	guest[@"attributes_potential"][0] = @[attributeShuffle1[0],attributeShuffle1[1],attributeShuffle1[2]];
	self.planetChoice1GuestAttr1Label.text = attributeShuffle1[0];
	self.planetChoice1GuestAttr2Label.text = attributeShuffle1[1];
	self.planetChoice1GuestAttr3Label.text = attributeShuffle1[2];
	
	self.planetChoice1GuestLabel.text = [self guestNameFromAttributes:attributeShuffle1[0]:attributeShuffle1[1]:attributeShuffle1[2]];
	
	guest[@"attributes_potential"][1] = @[attributeShuffle2[0],attributeShuffle2[1],attributeShuffle2[2]];
	self.planetChoice2GuestAttr1Label.text = attributeShuffle2[0];
	self.planetChoice2GuestAttr2Label.text = attributeShuffle2[1];
	self.planetChoice2GuestAttr3Label.text = attributeShuffle2[2];
	
	self.planetChoice2GuestLabel.text = [self guestNameFromAttributes:attributeShuffle2[0]:attributeShuffle2[1]:attributeShuffle2[2]];
}

-(void)mapViewPlanetSelectorAlign :(int)choice
{
	[UIView animateWithDuration:0.15 animations:^(void){
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
		
		if(choice == 1){
			self.planetSelectionView.frame = CGRectMake(0, self.planetChoice1View.frame.origin.y-templateUnit, screenWidth, self.planetChoice1View.frame.size.height + (templateUnit));
		}
		else{
			self.planetSelectionView.frame = CGRectMake(0, self.planetChoice2View.frame.origin.y-templateUnit, screenWidth, self.planetChoice2View.frame.size.height + (templateUnit));
		}
		
	} completion:^(BOOL finished){
		user[@"selection"] = [NSString stringWithFormat:@"%d",choice];
		_destinationLabel.text = [NSString stringWithFormat:@"Travel to %@?",[self guestNameFromAttributes:guest[@"attributes_potential"][(choice-1)][0]:guest[@"attributes_potential"][(choice-1)][1]:guest[@"attributes_potential"][(choice-1)][2]]];
	}];
}


- (IBAction)planetChoice1Button:(id)sender
{	
	if(to_i(user[@"selection"])==1){
		guest[@"attributes"] = guest[@"attributes_potential"][0];
		guest[@"name"] = _planetChoice1GuestLabel.text;
		
		[self flickrView];
		[NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(flickerViewStop) userInfo:nil repeats:NO];
		[self transitionView :@"downward":self.mainMapView:self.mainSessionView:NSSelectorFromString(@"sessionViewInit"):0.5];
	}
	else{
		[self mapViewPlanetSelectorAlign:1];
	}
}
- (IBAction)planetChoice2Button:(id)sender
{
	if(to_i(user[@"selection"])==2){
		guest[@"attributes"] = guest[@"attributes_potential"][1];
		guest[@"name"] = _planetChoice2GuestLabel.text;
		
		[self flickrView];
		[NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(flickerViewStop) userInfo:nil repeats:NO];
		[self transitionView :@"downward":self.mainMapView:self.mainSessionView:NSSelectorFromString(@"sessionViewInit"):0.5];
	}
	else{
		[self mapViewPlanetSelectorAlign:2];
	}
}

-(void)flickrView
{
	flickrTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(flickrView) userInfo:nil repeats:NO];
	if( _planetSelectionView.hidden == YES){
		_planetSelectionView.hidden = NO;
	}
	else{
		_planetSelectionView.hidden = YES;
	}
}

-(void)flickerViewStop
{
	[flickrTimer invalidate];
}

#pragma mark 3.Session

-(void)sessionViewInit
{
	console(@"- VIEW | Session View Init");
	[self sessionViewTemplate];
	
	NSString* guestName = [self guestNameFromAttributes:guest[@"attributes"][0]:guest[@"attributes"][1]:guest[@"attributes"][2]];
	NSString* guestCustom = [self guestCustomFromAttributes:guest[@"attributes"][0]:guest[@"attributes"][1]:guest[@"attributes"][2]];
	
	self.guestNameLabel.text = guestName;
	self.guestAttrLabel.text = [NSString stringWithFormat:@"%@ %@ %@", guest[@"attributes"][0], guest[@"attributes"][1], guest[@"attributes"][2]];
	
	[self modalViewDisplay:guestCustom:1.5];
	
	[self alignSelection:0];
	[self menuSelectionLoad];
	[self statusBarUpdate];
	[self sessionRoundsViewUpdate];
	
}

-(void)sessionViewTemplate
{
	console(@"TMPL  | Start");
	
	self.menuView.frame = CGRectMake(0, screenHeight-(5*templateUnit), screenWidth, 4*templateUnit);
	
	self.guestNameLabel.frame = CGRectMake(templateUnit, 0, screenWidth-templateUnit, templateUnit);
	self.guestAttrLabel.frame = CGRectMake(0, 0, screenWidth-templateUnit, templateUnit);
	
	self.resultView.hidden = YES;
	self.resultView.alpha = 0;
	self.resultView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
	self.resultView.frame = CGRectMake(0, templateUnit, screenWidth, screenHeight-(6*templateUnit));
	
	self.resultCloseButton.hidden = YES;
	self.resultCloseButton.alpha = 0;
	self.resultCloseButton.backgroundColor = [UIColor redColor];
	self.resultCloseButton.frame = CGRectMake(0, screenHeight-(5*templateUnit), screenWidth, (templateUnit*4));
	
	self.resultPaneLabel1.text = @"You touch the woeful's money";
	self.resultPaneLabel2.text = @"The woeful's tentacular eyeballs are thrilling with lust, you are excelent at diplomacy.";
	self.resultPaneLabel3.text = @"The woeful's species are known to display excitement before the beheading of their enemies.";
	self.resultPaneLabel4.text = @"The woeful jumps you and beheads you, before wearing your body as a costume.";
	
	self.resultPaneLabel1.textColor = [UIColor whiteColor];
	self.resultPaneLabel2.textColor = [UIColor whiteColor];
	self.resultPaneLabel3.textColor = [UIColor whiteColor];
	self.resultPaneLabel4.textColor = [UIColor whiteColor];
	
	self.resultPaneLabel1.frame = CGRectMake(templateUnit, (self.resultView.frame.size.height/4)*0, screenWidth-(2*templateUnit), self.resultView.frame.size.height/4);
	self.resultPaneLabel2.frame = CGRectMake(templateUnit, (self.resultView.frame.size.height/4)*1, screenWidth-(2*templateUnit), self.resultView.frame.size.height/4);
	self.resultPaneLabel3.frame = CGRectMake(templateUnit, (self.resultView.frame.size.height/4)*2, screenWidth-(2*templateUnit), self.resultView.frame.size.height/4);
	self.resultPaneLabel4.frame = CGRectMake(templateUnit, (self.resultView.frame.size.height/4)*3, screenWidth-(2*templateUnit), self.resultView.frame.size.height/4);
	
	self.menuOption1Button.frame = CGRectMake(templateUnit, 0, screenWidth-templateUnit, templateUnit);
	self.menuOption2Button.frame = CGRectMake(templateUnit, templateUnit, screenWidth-templateUnit, templateUnit);
	self.menuOption3Button.frame = CGRectMake(templateUnit, templateUnit*2, screenWidth-templateUnit, templateUnit);
	self.menuOption4Button.frame = CGRectMake(templateUnit, templateUnit*3, screenWidth-templateUnit, templateUnit);
	
	[self.submenuOption1Button setTitleColor:[UIColor colorWithWhite:0.5 alpha:1] forState:UIControlStateDisabled];
	[self.submenuOption2Button setTitleColor:[UIColor colorWithWhite:0.5 alpha:1] forState:UIControlStateDisabled];
	
	self.submenuOption1Button.titleLabel.font = [UIFont boldSystemFontOfSize:14];
	self.submenuOption2Button.titleLabel.font = [UIFont boldSystemFontOfSize:14];
	
	self.selectorView.frame = CGRectMake(0, 0, templateUnit, templateUnit);
	
	self.guestStatusView.frame = CGRectMake(0, templateUnit, screenWidth, screenHeight-(6*templateUnit));
	self.guestStatusView.hidden = YES;
	self.guestStatusView.alpha = 0;
	//	self.guestStatusView.backgroundColor = [UIColor colorWithRed:0.40 green:0.83 blue:0.72 alpha:1];
	self.guestStatusLabel.frame = CGRectMake(templateUnit, templateUnit, screenWidth-(2*templateUnit), screenHeight-(6*templateUnit));
	self.guestStatusLabel.font = [UIFont boldSystemFontOfSize:36];
	self.guestStatusLabel.textColor = [UIColor blackColor];
	
	self.guestStatusNoteLabel.frame = CGRectMake(templateUnit, self.guestStatusLabel.frame.size.height-(4*templateUnit), screenWidth-(2*templateUnit), templateUnit);
	self.guestStatusNoteLabel.font = [UIFont boldSystemFontOfSize:12];
	
	self.statusView.hidden = YES;
	self.statusView.frame = CGRectMake(0, screenHeight-templateUnit, screenWidth, templateUnit);
	self.relationshipLabel.frame = CGRectMake(templateUnit, 0, screenWidth-templateUnit, templateUnit);
	
	self.hintView.backgroundColor = [UIColor redColor];
	self.hintView.frame = CGRectMake(0, screenHeight-(5*templateUnit), screenWidth, templateUnit);
	self.hintLabel.frame = CGRectMake(templateUnit, 0, screenWidth-templateUnit, templateUnit);
	self.hintLabel.font = [UIFont boldSystemFontOfSize:12];
	
	self.statusView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
	self.relationshipRating.backgroundColor = [UIColor blackColor];
	self.relationshipRating.frame = CGRectMake(screenWidth/2, templateUnit/2-2, (screenWidth/2)-templateUnit, 4);
	self.relationshipRatingBar.backgroundColor = [UIColor redColor];
	self.relationshipRatingBar.frame = CGRectMake(0, 0, self.relationshipRating.frame.size.width, 4);
	
	self.guestGraphics.frame = CGRectMake(0, 0, screenWidth, screenHeight);
	self.guestGraphic1.frame = self.guestGraphics.frame;
	
	[self.confirmButton setFrame:CGRectMake(0, 0, screenWidth-templateUnit, templateUnit)];
	[self.confirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	
	// Rounds Interface
	
	float roundsCircleSize = templateUnit*0.35;
	
	_roundsView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
	_roundsView.frame = CGRectMake(0, screenHeight-templateUnit, screenWidth, templateUnit);
	_roundsLabel.frame = CGRectMake(templateUnit, 0, screenWidth-templateUnit, templateUnit);
	_roundsLabel.text = @"Round 1";
	_roundsCount1View.frame = CGRectMake(screenWidth/2, templateUnit/2-(roundsCircleSize/2), roundsCircleSize, roundsCircleSize);
	_roundsCount1View.layer.cornerRadius = roundsCircleSize/2;
	_roundsCount2View.frame = CGRectMake(screenWidth/2 + (templateUnit), templateUnit/2-(roundsCircleSize/2), roundsCircleSize, roundsCircleSize);
	_roundsCount2View.layer.cornerRadius = roundsCircleSize/2;
	_roundsCount3View.frame = CGRectMake(screenWidth/2 + (templateUnit*2), templateUnit/2-(roundsCircleSize/2), roundsCircleSize, roundsCircleSize);
	_roundsCount3View.layer.cornerRadius = roundsCircleSize/2;
	_roundsCount4View.frame = CGRectMake(screenWidth/2 + (templateUnit*3), templateUnit/2-(roundsCircleSize/2), roundsCircleSize, roundsCircleSize);
	_roundsCount4View.layer.cornerRadius = roundsCircleSize/2;
	_roundsProgressView.frame = CGRectMake(screenWidth/2+(roundsCircleSize/2), templateUnit/2-(roundsCircleSize/2)/2+1, 3*templateUnit-(roundsCircleSize/2), 3);
	
	_roundsCount1View.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1];
	_roundsCount2View.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1];
	_roundsCount3View.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1];
	_roundsCount4View.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1];
	
}

- (IBAction)gameStartButton:(id)sender {
	NSLog(@"+ GAME | New Game");
	[self transitionView:@"downward":self.mainMenuView:self.mainMapView:NSSelectorFromString(@"mapViewInit") :0];
}

- (IBAction)quitButton:(id)sender {
	[self transitionView:@"upward":self.mainMapView:self.mainMenuView:NSSelectorFromString(@"menuViewInit") :0];
}

#pragma mark Modal

-(void)modalViewInit
{
	console(@"- VIEW | Modal View Init");
	[self modalViewTemplate];
}

-(void)modalViewTemplate
{
	self.modalView.hidden = YES;
	self.modalView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
	self.modalView.frame = CGRectMake(0, 0, screenWidth, screenHeight);
	
	self.modalLabelFrame.frame = CGRectMake(templateUnit, screenHeight/2-(4*templateUnit/2), screenWidth-(2*templateUnit), 4*templateUnit);
	self.modalLabelFrame.backgroundColor = [UIColor whiteColor];
	
	self.modalLabel.frame = CGRectMake((templateUnit/2), (templateUnit/2), self.modalLabelFrame.frame.size.width - templateUnit, self.modalLabelFrame.frame.size.height - templateUnit);
	
	self.modalLabel.text = @"As it is customary for Megoneldisians, the secretary of defence spits in your face.";
	self.modalButton.frame = CGRectMake(0, 0, screenWidth, screenHeight);
}

-(void)modalViewDisplay :(NSString*)message :(float)delay
{
	self.modalView.alpha = 0;
	self.modalView.hidden = NO;
	
	self.modalLabelFrame.frame = CGRectMake(templateUnit, screenHeight/2-(3*templateUnit/2), screenWidth-(2*templateUnit), 4*templateUnit);
	
	[UIView beginAnimations:@"advancedAnimations" context:nil];
	[UIView setAnimationDuration:0.2];
	[UIView setAnimationDelay:delay];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
	
	self.modalView.alpha = 1;
	self.modalLabelFrame.frame = CGRectMake(templateUnit, screenHeight/2-(4*templateUnit/2), screenWidth-(2*templateUnit), 4*templateUnit);
	self.modalLabel.text = message;
	
	[UIView commitAnimations];
}

-(void)modalViewHide
{
	[UIView animateWithDuration:0.2 animations:^(void){
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
		self.modalLabelFrame.frame = CGRectMake(templateUnit, screenHeight/2-(3*templateUnit/2), screenWidth-(2*templateUnit), 4*templateUnit);
		self.modalView.alpha = 0;
	} completion:^(BOOL finished){
		self.modalView.hidden = YES;
	}];
}

- (IBAction)modalButton:(id)sender {
	NSLog(@"x MODL | Close modal");
	[self modalViewHide];
}

#pragma mark Transitions

-(void)transitionView :(NSString*)direction :(UIView*)fromView :(UIView*)toView :(SEL)targetSelector :(float)delay
{
	CGRect viewFocus = CGRectMake(0, 0, screenWidth, screenHeight);
	CGRect viewAbove = CGRectMake(0, screenHeight*-1, screenWidth, screenHeight);
	CGRect viewBelow = CGRectMake(0, screenHeight, screenWidth, screenHeight);
	
	fromView.hidden = NO;
	toView.hidden = NO;
	
	if([direction isEqualToString:@"downward"]){
		fromView.frame = viewFocus;
		toView.frame = viewBelow;
	}
	else{
		fromView.frame = viewFocus;
		toView.frame = viewAbove;
	}
	
	[self performSelector:targetSelector];
	
	[UIView animateWithDuration:0.5 animations:^(void){
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
		[UIView setAnimationDelay:delay];
		
		if([direction isEqualToString:@"downward"]){
			fromView.frame = viewAbove;
			toView.frame = viewFocus;
		}
		else{
			fromView.frame = viewBelow;
			toView.frame = viewFocus;
		}
		
	} completion:^(BOOL finished){
		fromView.hidden = YES;
	}];
}



@end
