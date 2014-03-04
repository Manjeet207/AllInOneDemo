//
//  AutoLayoutDemoViewController.m
//  ALLinOneDemo
//
//  Created by Manjeet Singh on 1/31/14.
//  Copyright (c) 2014 Manjeet Singh. All rights reserved.
//

#import "AutoLayoutDemoViewController.h"

@interface AutoLayoutDemoViewController ()
{
   UIView *_viewGreen,*_viewBlack;
    UITextView *_firstTV;
    UILabel *_lblFirst, *_lblSecond;
    UIButton *_btnFirst,*_btnSecond;
    UIImageView *_imageView;
}


@end

@implementation AutoLayoutDemoViewController

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
    // Do any additional setup after loading the view from its nib.
    _viewGreen = [[UIView alloc]initWithFrame:CGRectZero];
    _viewGreen.backgroundColor = [UIColor greenColor];
    _viewBlack = [[UIView alloc]initWithFrame:CGRectZero];
    _viewBlack.backgroundColor = [UIColor blackColor];
    _firstTV = [[UITextView alloc]initWithFrame:CGRectZero];
    _firstTV.backgroundColor = [UIColor yellowColor];
    _lblFirst = [[UILabel alloc]initWithFrame:CGRectZero];
    _lblFirst.text = @"This is First label First";
    _lblFirst.backgroundColor = [UIColor redColor];
    _lblSecond = [[UILabel alloc]initWithFrame:CGRectZero];
    _lblSecond.backgroundColor = [UIColor grayColor];
    _btnFirst = [[UIButton alloc]initWithFrame:CGRectZero];
    _btnFirst.backgroundColor = [UIColor lightGrayColor];
    _btnSecond = [[UIButton alloc]initWithFrame:CGRectZero];
    _btnSecond.backgroundColor = [UIColor redColor];
    _imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    _imageView.backgroundColor = [UIColor blueColor];
    
    _viewGreen.translatesAutoresizingMaskIntoConstraints = NO;
    _viewBlack.translatesAutoresizingMaskIntoConstraints = NO;
    _firstTV.translatesAutoresizingMaskIntoConstraints = NO;
    _lblFirst.translatesAutoresizingMaskIntoConstraints = NO;
    _lblSecond.translatesAutoresizingMaskIntoConstraints = NO;
    _btnFirst.translatesAutoresizingMaskIntoConstraints = NO;
    _btnSecond.translatesAutoresizingMaskIntoConstraints = NO;
    _imageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:_viewGreen];
    [self.view addSubview:_viewBlack];
    [self.view addSubview:_firstTV];
    [self.view addSubview:_lblFirst];
    [self.view addSubview:_lblSecond];
    [self.view addSubview:_btnFirst];
    [self.view addSubview:_btnSecond];
    [self.view addSubview:_imageView];
    
    
    
    
     [self createConstraints];
}

- (void)createConstraints {
    
    // Width constraint, half of parent view width
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_viewGreen
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:0.5
                                                           constant:-40]];
    
    // Height constraint, half of parent view height
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_viewGreen
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:0.46
                                                           constant:0]];
    //  horizontally
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_viewGreen
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view                                                         attribute:NSLayoutAttributeLeft
                                                         multiplier:0.0                                                           constant:20]];
    //  vertically
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_viewGreen
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:84.0]];

    
    
    // Width constraint, half of parent view width
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_viewBlack
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:0.5
                                                           constant:-40]];
    
    // Height constraint, half of parent view height
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_viewBlack
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:0.46
                                                           constant:0]];
    //  horizontally
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_viewBlack
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view                                                         attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0                                                           constant:20]];
    //  vertically
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_viewBlack
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:5.0
                                                           constant:84.0]];
    
    // Create TestView
    
        //Height
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_firstTV attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.16 constant:0.0]];
        // width
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_firstTV attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:-20.0]];
        // X Position
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_firstTV attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10.0]];
    
        // Y Position
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_firstTV attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_viewGreen attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10.0]];
    
    // Create Label First
    
    
    //Height
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_lblFirst attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.05 constant:0.0]];
    // width
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_lblFirst attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:-20.0]];
    // X Position
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_lblFirst attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10.0]];
    
    // Y Position
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_lblFirst attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_firstTV attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10.0]];
    
    // Create Button First
    
    
    //Height
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_btnFirst attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.09 constant:0.0]];
    // width
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_btnFirst attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:-20.0]];
    // X Position
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_btnFirst attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10.0]];
    
    // Y Position
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_btnFirst attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_lblFirst attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10.0]];
    
    
    // Create Button Second
    
    
    //Height
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_btnSecond attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.1 constant:0.0]];
    // width
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_btnSecond attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.5 constant:-20.0]];
    // X Position
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_btnSecond attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.0 constant:10.0]];
    
    // Y Position
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_btnSecond attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_btnFirst attribute:NSLayoutAttributeBottom multiplier:1.0 constant:15.0]];
    
    
    // Create Button Lebel
    
    
    //Height
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_lblSecond attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.1 constant:0.0]];
    // width
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_lblSecond attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.5 constant:-20.0]];
    // X Position
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_lblSecond
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view                                                         attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0                                                           constant:10]];
    
    // Y Position
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_lblSecond attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_btnFirst attribute:NSLayoutAttributeBottom multiplier:1.0 constant:15.0]];
    
   }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
