//
//  ALKnowledgeViewController.m
//  ALApp
//
//  Created by xujing on 16/7/28.
//  Copyright © 2016年 AiLi. All rights reserved.
//

#import "ALKnowledgeViewController.h"
#import "ALKnowledgeHomeTopView.h"
#import <SDAutoLayout.h>

#define TAG_KNOWLEDGEBTN 70
#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height

#define SCREEN_WIDTH_Flexible(X) ( X/375.0*SCREEN_WIDTH)
#define SCREEN_HEIGHT_Flexible(X) ( X/667.0*SCREENH_HEIGHT)
#define ColorWithOne(R) [UIColor colorWithRed:R/255.0 green:R/255.0 blue:R/255.0 alpha:1.0]
#define ColorWithRGB(R,G,B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]

@interface ALKnowledgeViewController ()<ALKnowledgeHomeTopViewDelegate>
{
    
    __weak IBOutlet UIScrollView *_mainScrollView;
    ALKnowledgeHomeTopView *_topView;
    
}

@end

@implementation ALKnowledgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _topView = (ALKnowledgeHomeTopView *)[[NSBundle mainBundle] loadNibNamed:@"ALKnowledgeHomeTopView" owner:self options:nil][0];
    _topView.delegate = self;
    [_mainScrollView addSubview:_topView];
    
    [self setupSubView];
}

- (void)setupSubView
{
    
    _topView.sd_layout.topSpaceToView(_mainScrollView,0).leftSpaceToView(_mainScrollView,0).rightSpaceToView(_mainScrollView,0).heightIs(SCREEN_WIDTH*1.11f);
    
    [_mainScrollView setupAutoContentSizeWithBottomView:_topView bottomMargin:10];
    _mainScrollView.contentSize = CGSizeMake(SCREEN_WIDTH, CGRectGetMaxY(_topView.frame)+10);
}

- (void)headerView:(ALKnowledgeHomeTopView *)header clickWithIndex:(NSInteger)index and:(id)obj
{
    
}
@end
