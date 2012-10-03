//
//  BNRViewController.m
//  XIBExample
//
//  Created by Joe Conway on 10/3/12.
//  Copyright (c) 2012 Big Nerd Ranch. All rights reserved.
//

#import "BNRViewController.h"
#import "BNRSampleCell.h"

@interface BNRViewController ()

@end

@implementation BNRViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BNRSampleCell *cell = [BNRSampleCell cellForTableView:tableView target:self];
    
    return cell;
}

- (void)slideStuff:(id)sender atIndexPath:(NSIndexPath *)ip
{
    NSLog(@"Row %d is %f", [ip row], [(UISlider *)sender value]);
}

@end
