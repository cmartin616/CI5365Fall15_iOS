//
//  ProfileViewController.m
//  BookShare
//
//  Created by Cindy Purdham on 12/5/14.
//  Copyright (c) 2014 U of M. All rights reserved.
//

#import "ProfileViewController.h"
#import <Parse/Parse.h>


@interface ProfileViewController ()

@end

/* Table Setup */
@implementation ProfileViewController
{
    
}
@synthesize tableView;

- (IBAction)logoutAction:(id)sender {
    [PFUser logOut];
    PFUser *currentUser = [PFUser currentUser];
    [self performSegueWithIdentifier:@"profileToStartScreen" sender:self];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [booksAvailable count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    PFObject *tempObject = [booksAvailable objectAtIndex:indexPath.row];
    cell.textLabel.text = [tempObject objectForKey:@"title"];
    return cell;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    [self performSelector:@selector(retrieveFromParse)];
    // Do any additional setup after loading the view.
}
- (void)retrieveFromParse{
    PFUser *user = [PFUser currentUser];
    PFQuery *query = [PFQuery queryWithClassName:@"Book"];
    [query whereKey:@"user" equalTo:user];
    [query selectKeys:@[@"title"]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *usersTitles, NSError *error) {
        if (!error){
            booksAvailable = [[NSArray alloc] initWithArray:usersTitles];
        }
        [tableView reloadData];
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)checkOut:(id)sender {
    
}

-(void) checkNoPreviousEntries {
   /* if ([_book1.text isEqualToString:_book1Label.text]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oooops!" message:@"Book already added!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else {

    }*/
}

- (IBAction)addBook:(id)sender {
   PFUser *user = [PFUser currentUser];
    
    // Make a new post
    PFObject *updateUser = [PFObject objectWithClassName:@"Book"];
    updateUser[@"title"] = _book1.text;
    updateUser[@"user"] = user;
    [updateUser save];
    [self performSelector:@selector(retrieveFromParse)];
}

- (IBAction)findABook:(id)sender {
    [self performSegueWithIdentifier:@"toMap" sender:self];
}
@end
