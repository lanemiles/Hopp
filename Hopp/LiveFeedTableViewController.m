//
//  LiveFeedTableViewController.m
//  Hopp
//
//  Created by Lane Miles on 2/17/15.
//  Copyright (c) 2015 Lane Miles. All rights reserved.
//

#import "LiveFeedTableViewController.h"
#import "NewsFeed.h"

@interface LiveFeedTableViewController ()

@end

@implementation LiveFeedTableViewController

#pragma mark - View Controller Life Cycle

//here, we need to register for the notifications we will receive
//
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //register for the notifications we will receive from the News Feed
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didUpdateMessages:)
                                                 name:@"NewsFeedDidUpdateMessages"
                                               object:nil];
    
}

//we want to do several things here:
    //style our nav and tab bar
- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    //style the nav bar
    [self styleNavigationController];
    
}

//more things to do here
- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    
    //get news feed messages
    [[NewsFeed currentFeed] getMessages]; 
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Notification Methods

//when we receive this message, the News Feed has gotten new messages, so we want to update our table
- (void) didUpdateMessages: (NSNotification *) notification {

    [self.tableView reloadData];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //we have one section for each message
    return [[NewsFeed currentFeed] messages].count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //we have one row for each section
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TestMessageCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [[[[NewsFeed currentFeed] messages] objectAtIndex:indexPath.section] objectForKey:@"messageBody"];
    
    return cell;
}


#pragma mark - Add New Comment Methods
//when here, the user has tapped the compose button
- (IBAction)composeButtonPressed:(UIBarButtonItem *)sender {
    
    //we just want to segue to the add comment section
    [self performSegueWithIdentifier:@"AddCommentSegue" sender:nil];
    
}


#pragma mark-
#pragma mark Tab and Nav Bar Styling
- (void) styleNavigationController {
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:.85 green:.1 blue:0 alpha:1]];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor whiteColor],
      NSForegroundColorAttributeName,
      
      [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:22.0],
      NSFontAttributeName,
      nil]];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
}
- (void) styleTabBarController {
    self.tabBarController.tabBar.tintColor = [UIColor colorWithRed:.85 green:.1 blue:0 alpha:1];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end