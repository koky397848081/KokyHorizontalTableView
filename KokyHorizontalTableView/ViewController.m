//
//  ViewController.m
//  KokyHorizontalTableView
//
//  Created by xujing on 2017/5/3.
//  Copyright © 2017年 xujing. All rights reserved.
//

#import "ViewController.h"
#import "ALKnowledgeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClick:(id)sender {
    [self.navigationController pushViewController:[[ALKnowledgeViewController alloc]init] animated:YES];
}

@end
