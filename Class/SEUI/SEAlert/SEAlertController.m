//
//  SEAlertController.m
//  SEUI
//
//  Created by iMac Maxt on 2018/7/31.
//  Copyright © 2018年 SanshengTechnologyLLC. All rights reserved.
//

#import "SEAlertController.h"
#import "SEAutoLayout.h"
#import <UIColor+CCCategory.h>
#import "UIColor+Ext.h"
#import "SEMacros.h"
#import "SEAlertViewCell.h"
#import "SEModel.h"

typedef void(^HandlerDidSelectItemBlock)(NSInteger page);
@interface SEAlertController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@property (nonatomic, strong) UIButton  *cancelButton;

//
@property (nonatomic, strong) NSMutableArray  *titles;

//
@property (nonatomic, copy) HandlerDidSelectItemBlock handlerDidSelectItemBlock;

@end

@implementation SEAlertController

static NSString *kCell = @"SEAlertViewCell";

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.backgroundView.backgroundColor = kColorClear;
        _tableView.backgroundColor = kTColor;
        _tableView.rowHeight = 48;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.contentInset = UIEdgeInsetsMake(-(kStatusHeight+44), 0, 0, 0);
        _tableView.dataSource = self;
        _tableView.delegate   = self;
        
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 0.01)];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (UIButton *)cancelButton
{
    if (!_cancelButton) {
        _cancelButton = [[UIButton alloc] initWithFrame:CGRectZero];
        [self.view addSubview:_cancelButton];
        [_cancelButton setTintColor:kTColor];
    }
    return _cancelButton;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(8);
        make.right.mas_equalTo(self).offset(-8);
        make.bottom.mas_equalTo(self).offset(-20);
        make.height.offset(48);
    }];
    
//    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self).offset(8);
//        make.right.mas_equalTo(self).offset(-8);
//        make.bottom.mas_equalTo(self.cancelButton).offset(-20+8);
//        make.height.offset(48*self.titles.count);
//    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [kTColor colorAlpha:0.2];
    self.titles = [NSMutableArray array];
    [self.tableView registerNib:[UINib nibWithNibName:@"SEAlertViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kCell];
    
    [self.cancelButton addTarget:self action:@selector(selectorCancelAction) forControlEvents:(UIControlEventTouchUpInside)];
    
}

- (void)actionWithTitle:(NSString *)title detail:(NSString *)detail actionStyle:(UIAlertActionStyle)style handler:(void (^)(NSInteger page))handler
{
    [self.titles addObject:@{@"title":title,@"datail":detail.length ? detail : @""}];
    if (style == UIAlertActionStyleCancel) {
        [self.cancelButton setTitle:title forState:(UIControlStateNormal)];
    }
    if (handler) {
        handler = self.handlerDidSelectItemBlock;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titles.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView dequeueReusableCellWithIdentifier:kCell forIndexPath:indexPath];
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(nonnull SEAlertViewCell *)cell forRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    SEAlertModel *model = [SEAlertModel modelWithJSON:self.titles[indexPath.row]];
    
    cell.titleLabel.text = model.title;
    cell.detailLabel.text = model.detail;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    self.handlerDidSelectItemBlock(indexPath.row+1);
}

- (void)selectorCancelAction
{
    [self dismissViewControllerAnimated:YES completion:^{
        if (self.handlerDidSelectItemBlock) {
            self.handlerDidSelectItemBlock(0);
        }
    }];
}

@end
@implementation SEAlertModel

@end
