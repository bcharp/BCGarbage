//
//  Trash_ClassAppDelegate.h
//  Trash Class
//
//  Created by boris charpentier on 01/08/11.
//  Copyright 2011 bcharp. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Trash_ClassViewController;

@interface Trash_ClassAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet Trash_ClassViewController *viewController;

@end
