//
//  HighScoreViewController.h
//  SkeeBallScorer
//
//  Created by Steve Derico on 7/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HighScoreViewController : UIViewController
{
IBOutlet UILabel *scoreLabel_;
IBOutlet UITableView *tView;
}
@property(nonatomic,retain)IBOutlet UILabel *scoreLabel;
@property(nonatomic,retain)IBOutlet UITableView *tView;
@end
