//
//  FirestViewController.m
//  ALLinOneDemo
//
//  Created by Manjeet Singh on 1/31/14.
//  Copyright (c) 2014 Manjeet Singh. All rights reserved.
//

#import "FirestViewController.h"
#import "AutoLayoutDemoViewController.h"
#import "TableViewUsingAutoLayoutViewController.h"
#import "ButtonInSideTableviewCellViewController.h"
#import "MRPScannerViewController.h"

@interface FirestViewController ()

@end

@implementation FirestViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
     tableArray = [[NSArray alloc]initWithObjects:@"AutoLayoutDemo",@"TableViewUsingAutoLayout",@"ButtonInSideTableviewCell", @"MRP Scanner",nil];
    self.title = @"Demos";

    tView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    tView.delegate = self;
    tView.dataSource = self;
    
    
    [self.view addSubview: tView];
    
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [tableArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[tableArray objectAtIndex:indexPath.row]];
  
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *controller;
    
    switch (indexPath.row) {
        case 0:
            controller = [[AutoLayoutDemoViewController alloc]init];
            break;
        case 1:
            controller = [[TableViewUsingAutoLayoutViewController alloc]init];
            break;
        case 2:
            controller = [[ButtonInSideTableviewCellViewController alloc]init];
            break;
        case 3:
            controller = [[MRPScannerViewController alloc]init];
            break;
        default:
            break;
    }
    [self.navigationController pushViewController:controller animated:YES];
    //  [self presentViewController:controller animated:YES completion:nil];
}

@end
