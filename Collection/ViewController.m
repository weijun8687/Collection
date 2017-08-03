//
//  ViewController.m
//  Collection
//
//  Created by WJ on 2017/8/2.
//  Copyright © 2017年 WJ. All rights reserved.
//

#import "ViewController.h"
#import "MyCollectionViewCell.h"
#import "WJCollectionViewLayout.h"


@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *arrData; // 每一页显示的数量

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *arr = @[@1, @2, @3, @4, @5, @6, @6, @5, @4, @3, @2, @1];
    
    [self.arrData addObjectsFromArray:arr];
    
    self.view.backgroundColor = [UIColor greenColor];
    self.automaticallyAdjustsScrollViewInsets=NO;

    WJCollectionViewLayout *fl = [[WJCollectionViewLayout alloc] init];

    if (!self.collectionView) {
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 80, SCREEN_WIDTH, 430) collectionViewLayout:fl];;
        [self.view addSubview:self.collectionView];
        
        self.collectionView.backgroundColor = [UIColor whiteColor];
        
        self.collectionView.pagingEnabled = YES;
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        
        [self.collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([MyCollectionViewCell class])];
    }
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.arrData.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.arrData[section] integerValue];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([MyCollectionViewCell class]) forIndexPath:indexPath];
    if (!cell) {
        cell = [[MyCollectionViewCell alloc] init];
    }
    
    [cell setCellInfo:[NSString stringWithFormat:@"%ld - %ld",indexPath.section, indexPath.row]];
    
    return cell;
}

- (NSMutableArray *)arrData{
    if (!_arrData) {
        _arrData = [NSMutableArray array];
    }
    return _arrData;
}

@end
