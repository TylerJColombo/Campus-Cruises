//
//  RequestRideViewController.h
//  Campus-Cruises
//
//  Created by Trevor Hodde on 1/13/16.
//  Copyright © 2016 Trevor Hodde. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RequestRideViewController : UIViewController

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end
