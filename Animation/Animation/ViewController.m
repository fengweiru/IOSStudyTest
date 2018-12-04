//
//  ViewController.m
//  Animation
//
//  Created by fengweiru on 2018/8/20.
//  Copyright © 2018年 fengweiru. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *cellArr;

@end

@implementation ViewController

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
        
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

- (NSMutableArray *)cellArr
{
    if (!_cellArr) {
        _cellArr = [[NSMutableArray alloc] init];
    }
    return _cellArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Animation高级动画";
    [self setupData];
    
    [self.view addSubview:self.tableView];
}

- (void)setupData
{
    NSArray *nameArr = @[@"加载动画（综合）"];
    NSArray *vcnameArr = @[@"AnimationCaseViewController"];
    
    for (NSInteger i = 0; i < nameArr.count; i++) {
        NSDictionary *dict = @{@"name":nameArr[i],@"vcname":vcnameArr[i]};
        [self.cellArr addObject:dict];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    
    NSDictionary *dict = self.cellArr[indexPath.row];
    cell.textLabel.text = dict[@"name"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    NSDictionary *dict = self.cellArr[indexPath.row];
    NSString *vcname = dict[@"vcname"];
    
    UIViewController *vc = [[NSClassFromString(vcname) alloc] init];
    [self.navigationController pushViewController:vc animated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
