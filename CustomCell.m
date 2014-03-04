//
//  CustomCell.m
//  ALLinOneDemo
//
//  Created by Manjeet Singh on 2/5/14.
//  Copyright (c) 2014 Manjeet Singh. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell
{
     UIButton *cellButton;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initializeButtons];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)initializeButtons {
    
    cellButton  = [UIButton buttonWithType:UIButtonTypeCustom];
    cellButton.frame = CGRectMake(0, 0, 50, 50);
    [cellButton setImage:[UIImage imageNamed:@"mail-icon-ios-7.png"] forState:UIControlStateNormal];
    cellButton.backgroundColor = [UIColor greenColor];
        cellButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [cellButton addTarget:self
                             action:@selector(increaseButtonTapped:)
                   forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:cellButton];
}

- (void)increaseButtonTapped:(id)sender {
    NSLog(@"increaseButtonTapped");
}

- (void)layoutSubviews {
    
    
    
}

@end
