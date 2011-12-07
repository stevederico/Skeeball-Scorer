//
//  RootViewController.h
//  SkeeBallScorer
//
//  Created by Steve Derico on 6/27/11.
//  Copyright 2011 Bixby Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Frame.h"

@interface RootViewController : UIViewController <NSFetchedResultsControllerDelegate, UIAlertViewDelegate> {
	int localScore;
	int counter;
	int totalScore;

	
}

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) Frame	*frame;
@property (nonatomic, retain) IBOutlet UILabel *lastLabel;
@property (nonatomic, retain) IBOutlet UITextField *scoreLabel;
@property (nonatomic, retain)IBOutlet UIButton *hundredButton;
@property (nonatomic, retain)IBOutlet UIButton *hundredButton2;
@property (nonatomic, retain)IBOutlet UIButton *fiftyButton;
@property (nonatomic, retain)IBOutlet UIButton *fourtyButton;
@property (nonatomic, retain)IBOutlet UIButton *thirtyButton;
@property (nonatomic, retain)IBOutlet UIButton *twentyButton;
@property (nonatomic, retain)IBOutlet UIButton *tenButton;
@property (nonatomic, retain)IBOutlet UIButton *zeroButton;
@property (nonatomic, retain) NSNumber *frameNumber;
@property (nonatomic, retain) IBOutlet UILabel *frameLabel;
@property (nonatomic, retain) IBOutlet UILabel *aveLabel;
@property (nonatomic, retain) IBOutlet UILabel *totalLabel;
@property int totalScore;


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

- (IBAction)saveFrame;
-(IBAction)add100;
-(IBAction)add50;
-(IBAction)add40;
-(IBAction)add30;
-(IBAction)add20;
-(IBAction)add10;
-(IBAction)add0;



@end
