//
//  HomeViewController.m
//  StateFairPlanner
//
//  Created by Amy Baker on 11/13/14.
//  Copyright (c) 2014 Amy Baker. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UILabel *countdownLabel;

@end

@implementation HomeViewController

- (IBAction)goToBrowse:(UIButton *)sender {
    self.tabBarController.selectedIndex = 2;
}
- (IBAction)goToPlan:(UIButton *)sender {
    self.tabBarController.selectedIndex = 1;

}
- (IBAction)goToMap:(UIButton *)sender {
    self.tabBarController.selectedIndex = 3;
}
- (IBAction)goToChat:(UIButton *)sender {
    self.tabBarController.selectedIndex = 4;
}

- (NSInteger)daysBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime
{
    NSDate *fromDate;
    NSDate *toDate;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&fromDate
                 interval:NULL forDate:fromDateTime];
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&toDate
                 interval:NULL forDate:toDateTime];
    
    NSDateComponents *difference = [calendar components:NSDayCalendarUnit
                                               fromDate:fromDate toDate:toDate options:0];
    
    return [difference day];
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    // Do any additional setup after loading the view.
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setDay:27];
    [comps setMonth:8];
    [comps setYear:2015];
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *fairDate = [gregorian dateFromComponents:comps];
    
    self.countdownLabel.text = [NSString stringWithFormat:@"%d",[self daysBetweenDate:[NSDate date] andDate:fairDate]];
    
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

@end
