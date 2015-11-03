//
//  QYTGSearchResultTableViewController.m
//  作业-微信
//
//  Created by qingyun on 15/11/2.
//  Copyright (c) 2015年 qingyun. All rights reserved.
//

#import "QYTGSearchResultTableViewController.h"
#import "QYTuanGouTableViewCell.h"
#import "QYTuanGouModel.h"

@interface QYTGSearchResultTableViewController ()
@property (strong, nonatomic) NSMutableArray *results;
@end

@implementation QYTGSearchResultTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 100;
    
    [self.tableView registerClass:[QYTuanGouTableViewCell class] forCellReuseIdentifier:@"cell"];
    
//    [self loadTitles];
}

//-(void)loadTitles{
//    NSMutableArray *temp = [NSMutableArray array];
//    for (QYTuanGouModel *model in _datas) {
//        [temp addObject:model.title];
//    }
//    _titles = temp;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController{
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[CD] %@",searchController.searchBar.text];
//    _results = [NSMutableArray arrayWithArray:[_titles filteredArrayUsingPredicate:predicate]];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.title CONTAINS[CD] %@",searchController.searchBar.text];
    _results = [NSMutableArray arrayWithArray:[_datas filteredArrayUsingPredicate:predicate]];
    [self.tableView reloadData];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _results.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QYTuanGouTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    //取出titles每个元素对应的model
    
//    for (QYTuanGouModel *model in _datas) {
//        if ([model.title isEqualToString:_results[indexPath.row]]) {
////            cell.textLabel.text = model.title;
//            cell.titleLabel.text = model.title;
//            cell.detailLabel.text = model.price;
//            cell.imageView.image = [UIImage imageNamed:model.icon];
//            cell.buycountLabel.text = model.buycount;
//            return cell;
//        }
//    }
    
    QYTuanGouModel *model = self.results[indexPath.row];
    cell.textLabel.text = model.title;
    cell.detailLabel.text = model.price;
    cell.imageView.image = [UIImage imageNamed:model.icon];
    cell.buycountLabel.text = model.buycount;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
