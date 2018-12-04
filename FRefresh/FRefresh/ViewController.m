//
//  ViewController.m
//  FRefresh
//
//  Created by fengweiru on 2018/7/25.
//  Copyright © 2018年 fengweiru. All rights reserved.
//

#import "ViewController.h"
#import "FRefresh.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger cellNum;
}

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    cellNum = 8;
    
//    self.navigationController.navigationBar.translucent = false;
    [self.view addSubview:self.tableView];
}

#pragma mark -- UITableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return cellNum;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    cell.textLabel.text = @"1111111222223333";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    [tableView endHeadRefresh];
    [tableView endFootRefresh];
    cellNum += 10;
    [tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
        
        _tableView.refreshHeaderView = [FRefreshStateHeaderView headWithRefreshingBlock:^{
            NSLog(@"下拉刷新");
        }];
        _tableView.refreshFooterView = [FRefreshBackFooterView footWithRefreshingBlock:^{
            NSLog(@"上拉刷新");
        }];
        
        [_tableView.refreshHeaderView beginRefresh];
    }
    return _tableView;
}

@end
