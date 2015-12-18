//
//  MyBook.m
//  Reader
//


#import "MyBook.h"
#import "MyData.h"
#import "MyReaderViewController.h"

@interface MyBook ()
@property (weak, nonatomic) IBOutlet UITextView *bookName;
@property (weak, nonatomic) IBOutlet UILabel *bookForm;
@property (weak, nonatomic) IBOutlet UIButton *bookBtn;

@end

@implementation MyBook

+ (instancetype)bookView
{
    //从xib中读取内容
    return [[NSBundle mainBundle] loadNibNamed:@"BookView" owner:nil options:nil][0];
}

+ (instancetype)divideView
{
    return [[NSBundle mainBundle] loadNibNamed:@"TheDivideView" owner:nil options:nil][0];
}

- (void)btnClick:(UIButton *)sender
{
    if (_bookOpenAction) {
        
        _bookOpenAction(sender);
    }
}

- (void)setData:(MyData *)data
{
    _data = data;
    
    //[_bookBtn setTitle:data.name forState:UIControlStateDisabled];
    _bookBtn.titleLabel.text = data.name;
    _bookBtn.titleLabel.hidden = YES;
    _bookName.text = data.name;
    _bookName.editable = NO;
    _bookForm.text = [NSString stringWithFormat:@"--%@--",data.form];
    [_bookBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];    
}

@end
