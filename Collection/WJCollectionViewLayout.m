//
//  MyCollectionViewLayout.m
//  Collection
//
//  Created by WJ on 2017/8/3.
//  Copyright © 2017年 WJ. All rights reserved.
//

#import "WJCollectionViewLayout.h"

@interface WJCollectionViewLayout ()

//保存每一个item的attributes
@property (nonatomic, strong) NSMutableArray *attributesArray;

@end

@implementation WJCollectionViewLayout

- (void)setColumnSpacing:(NSInteger)columnSpacing rowSpacing:(NSInteger)rowSepacing sectionInset:(UIEdgeInsets)sectionInset{
    
    self.columnSpacing = columnSpacing;
    self.rowSpacing = rowSepacing;
    self.sectionInset = sectionInset;
}

- (instancetype)init{
    if (self = [super init]) {
        self.columnSpacing = 10;
        self.rowSpacing = 10;
        self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    }
    return self;
}

#pragma mark - 布局前的准备工作
- (void)prepareLayout{
    [super prepareLayout];
    
    [self.attributesArray removeAllObjects];
    for (int i = 0; i < self.collectionView.numberOfSections; i++) {
        NSInteger itemCount = [self.collectionView numberOfItemsInSection:i];
        
        for (int j = 0; j< itemCount; j++) {
            UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:j inSection:i]];
            [self.attributesArray addObject:attributes];
        }
    }
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    CGFloat collectionviewWidth = self.collectionView.frame.size.width;
    CGFloat collectionviewHeight = self.collectionView.frame.size.height;
    NSInteger count = [self.collectionView numberOfItemsInSection:indexPath.section];
    CGFloat itemWidth = 0.0;
    CGFloat itemHeight = 0.0;
    CGFloat itemX = 0.0;
    CGFloat itemY = 0.0;
    
    if (count == 1) {
        
        itemWidth = collectionviewWidth - self.sectionInset.left - self.sectionInset.right;
        itemHeight = collectionviewHeight - self.sectionInset.top - self.sectionInset.bottom;
        itemX = collectionviewWidth * indexPath.section + self.sectionInset.left;
        itemY = self.sectionInset.top;
        
    }else if (count == 2){
        
        itemWidth = (collectionviewWidth - self.sectionInset.left - self.sectionInset.right - self.columnSpacing) / 2.0;
        itemHeight = itemWidth;
        itemX = collectionviewWidth * indexPath.section + self.sectionInset.left + (itemWidth + self.columnSpacing) * indexPath.row;
        itemY = (collectionviewHeight - itemHeight) / 2.0;
        
    }else if (count <= 4){
        
        itemWidth = (collectionviewWidth - self.sectionInset.left - self.sectionInset.right - self.columnSpacing) / 2.0;
        itemHeight = (collectionviewHeight - self.sectionInset.top - self.sectionInset.bottom - self.rowSpacing) / 2.0;
        itemX = collectionviewWidth * indexPath.section + self.sectionInset.left + (itemWidth + self.columnSpacing) * (indexPath.row % 2);
        itemY = self.sectionInset.top + (itemHeight + self.rowSpacing) * (indexPath.row / 2);
        
    }else if (count <= 6){
        itemWidth = (collectionviewWidth - self.sectionInset.left - self.sectionInset.right - 2 * self.columnSpacing) / 3.0;
        itemHeight = (collectionviewHeight - self.sectionInset.top - self.sectionInset.bottom - self.rowSpacing) / 2.0;
        itemX = collectionviewWidth * indexPath.section + self.sectionInset.left + (itemWidth + self.columnSpacing) * (indexPath.row % 3);
        itemY = self.sectionInset.top + (itemHeight + self.rowSpacing) * (indexPath.row / 3);
    }
    
    attributes.frame = CGRectMake(itemX, itemY, itemWidth, itemHeight);
    
    
    return attributes;
}

//计算collectionView的contentSize
- (CGSize)collectionViewContentSize {

    return CGSizeMake(self.collectionView.frame.size.width * self.collectionView.numberOfSections, self.collectionView.frame.size.height);
}

//返回rect范围内item的attributes
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.attributesArray;
}

- (NSMutableArray *)attributesArray{
    if (!_attributesArray) {
        _attributesArray = [NSMutableArray array];
    }
    return _attributesArray;
}

@end
