//
//  PCCollectViewModel.m
//  PCReaderDemo
//


#import "MyCollectViewModel.h"
#import "MyPageCell.h"
#import "MyGlobalModel.h"

@interface MyCollectViewModel ()

@end

@implementation MyCollectViewModel

#pragma mark - UICollectionViewDataSource
//行数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.dataArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyPageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:PageCellIdentifier forIndexPath:indexPath];
    NSString *subText = [self.text substringWithRange:NSRangeFromString(self.dataArray[indexPath.row])];
    [cell.pageView setText:[[NSAttributedString alloc] initWithString:subText attributes:self.attributes]];
    
    return cell;
}

@end
