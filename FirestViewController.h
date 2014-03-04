//
//  FirestViewController.h
//  ALLinOneDemo
//
//  Created by Manjeet Singh on 1/31/14.
//  Copyright (c) 2014 Manjeet Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirestViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSArray *tableArray;
    UITableView *tView;
}
@end
