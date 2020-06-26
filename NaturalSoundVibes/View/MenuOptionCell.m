//
//  MenuOptionCell.m
//  NaturalSoundVibes
//
//  Created by Lee, John on 5/6/20.
//  Copyright © 2020 John. All rights reserved.
//

#import "MenuOptionCell.h"

@interface MenuOptionCell(){
}
@end

@implementation MenuOptionCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.backgroundColor = [UIColor lightGrayColor];
    [self setSelectionStyle: UITableViewCellSelectionStyleNone];
    [self createLabel];
    return self;
}

- (void)createLabel{
    _label = [[UILabel alloc] init];
    _label.textColor = [UIColor whiteColor];
    [_label setFont:[UIFont systemFontOfSize:20]];
    [self addSubview:_label];
    _label.translatesAutoresizingMaskIntoConstraints = NO;
    [_label.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
    [_label.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:50].active = YES;
}


@end
