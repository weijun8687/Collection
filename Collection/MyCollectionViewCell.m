//
//  MyCollectionViewCell.m
//  Collection
//
//  Created by WJ on 2017/8/2.
//  Copyright © 2017年 WJ. All rights reserved.
//

#import "MyCollectionViewCell.h"

@interface MyCollectionViewCell ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation MyCollectionViewCell

- (void)awakeFromNib{
    [super awakeFromNib];
}



- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor purpleColor];
        
        [self creatSubViews];
    }
    return self;
}

- (void)creatSubViews{
    
    if (!self.label) {
        self.label = [UILabel new];
        [self.contentView addSubview:self.label];
        
//        self.label.center = self.contentView.center;
        self.label.frame = CGRectMake(20, 40, 60, 20);
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.textColor = [UIColor blackColor];
//        [self.label sizeToFit];
    }
}

- (void)setCellInfo:(NSString *)str{
    
    self.label.text = str;
}

@end
