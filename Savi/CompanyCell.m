//
//  CompanyCell.m
//  Savi
//
//  Created by Sandra Guzman on 19/10/14.
//  Copyright (c) 2014 Grupo Sellcom. All rights reserved.
//

#import "CompanyCell.h"

@implementation CompanyCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
    UIView *selectedView = [[UIView alloc]init];
    selectedView.backgroundColor = [UIColor colorWithRed:99.0/255 green:100.0/255 blue:102.0/255 alpha:1];
    self.selectedBackgroundView =  selectedView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
