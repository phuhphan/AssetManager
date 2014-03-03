//
//  AssetVC.m
//  AssetManager
//
//  Created by HP on 2/11/14.
//  Copyright (c) 2014 HP. All rights reserved.
//

#import "AssetVC.h"
#import "AssetCell.h"
#import "AssetObject.h"

@interface AssetVC ()<UITableViewDataSource, UITableViewDelegate>
{
    __weak IBOutlet UISearchBar* _searchBar;
    __weak IBOutlet UITableView* _tableView;
    
    NSMutableArray* arrayData;
}
@end

@implementation AssetVC

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark SearchBar Delegate

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    _searchBar.text = @"";
    [_searchBar resignFirstResponder];
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [_searchBar resignFirstResponder];
}

#pragma mark
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellName = @"AssetCell";
    AssetCell* tableViewCell = (AssetCell*)[tableView dequeueReusableCellWithIdentifier:cellName];
    if (tableViewCell == nil) {
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:cellName owner:self options:nil];
        tableViewCell = [nib objectAtIndex:0];
    }
    
    AssetObject* object = [arrayData objectAtIndex:indexPath.row];
    tableViewCell.name.text = object.name;
    tableViewCell.location.text = object.location;
    tableViewCell.description.text = object.description;
    
    return tableViewCell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
}



@end
