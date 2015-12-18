//
//  TheBookListTableViewCell.m
//  Reader
//
//  Created by 阿喵 on 15/12/16.
//  Copyright © 2015年 河南青云. All rights reserved.
//

#import "TheBookListTableViewCell.h"

@implementation TheBookListTableViewCell

- (void)setData:(MyData *)data
{
    _data = data;
    
    _title.text = data.name;
    _bookSize.text = data.size;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    _date.text = [dateFormatter stringFromDate:data.date];
    
    if ([data.form isEqualToString:@"txt"]) {
        _imageVIew.image = [UIImage imageNamed:@"iconfont-txt"];
    }
    
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
