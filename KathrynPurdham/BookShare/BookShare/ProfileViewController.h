//
//  ProfileViewController.h
//  BookShare
//
//  Created by Cindy Purdham on 12/5/14.
//  Copyright (c) 2014 U of M. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ProfileViewController: UIViewController <UITableViewDelegate, UITableViewDataSource>{
    NSArray *booksAvailable;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)findABook:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *book1Label;
@property (weak, nonatomic) IBOutlet UITextField *book1;
- (IBAction)checkOut:(id)sender;
- (IBAction)addBook:(id)sender;
- (IBAction)logoutAction:(id)sender;


@end
