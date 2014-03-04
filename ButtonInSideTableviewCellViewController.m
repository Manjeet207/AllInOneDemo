//
//  ButtonInSideTableviewCellViewController.m
//  ALLinOneDemo
//
//  Created by Manjeet Singh on 2/5/14.
//  Copyright (c) 2014 Manjeet Singh. All rights reserved.
//

#import "ButtonInSideTableviewCellViewController.h"
#import "CustomCell.h"
@interface ButtonInSideTableviewCellViewController ()

@end

@implementation ButtonInSideTableviewCellViewController

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
    customCellTableViewArray = [NSArray arrayWithObjects:@"one",@"one",@"one",@"one",@"one",@"one", nil];
    customCellTableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    customCellTableView.delegate = self;
    customCellTableView.dataSource = self;
    [self.view addSubview:customCellTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [customCellTableViewArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"TableCellID";
    CustomCell *cell = (CustomCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault
                                    reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[customCellTableViewArray objectAtIndex:indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
@end
