//
//  TheChannelViewController.m
//  Reader
//
//  Created by 阿喵 on 15/12/15.
//  Copyright © 2015年 河南青云. All rights reserved.
//

#import "TheChannelViewController.h"
#import "TheLocalListViewController.h"

@interface TheChannelViewController ()
@property (weak, nonatomic) IBOutlet UIButton *localBookBtn;
@property (weak, nonatomic) IBOutlet UIButton *netBookBtn;

@end

@implementation TheChannelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)localBtnClick:(UIButton *)sender {
    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    
    TheLocalListViewController *localVC = [story instantiateViewControllerWithIdentifier:@"LocalVC"];
    
    [self presentViewController:localVC animated:YES completion:nil];
    
}
- (IBAction)netBtnClick:(UIButton *)sender {
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
