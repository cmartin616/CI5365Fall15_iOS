//
//  PlanViewController.m
//  StateFairPlanner
//
//  Created by Amy Baker on 11/13/14.
//  Copyright (c) 2014 Amy Baker. All rights reserved.
//

#import "PoiViewController.h"

#import "NSObject+PlansModel.h"

@interface PoiViewController ()
@property (strong,nonatomic)NSArray *poiArray;
//@property (strong,nonatomic)NSArray *forTheStrollerSet;
@property (weak, nonatomic) IBOutlet UITableView *detailOutlet;
@property (weak, nonatomic) IBOutlet UILabel *planName;

@end

@implementation PoiViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    PlansModel* pm = [PlansModel SharedPlanModel];
    PLAN* p = [pm getCurrentPlan];
    self.poiArray = [p getPoiNames];
    
    _planName.text = p->name;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"selected number of rows in poi is %id", [self.poiArray count]);
    return [self.poiArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.textLabel.text = [self.poiArray objectAtIndex:indexPath.row];
    
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"selected POI tableview row is %d",(int)indexPath.row);
    
    // Set the currently selected plan
    PlansModel* pm = [PlansModel SharedPlanModel];
    PLAN* p = [pm getCurrentPlan];
    
    pm->currentPoiIndex = [p poiIndex:indexPath.row];

    [self performSegueWithIdentifier:@"poiSeque" sender:self];
    
    
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
