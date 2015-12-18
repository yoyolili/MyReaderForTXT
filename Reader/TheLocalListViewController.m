//
//  TheLocalListViewController.m
//  Reader
//
//  Created by 阿喵 on 15/12/16.
//  Copyright © 2015年 河南青云. All rights reserved.
//

#import "TheLocalListViewController.h"
#import "TheBookListTableViewCell.h"
#import "MyData.h"

@interface TheLocalListViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray *datas;

@end

@implementation TheLocalListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self createToolBarItem];
    // Do any additional setup after loading the view.
}
#if 0
- (void)createToolBarItem
{
    UIToolbar *toolBar = [[UIToolbar alloc]init];
    toolBar.translatesAutoresizingMaskIntoConstraints = NO;
    toolBar.barStyle = UIBarStyleDefault;
    toolBar.frame = CGRectMake(0, 579, 375, 44);
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithTitle:@"删除" style:UIBarButtonItemStylePlain target:self action:@selector(removeBook)];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithTitle:@"全选" style:UIBarButtonItemStylePlain target:self action:@selector(removeBook)];
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc]initWithTitle:@"加入书架" style:UIBarButtonItemStylePlain target:self action:@selector(removeBook)];
    UIBarButtonItem *fixibleItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    [toolBar setBackgroundImage:[UIImage imageNamed:@"导航"] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    toolBar.tintColor = [UIColor blackColor];
    [toolBar setItems:@[item1,fixibleItem,item2,fixibleItem,item3]];
    //[self.view addSubview:self.toolBar];
    
    self.navigationController.toolbarItems = toolBar.items;
    self.toolbarItems = toolBar.items;
}
#endif

- (void)removeBook
{
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    TheBookListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    MyData *data = self.datas[indexPath.row];
    
    cell.data = data;
    
    return cell;
}

- (NSArray *)datas
{
    if (_datas == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Book" ofType:@"plist"];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *models = [NSMutableArray array];
        for (NSDictionary *dict in arr) {
            MyData *data = [MyData dataWithDict:dict];
            [models addObject:data];
        }
        _datas = models;
    }
    return _datas;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
