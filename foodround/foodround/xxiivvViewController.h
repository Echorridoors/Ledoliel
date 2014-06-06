//
//  xxiivvViewController.h
//  foodround
//
//  Created by Devine Lu Linvega on 2014-06-04.
//  Copyright (c) 2014 XXIIVV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface xxiivvViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *menuView;
@property (strong, nonatomic) IBOutlet UIView *selectionView;
@property (strong, nonatomic) IBOutlet UIView *submenuView;
@property (strong, nonatomic) IBOutlet UILabel *selectorView;

@property (strong, nonatomic) IBOutlet UIButton *menuOption1Button;
@property (strong, nonatomic) IBOutlet UIButton *menuOption2Button;
@property (strong, nonatomic) IBOutlet UIButton *menuOption3Button;
@property (strong, nonatomic) IBOutlet UIButton *menuOption4Button;

@property (strong, nonatomic) IBOutlet UIButton *submenuOption1Button;
@property (strong, nonatomic) IBOutlet UIButton *submenuOption2Button;

@property (strong, nonatomic) IBOutlet UIView *statusView;
@property (strong, nonatomic) IBOutlet UILabel *relationshipLabel;
@property (strong, nonatomic) IBOutlet UIView *relationshipRating;
@property (strong, nonatomic) IBOutlet UIView *relationshipRatingBar;
@property (strong, nonatomic) IBOutlet UIView *hintView;
@property (strong, nonatomic) IBOutlet UILabel *hintLabel;
@property (strong, nonatomic) IBOutlet UIButton *confirmButton;

@property (strong, nonatomic) IBOutlet UILabel *guestNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *guestAttrLabel;

@property (strong, nonatomic) IBOutlet UIView *resultView;
@property (strong, nonatomic) IBOutlet UILabel *resultPaneLabel1;
@property (strong, nonatomic) IBOutlet UILabel *resultPaneLabel2;
@property (strong, nonatomic) IBOutlet UILabel *resultPaneLabel3;
@property (strong, nonatomic) IBOutlet UILabel *resultPaneLabel4;
@property (strong, nonatomic) IBOutlet UIButton *resultCloseButton;

@property (strong, nonatomic) IBOutlet UIView *guestStatusView;
@property (strong, nonatomic) IBOutlet UILabel *guestStatusLabel;
@property (strong, nonatomic) IBOutlet UILabel *guestStatusNoteLabel;

- (IBAction)resultCloseButton:(id)sender;

- (IBAction)menuOption1Button:(id)sender;
- (IBAction)menuOption2Button:(id)sender;
- (IBAction)menuOption3Button:(id)sender;
- (IBAction)menuOption4Button:(id)sender;
- (IBAction)submenuOption1Button:(id)sender;
- (IBAction)submenuOption2Button:(id)sender;
- (IBAction)confirmButton:(id)sender;


// World Map

@property (strong, nonatomic) IBOutlet UIView *mainMapView;

@property (strong, nonatomic) IBOutlet UILabel *destinationLabel;

@property (strong, nonatomic) IBOutlet UIView *spellbookPreviewView;
@property (strong, nonatomic) IBOutlet UILabel *spellbookSayLabel;
@property (strong, nonatomic) IBOutlet UILabel *spellbookTouchLabel;
@property (strong, nonatomic) IBOutlet UILabel *spellbookGiveLabel;

@property (strong, nonatomic) IBOutlet UILabel *spellbookSaySpell1;
@property (strong, nonatomic) IBOutlet UILabel *spellbookSaySpell2;
@property (strong, nonatomic) IBOutlet UILabel *spellbookTouchSpell1;
@property (strong, nonatomic) IBOutlet UILabel *spellbookTouchSpell2;
@property (strong, nonatomic) IBOutlet UILabel *spellbookGiveSpell1;
@property (strong, nonatomic) IBOutlet UILabel *spellbookGiveSpell2;

@property (strong, nonatomic) IBOutlet UILabel *spellbookPreviewLabel;

// Menu

@property (strong, nonatomic) IBOutlet UIView *mainMenuView;
@property (strong, nonatomic) IBOutlet UIButton *gameStartButton;

- (IBAction)gameStartButton:(id)sender;

@end

int currentGameRound = 0;
int currentMenuSelection = -1;
int currentSubmenuSelection = -1;
int currentSessionResultscreenPosition = 0;
float templateUnit = 30;

NSMutableDictionary *user;
NSMutableDictionary *guest;
NSMutableDictionary *spellbook;