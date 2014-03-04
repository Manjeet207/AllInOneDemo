//
//  TableViewUsingAutoLayoutViewController.h
//  ALLinOneDemo
//
//  Created by Manjeet Singh on 2/3/14.
//  Copyright (c) 2014 Manjeet Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewUsingAutoLayoutViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    UITableView *_autoLayoutTableView;
    NSArray * _autoLayoutTableArray;
}

@end
