//
//  ViewController.m
//  IndexTableView
//
//  Created by 马一轩 on 2019/5/9.
//  Copyright © 2019 马一轩. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView* myTableView;
    NSArray* dataArray;
    NSMutableArray* indexArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    // Do any additional setup after loading the view.
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, 414, 660)];
    myTableView.dataSource=self;
    myTableView.delegate=self;
    
    [self.view addSubview:myTableView];
}

-(void)initData{
    indexArray=[[NSMutableArray alloc]init];
    dataArray = @[@"第一行",@"第二行",@"第三行",@"第四行",@"第五行",@"第六行",@"第七行",@"第八行",@"第九行",@"第十行",@"第十一行",@"第十二行",@"第十三行",@"第十四行",@"第十五行",@"第十六行",@"第十七行",@"第十八行",@"第十九行",@"第二十行"];
    for (NSString* item in dataArray) {
        [indexArray addObject:item];
    }
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* flag = @"identify";
    UITableViewCell* cell =[myTableView dequeueReusableCellWithIdentifier:flag];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:flag];
        NSLog(@"新建了cell");
    }
    cell.textLabel.text = dataArray[indexPath.row];
    return cell;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"第一组";
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 80;
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return indexArray;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    
    NSIndexPath* path = [NSIndexPath indexPathForRow:index inSection:0];
    
    [myTableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
    //下两行可以用来改变定位的cell的样式
    //UITableViewCell* cell = [myTableView cellForRowAtIndexPath:path];
    //cell.accessoryType=UITableViewCellAccessoryCheckmark;
    
    return index;
    
}

@end
