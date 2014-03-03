//
//  SettingsVC.m
//  AssetManager
//
//  Created by HP on 2/13/14.
//  Copyright (c) 2014 HP. All rights reserved.
//

#import "SettingsVC.h"
#import "SettingMultiChoiceCell.h"
#import "SettingCellObject.h"
#import "CommonHelpers.h"
#import "MultiChoiceVC.h"

@interface SettingsVC ()<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray* arrayData;
    __weak IBOutlet UITableView* _tableView;
}
@end

@implementation SettingsVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    arrayData = [[NSMutableArray alloc]initWithArray:[CommonHelpers getSettingsMenu]];
    [_tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark TableViewDelegate & TableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellName = @"SettingMultiChoiceCell";
    SettingMultiChoiceCell* tableViewCell = (SettingMultiChoiceCell*)[tableView dequeueReusableCellWithIdentifier:cellName];
    if (tableViewCell == nil) {
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:cellName owner:self options:nil];
        tableViewCell = [nib objectAtIndex:0];
    }
    
    SettingCellObject* object = [arrayData objectAtIndex:indexPath.row];
    tableViewCell.name.text = object.name;
    tableViewCell.description.text = object.description;
    
    return tableViewCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MultiChoiceVC* multiChoice = [[MultiChoiceVC alloc]initWithType:indexPath.row];
    [self.navigationController pushViewController:multiChoice animated:YES];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellName = @"SettingMultiChoiceCell";
    SettingMultiChoiceCell* tableViewCell = (SettingMultiChoiceCell*)[tableView dequeueReusableCellWithIdentifier:cellName];
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

@end
