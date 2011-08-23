//
//  Trash_ClassViewController.m
//  Trash Class
//
//  Created by boris charpentier on 01/08/11.
//  Copyright 2011 bcharp. All rights reserved.
//

#import "Trash_ClassViewController.h"
#import "BCGarbage.h"


@implementation Trash_ClassViewController

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    BCGarbage *garb = [[BCGarbage alloc] init];
    [garb setToto:@"titi"];
    
    NSLog(@"%@",[garb toto]);
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
