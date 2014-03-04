//
//  TableViewUsingAutoLayoutViewController.m
//  ALLinOneDemo
//
//  Created by Manjeet Singh on 2/3/14.
//  Copyright (c) 2014 Manjeet Singh. All rights reserved.
//

#import "TableViewUsingAutoLayoutViewController.h"

@interface TableViewUsingAutoLayoutViewController ()

@end

@implementation TableViewUsingAutoLayoutViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = @"TableViewUsingAutoLayout";
    _autoLayoutTableArray = [NSArray arrayWithObjects:@"one",@"second",@"Third",@"Fourth",@"Five", nil];
    _autoLayoutTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _autoLayoutTableView.translatesAutoresizingMaskIntoConstraints = NO;
    _autoLayoutTableView.dataSource = self;
    _autoLayoutTableView.delegate = self;
    [self.view addSubview:_autoLayoutTableView];
    
    [self createConstraints];
    
}

- (void)createConstraints {
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_autoLayoutTableView]|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_autoLayoutTableView)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_autoLayoutTableView]|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings( _autoLayoutTableView)]];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return [_autoLayoutTableArray count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * cellIdentifier = @"CellIdenfier";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[_autoLayoutTableArray objectAtIndex:indexPath.row]];
    
    return cell;
}

@end
