//
//  QYContactsViewController.m
//  作业-微信
//
//  Created by qingyun on 15/10/29.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "QYContactsViewController.h"
#import "QYGroupModel.h"
#import "QYFriendModel.h"
#import "QYContactsTableViewCell.h"
#import "QYContactsSectionHeaderView.h"

@interface QYContactsViewController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *groups;


@end

@implementation QYContactsViewController

-(NSArray *)groups{
    if (_groups == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"friends" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *temp = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            QYGroupModel *group = [QYGroupModel groupWithDictionary:dict];
            [temp addObject:group];
        }
        _groups = temp;
    }
    return _groups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - 设置tableView视图
//组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.groups.count;
}

//组头的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}

//组头视图
//- (UITableViewHeaderFooterView *)headerViewForSection:(NSInteger)section{
//    NSString *identifier = @"headerView";
//    QYContactsSectionHeaderView *headerView = [_tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
//    if (headerView == nil) {
//        headerView = [[QYContactsSectionHeaderView alloc] initWithReuseIdentifier:identifier];
//    }
//    
//    QYGroupModel *group = self.groups[section];
//    [headerView.headerBtn setTitle:group.name forState:UIControlStateNormal];
//    headerView.onlineNumLabel.text = [NSString stringWithFormat:@"%ld/%ld",group.online,group.friends.count];
//    
//    return headerView;
//}

//组头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    NSString *identifier = @"headerView";
    [_tableView registerClass:[QYContactsSectionHeaderView class] forHeaderFooterViewReuseIdentifier:identifier];
    QYContactsSectionHeaderView *headerView = [_tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    
    QYGroupModel *group = self.groups[section];
    headerView.group = group;
    [headerView.headerBtn setTitle:group.name forState:UIControlStateNormal];
    headerView.onlineNumLabel.text = [NSString stringWithFormat:@"%ld/%ld",group.online,group.friends.count];
    
        //翻转三角符号
        if (group.isOpen) {
            headerView.headerBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
        }else{
            headerView.headerBtn.imageView.transform = CGAffineTransformIdentity;
        }
    
    
    headerView.reloadData = ^{
        [_tableView reloadData];
    };
    
    return headerView;
}

//每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    QYGroupModel *group = self.groups[section];
    if (!group.isOpen) {
        return 0;
    }
    return group.friends.count;
}

//单元格内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    QYContactsTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[QYContactsTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    QYGroupModel *group = self.groups[indexPath.section];
    cell.friend = group.friends[indexPath.row];
    
    if (cell.isVip) {
        cell.textLabel.textColor = [UIColor redColor];
    }else cell.textLabel.textColor = [UIColor blackColor];
    
    return cell;
}


#pragma mark - 导航栏添加按钮点击响应事件
- (IBAction)addFriend:(UIBarButtonItem *)sender {
    if (_tableView.editing) {
        _tableView.editing = NO;
        [sender setTitle:@"完成"];
    }else{
        _tableView.editing = YES;
        [sender setTitle:@"添加"];
    }
}


//允许编辑
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return 1;
}

//指定编辑样式，添加
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleInsert;
}

//提交编辑样式
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    QYContactsTableViewCell *addCell = [[QYContactsTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    QYGroupModel *group = self.groups[indexPath.section];
    addCell.friend = group.friends[indexPath.row];
    
    if (addCell.isVip) {
        addCell.textLabel.textColor = [UIColor redColor];
    }else{
        addCell.textLabel.textColor = [UIColor blackColor];
    }
    
    //更改数据源
//    NSArray *friends = [NSArray arrayWithObjects:addCell.friend, nil];
//    NSArray *indexes = [NSArray arrayWithObjects:indexPath.row, nil];
    [group.friends insertObject:addCell.friend atIndex:indexPath.row + 1];
    
    //更改界面
    NSArray *indexPaths = [NSArray arrayWithObjects:indexPath, nil];
    [_tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    
}

//允许移动
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return 1;
}

//实现移动效果
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
    QYGroupModel *sourceGroup = self.groups[sourceIndexPath.section];
    QYGroupModel *desGroup = self.groups[destinationIndexPath.section];
    
    NSMutableArray *sourceFriends = sourceGroup.friends;
    NSMutableArray *desFriends = desGroup.friends;
    
    //把要移动的数据取出来
    QYFriendModel *movedFriend = sourceFriends[sourceIndexPath.row];
    
    //更改数据源
    if (sourceIndexPath.section == destinationIndexPath.section) {
        [sourceFriends exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
        return;
    }
    
    [sourceFriends removeObjectAtIndex:sourceIndexPath.row];
    [desFriends insertObject:movedFriend atIndex:destinationIndexPath.row];
    
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
