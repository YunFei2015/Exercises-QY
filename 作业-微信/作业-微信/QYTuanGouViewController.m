//
//  QYTuanGouViewController.m
//  作业-微信
//
//  Created by qingyun on 15/10/28.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "QYTuanGouViewController.h"
#import "QYTuanGouModel.h"
#import "QYTuanGouTableViewCell.h"
#import "QYScrollView.h"
#import "common.h"

@interface QYTuanGouViewController () <UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *datas;

@property (strong, nonatomic) UISearchController *searchController;

@end

@implementation QYTuanGouViewController

-(NSMutableArray *)datas{
    if (_datas == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *temp = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            QYTuanGouModel *model = [QYTuanGouModel tgModelWithDictionary:dict];
            [temp addObject:model];
        }
        _datas = temp;
    }
    return _datas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableView.rowHeight = 100;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, QYScreenW, 200)];
    scrollView.contentSize = CGSizeMake((QYScreenW) * 3, scrollView.bounds.size.height);
    scrollView.pagingEnabled = YES;
    scrollView.backgroundColor = [UIColor blackColor];
    [self addSubViews:scrollView];
    
    _tableView.tableHeaderView = scrollView;
    
    
    
//    _searchController = [[UISearchController alloc] initWithSearchResultsController:self];
//    _searchController.hidesNavigationBarDuringPresentation = YES;
//    _searchController.dimsBackgroundDuringPresentation = YES;
//    _searchController.searchResultsUpdater = self;
    
    
}

-(void)addSubViews:(UIScrollView *)scrollView{
    //创建3个subScrollView
    for (int i = 0; i < 3; i++) {
        QYScrollView *subScrollView = [[QYScrollView alloc]initWithFrame:CGRectMake((QYScreenW) * i, 0, QYScreenW, scrollView.bounds.size.height)];
        [scrollView addSubview:subScrollView];
        
        //为subScrollView上的imageView设置image
        NSString *imageName = [NSString stringWithFormat:@"new_feature_%d",i + 1];
        UIImage *image = [UIImage imageNamed:imageName];
        [subScrollView setValue:image forKeyPath:@"imageView.image"];
        
    }
}


//设置组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

//设置每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}

//设置单元格内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QYTuanGouTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[QYTuanGouTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    QYTuanGouModel *model = self.datas[indexPath.row];
    cell.textLabel.text = model.title;
    cell.detailTextLabel.text = model.price;
    cell.imageView.image = [UIImage imageNamed:model.icon];
    cell.buycountLabel.text = model.buycount;
    return cell;
}

#pragma mark - 设置section头视图
//设置section头的高度
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 200;
//}

//设置头视图
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, QYScreenW + QYBlackEdgeX, 200)];
//    scrollView.contentSize = CGSizeMake((QYScreenW + QYBlackEdgeX) * 3, scrollView.bounds.size.height);
//    scrollView.pagingEnabled = YES;
//    scrollView.backgroundColor = [UIColor blackColor];
//    scrollView.delegate = self;
//    
//    [self addSubViews:scrollView];
//    
//    return scrollView;
//}





-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSArray *subViews = [scrollView subviews];
    for (id view in subViews) {
        if ([view isKindOfClass:[QYScrollView class]]) {
            QYScrollView *qyScrollView = (QYScrollView *)view;
            qyScrollView.zoomScale = 1.0;
        }
    }
}

#pragma mark - 导航控制器按钮点击响应事件
- (IBAction)editBarItemClick:(UIBarButtonItem *)sender {
    if (_tableView.editing) {
        [sender setTitle:@"编辑"];
        _tableView.editing = NO;
    }else{
        [sender setTitle:@"完成"];
        _tableView.editing = YES;
    }
}

- (IBAction)searchBarItemClick:(UIBarButtonItem *)sender {
//    [self presentViewController:_searchController animated:YES completion:nil];
}

#pragma mark - 设置tableView的编辑、移动
//设置允许编辑
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return 1;
}
//设置允许移动
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return 1;
}

//实现编辑
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    //更改数据源
    [_datas removeObjectAtIndex:indexPath.row];
    
    //更改界面
    NSArray *indexPaths = [NSArray arrayWithObjects:indexPath, nil];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    
    [_tableView reloadData];
}

//实现移动
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    //更改数据源
    QYTuanGouModel *sourceModel = _datas[sourceIndexPath.row];
    [_datas removeObjectAtIndex:sourceIndexPath.row];
    [_datas insertObject:sourceModel atIndex:destinationIndexPath.row];
    [_tableView reloadData];
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
