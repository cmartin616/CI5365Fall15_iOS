//
//  PlanViewController.m
//  StateFairPlanner
//
//  Created by Amy Baker on 11/13/14.
//  Copyright (c) 2014 Amy Baker. All rights reserved.
//

#import "PlanViewController.h"

#import "NSObject+PlansModel.h"

@interface PlanViewController ()
@property (strong,nonatomic)NSArray *planArray;
//@property (strong,nonatomic)NSArray *forTheStrollerSet;
//@property (weak, nonatomic) IBOutlet UITableView *detailOutlet;

@end

@implementation PlanViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    PlansModel* pm = [PlansModel SharedPlanModel];
    self.planArray =  [pm getPlanNames];
    
       // self.planArray = @[@"For The Stroller Set",@"Boozin' it up",@"Barn Stormin'",@"See it all or die trying",@"New Foods Tour"];
        // self.forTheStrollerSet = @[@"Enter Gate 16",@"Moo booth in the Cattle Barn",@"Swine Barn to see baby pigs"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
    {
        return [self.planArray count];
    }


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.textLabel.text = [self.planArray objectAtIndex:indexPath.row];
    
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"selected tableview row is %d",(int)indexPath.row);
    
    // Set the currently selected plan
    PlansModel* pm = [PlansModel SharedPlanModel];
    pm->currentPlanIndex = indexPath.row;

    
    [self performSegueWithIdentifier:@"planSegue" sender:self];
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].

}



/*- (NSInteger)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"row selected = %ld", (long)indexPath.row);
    
    [self performSegueWithIdentifier:@"planSegue" sender:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
