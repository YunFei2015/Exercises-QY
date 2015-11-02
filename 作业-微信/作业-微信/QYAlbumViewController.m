//
//  QYAlbumViewController.m
//  作业-微信
//
//  Created by qingyun on 15/11/1.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "QYAlbumViewController.h"
#import "QYScrollView.h"

#import "common.h"

@interface QYAlbumViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation QYAlbumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addSubViews:_scrollView];
    
    _scrollView.contentSize = CGSizeMake((QYScreenW +QYBlackEdgeX) * 3, QYScreenH);
    
}

-(void)addSubViews:(UIScrollView *)scrollView{
    //创建3个subScrollView
    for (int i = 0; i < 3; i++) {
        QYScrollView *subScrollView = [[QYScrollView alloc]initWithFrame:CGRectMake((QYScreenW + QYBlackEdgeX) * i, 0, QYScreenW, scrollView.bounds.size.height)];
        [scrollView addSubview:subScrollView];
        
        //为subScrollView上的imageView设置image
        NSString *imageName = [NSString stringWithFormat:@"new_feature_%d",i + 1];
        UIImage *image = [UIImage imageNamed:imageName];
        [subScrollView setValue:image forKeyPath:@"imageView.image"];
        
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSArray *subViews = [scrollView subviews];
    for (id view in subViews) {
        if ([view isKindOfClass:[QYScrollView class]]) {
            QYScrollView *qyScrollView = (QYScrollView *)view;
            qyScrollView.zoomScale = 1.0;
        }
    }
}


- (IBAction)backBarBtnItemClick:(UIBarButtonItem *)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
