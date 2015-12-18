//
//  TheBookListTableViewCell.h
//  Reader
//
//  Created by 阿喵 on 15/12/16.
//  Copyright © 2015年 河南青云. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyData.h"

@interface TheBookListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageVIew;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *bookSize;
@property (weak, nonatomic) IBOutlet UILabel *date;

@property (nonatomic, strong)MyData *data;


@end
