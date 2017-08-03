//
//  MyCollectionViewLayout.h
//  Collection
//
//  Created by WJ on 2017/8/3.
//  Copyright © 2017年 WJ. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WJCollectionViewLayout : UICollectionViewLayout

@property (nonatomic, assign) NSInteger columnSpacing;  // 列间距 默认为 10
@property (nonatomic, assign) NSInteger rowSpacing;     // 行间距 默认为 10
@property (nonatomic,assign) UIEdgeInsets sectionInset; // 边距

//同时设置列间距，行间距，sectionInset
- (void)setColumnSpacing:(NSInteger)columnSpacing rowSpacing:(NSInteger)rowSepacing sectionInset:(UIEdgeInsets)sectionInset;


@end
