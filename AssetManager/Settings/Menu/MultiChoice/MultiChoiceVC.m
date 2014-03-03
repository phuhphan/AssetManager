//
//  MultiChoiceVC.m
//  AssetManager
//
//  Created by HP on 2/14/14.
//  Copyright (c) 2014 HP. All rights reserved.
//

#import "MultiChoiceVC.h"
#import "MultiChoiceCell.h"
#import "MultiChoiceObject.h"
#import "UserDefault.h"
#import "Language.h"
#import "CommonHelpers.h"

@interface MultiChoiceVC ()<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray* arrayData;
    SettingOptions _type;
}
@end

@implementation MultiChoiceVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (id)initWithType:(SettingOptions)type
{
    self = [super initWithNibName:@"MultiChoiceVC" bundle:nil];
    if (self) {
        
        _type = type;
        [self getArray];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)getArray
{
    if (_type == SettingLanguage) {
        arrayData = [[NSMutableArray alloc]initWithArray:[CommonHelpers getLanguageMenu]];
        self.title = [[Language sharedManager] getText:@"SETTINGS_MENU_LANGUAGE"];
        self.navigationItem.leftBarButtonItem.title = [[Language sharedManager] getText:@"SETTINGS_MENU_LANGUAGE"];
        [CommonHelpers setBarButton:self action:@selector(actionBack) button:BarButtonBack buttonLocation:BarButtonLeft Bar:self.navigationItem TitleText:@"Back"];
    }
}

#pragma mark TableViewDelegate & TableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellName = @"MultiChoiceCell";
    MultiChoiceCell* tableViewCell = (MultiChoiceCell*)[tableView dequeueReusableCellWithIdentifier:cellName];
    if (tableViewCell == nil) {
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:cellName owner:self options:nil];
        tableViewCell = [nib objectAtIndex:0];
    }
    
    MultiChoiceObject* object = [arrayData objectAtIndex:indexPath.row];
    tableViewCell.name.text = object.name;
    
    if (indexPath.row + 1 == [UserDefault userDefault].language) {
        tableViewCell.tick.backgroundColor = [UIColor blackColor];
    }
    
    return tableViewCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_type == SettingLanguage) {
        [UserDefault userDefault].language = indexPath.row + 1;
        [UserDefault update];
        [[Language sharedManager] setLanguage:[UserDefault userDefault].language];
        [self getArray];
        [[CommonHelpers appDelegate] reloadTabbar];
        [tableView reloadData];
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellName = @"MultiChoiceCell";
    MultiChoiceCell* tableViewCell = (MultiChoiceCell*)[tableView dequeueReusableCellWithIdentifier:cellName];
    if (tableViewCell == nil) {
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:cellName owner:self options:nil];
        tableViewCell = [nib objectAtIndex:0];
    }
    return tableViewCell.frame.size.height;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayData.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

#pragma mark Action

-(void)actionBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
