//
//  MenuViewController.m
//  NaturalSoundVibes
//
//  Created by Lee, John on 5/6/20.
//  Copyright © 2020 John. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuOptionCell.h"

@interface MenuViewController(){
    UITableView *tableView;
    NSString *reuseIdentifier;
    
}
@end


@implementation MenuViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    reuseIdentifier = @"MenuOptionCell";
    [self setUpTableView];
}

- (void)setUpTableView{
    tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[MenuOptionCell class] forCellReuseIdentifier:reuseIdentifier];
    
    tableView.backgroundColor = [UIColor lightGrayColor];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [tableView setRowHeight:80];
    
    [self.view addSubview:tableView];
    tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    [tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    
}

#pragma mark - <TableViewDelegate, TabeleViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MenuOptionCell *cell = (MenuOptionCell*)[tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    if(indexPath.item == 0){
        cell.label.text = @"Timer";
    } else if(indexPath.item == 1){
        cell.label.text = @"About";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSNumber *n = @(indexPath.item);
    [_delegate handleMenuToggle:n];
}

@end
