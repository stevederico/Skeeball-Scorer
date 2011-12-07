//
//  RootViewController.m
//  SkeeBallScorer
//
//  Created by Steve Derico on 6/27/11.
//  Copyright 2011 Bixby Apps. All rights reserved.
//

#import "RootViewController.h"
#import "Frame.h"
#import "LaunchViewController.h"


@implementation RootViewController

@synthesize managedObjectContext;
@synthesize scoreLabel;
@synthesize hundredButton;
@synthesize hundredButton2;
@synthesize fiftyButton;
@synthesize fourtyButton;
@synthesize thirtyButton;
@synthesize twentyButton;
@synthesize tenButton;
@synthesize zeroButton;
@synthesize frameLabel;
@synthesize frame;
@synthesize frameNumber;
@synthesize totalScore;
@synthesize aveLabel;
@synthesize totalLabel;


#pragma mark -
#pragma mark View lifecycle

	// Implement viewWillAppear: to do additional setup before the view is presented.
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	  [self.navigationController setNavigationBarHidden:YES animated:NO];

	
}

- (void)viewDidLoad {
    [super viewDidLoad];
	counter = 0;
	localScore = 0;
    
    

   
	self.frameLabel.text = [NSString stringWithFormat:@"%@",frameNumber];
	self.totalLabel.text = [NSString stringWithFormat:@"%d",totalScore];
	self.scoreLabel.text = [NSString stringWithFormat:@"%d",localScore];
	if ([frameNumber intValue] >1){
		int thisFrame = [frameNumber intValue]-1;
		self.aveLabel.text = [NSString stringWithFormat:@"%d",totalScore/thisFrame];
	}else{
		//self.aveLabel.text = [NSString stringWithFormat:@"%d",totalScore/[frameNumber intValue]];
	}
	
}

#pragma mark -
#pragma mark Add a new object


-(void)addScore:(int)increase{
	NSLog(@"%d",localScore);
	if (counter <8){
		counter = counter +1;
		localScore = localScore +increase;
	
		self.totalScore = self.totalScore +increase;
		self.scoreLabel.text = [NSString stringWithFormat:@"%d",localScore];
		self.totalLabel.text = [NSString stringWithFormat:@"%d",totalScore];
	
		
	}else if (counter ==8){ 
		
		localScore = localScore +increase;
		self.totalScore = self.totalScore +increase;
		self.totalLabel.text = [NSString stringWithFormat:@"%d",totalScore];
		self.scoreLabel.text = [NSString stringWithFormat:@"%d",localScore];
		
		
		hundredButton.enabled = NO;
		hundredButton2.enabled = NO;
		fiftyButton.enabled = NO;
		fourtyButton.enabled = NO;
		thirtyButton.enabled = NO;
		twentyButton.enabled = NO;
		tenButton.enabled = NO;
		zeroButton.enabled = NO;
		
		
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"Frame %@", frameNumber] message:[NSString stringWithFormat:@"%d",localScore]delegate:self cancelButtonTitle:nil otherButtonTitles:@"Next",nil];
		[alert show];
		[alert release];
	}
	
	
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	
	NSLog (@"TotalScore %d",totalScore);
	
	if (buttonIndex == 0) {
		
		if (self.frameNumber ==[NSNumber numberWithInt:10]) {
		//	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"Game Complete "] message:[NSString stringWithFormat:@"10 Frame Average: %d",totalScore/10]delegate:self cancelButtonTitle:nil otherButtonTitles:@"Done",nil];
		//	[alert show];
		//	[alert release];
            
            
            
    
			LaunchViewController *launchView = [[LaunchViewController alloc] init];
			launchView.managedObjectContext = managedObjectContext;
			
			[self.navigationController pushViewController:launchView animated:YES];
            
		}else{
		
			[self saveFrame];
			RootViewController *nextView = [[RootViewController alloc] init];
			nextView.managedObjectContext = managedObjectContext;
			nextView.totalScore = totalScore;
			nextView.frameNumber = [NSNumber numberWithInt:[self.frameNumber intValue] +1];
			nextView.aveLabel.text = [NSString stringWithFormat:@"%d",totalScore/[frameNumber intValue]];
			[self.navigationController pushViewController:nextView animated:YES];
			
			
		
		}
		
		
	}

	
	
}






-(IBAction)add100{
	[self addScore:100];
	
}
-(IBAction)add50{
[self addScore:50];
	
}
-(IBAction)add40{
	[self addScore:40];
	
}
-(IBAction)add30{
[self addScore:30];
	
}

-(IBAction)add20{
[self addScore:20];
	
}
-(IBAction)add10{
[self addScore:10];	
}
-(IBAction)add0{
	[self addScore:0];
	
}


- (IBAction)saveFrame {
    
    
    
    
    
    // Create a new instance of the entity managed by the fetched results controller.
   NSManagedObject *newManagedObject= [NSEntityDescription insertNewObjectForEntityForName:@"Frame" inManagedObjectContext:managedObjectContext];
    
    
    
    // If appropriate, configure the new managed object.
    [newManagedObject setValue:[NSNumber numberWithInt:localScore] forKey:@"score"];
	[newManagedObject setValue:frameNumber forKey:@"number"];
	
	//self.totalScore = self.totalScore +localScore;
	
	NSLog(@"Frame Saved %@",[newManagedObject description]);
    NSError *error = nil;
    if (![managedObjectContext save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [managedObjectContext release];
    [super dealloc];
}


@end

