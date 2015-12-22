//
//  KCController.m
//  XCFApp
//
//  Created by rkxt_ios on 15/11/30.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "KCController.h"

// 1.控件
#import "XCFSearchBar.h"
#import "XCFBarButtonItem.h"

// 2.控制器
#import "KCCreateController.h"
#import "KCTouchController.h"
#import "KCDetailController.h"

// 3.数据Model
#import "KCModel+request.h"
#import "KCIssues.h"
#import "KCItems.h"
//#import "KCBannerModel+Request.h"
#import "KCBanner+Request.h"

// 4.Cell视图
#import "KCCell.h"
#import "KCCellManager.h"



@interface KCController ()<UITableViewDataSource, UITableViewDelegate, UIViewControllerPreviewingDelegate, KCTouchControllerDelegate>

@property (nonatomic, strong) NSArray<KCIssues *> *issues;

@property (nonatomic, strong, nullable)UITableView *tableView; //
@property (nonatomic, strong, nullable)NSMutableArray <KCItems *>* arrayItems; //
@end

@implementation KCController

#pragma mark - lift cycle 生命周期

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupUI];
    
    [self setupData];
    
    [self setupBanner];
}

#pragma mark - Delegate 视图委托

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrayItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KCCell *cell = [KCCell cellWithTableView:tableView];
    KCCellManager *manager = [KCCellManager new];
    [manager setItems:self.arrayItems[indexPath.row]];
    [cell setManager:manager];
    
//    [self registerForPreviewingWithDelegate:self sourceView:cell];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    KCItems *items = self.arrayItems[indexPath.row];
//    KCDetailController *detailVC = [[KCDetailController alloc]init];
//    detailVC.items = items;
//    [self.navigationController pushViewController:detailVC
//                                         animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KCCellManager *manager = [KCCellManager new];
    [manager setItems:self.arrayItems[indexPath.row]];
    return manager.heightCell;
}


- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    NSLog(@"%s, %@", __FUNCTION__, self);
}

- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    
//    KCCell *cell = (KCCell *)previewingContext.sourceView;
//    
    KCTouchController *touchVC = [[KCTouchController alloc]init];
//    touchVC.items = cell.items;
//    touchVC.delegate = self;
    return touchVC;
}

- (void)touchControllerItems:(KCItems *)items
{
    NSLog(@"%s, %@", __FUNCTION__, items);
}
#pragma mark - event response 事件相应
- (void)gotoVC
{
    [self.navigationController pushViewController:[KCCreateController new] animated:YES];
}
#pragma mark - private methods 私有方法

- (void)setupUI
{
    // 1.添加搜索框
    XCFSearchBar *searchBar = [XCFSearchBar searchBarWithPlaceholder:@"菜谱、食物"];
    [self.navigationItem setTitleView:searchBar];
    
    // 2.添加导航按钮
    self.navigationItem.leftBarButtonItem = [XCFBarButtonItem barButtonItemWithImageName:@"homepageCreateRecipeButton"
                                                                                     target:self
                                                                                  action:@selector(gotoVC)];
    
    self.navigationItem.rightBarButtonItem = [XCFBarButtonItem barButtonItemWithImageName:@"buylistButtonImage"
                                                                                   target:self
                                                                                   action:@selector(gotoVC)];
    
    // 3.添加子视图
    [self.view addSubview:self.tableView];
    
}


- (void)setupData
{
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);
    
    [KCModel requestWithCompletionBlock:^(id returnValue) {
        self.issues = returnValue;
        dispatch_group_leave(group);
    } failureBlock:^(NSError *error) {
        dispatch_group_leave(group);
        
    }];
    
    [self.arrayItems removeAllObjects];
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        [self.issues enumerateObjectsUsingBlock:^(KCIssues * _Nonnull obj,
                                                  NSUInteger idx,
                                                  BOOL * _Nonnull stop) {

            [obj.items enumerateObjectsUsingBlock:^(KCItems * _Nonnull obj,
                                                    NSUInteger idx,
                                                    BOOL * _Nonnull stop) {
                [self.arrayItems addObject:obj];
                
            }];
        }];
        
        
        [self.tableView reloadData];
    });
}


- (void)setupBanner
{

    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);
    
    [KCBanner requestWithCompletionBlock:^(id returnValue) {
        LxDBAnyVar(returnValue);
        NSLog(@"%s, %@", __FUNCTION__, returnValue);
    } failureBlock:^(NSError *error) {
        
    }];
    
//    [KCBannerModel requestWithCompletionBlock:^(id returnValue) {
//        XCFLog(@"%@", returnValue);
//        CGSize size = CGSizeMake(87.6, 5.43);
//        LxDBAnyVar(size);
//        LxDBAnyVar(returnValue);
//        dispatch_group_leave(group);
//    } failureBlock:^(NSError *error) {
//         dispatch_group_leave(group);
//    }];
}
#pragma mark - getters and setters 属性

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
    }
    return _tableView;
}

- (NSMutableArray<KCItems *> *)arrayItems
{
    if (!_arrayItems) {
        _arrayItems = [NSMutableArray array];
    }
    return _arrayItems;
}



@end
