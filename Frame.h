//
//  Frame.h
//  SkeeBallScorer
//
//  Created by Steve Derico on 6/27/11.
//  Copyright 2011 Bixby Apps. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface Frame :  NSManagedObject  
{
}

@property (nonatomic, retain) NSNumber * Score;
@property (nonatomic, retain) NSNumber * number;

@end



