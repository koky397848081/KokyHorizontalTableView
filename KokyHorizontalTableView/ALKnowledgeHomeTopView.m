//
//  ALKnowledgeTopView.m
//  ALApp
//
//  Created by Tywin on 16/8/8.
//  Copyright © 2016年 AiLi. All rights reserved.
//

#import "ALKnowledgeHomeTopView.h"
#import <SDAutoLayout.h>
#import "ALKnowledgeCardView.h"

#define pageFlowH SCREEN_WIDTH*1.11f*0.89f
#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height

#define SCREEN_WIDTH_Flexible(X) ( X/375.0*SCREEN_WIDTH)
#define SCREEN_HEIGHT_Flexible(X) ( X/667.0*SCREENH_HEIGHT)
#define ColorWithOne(R) [UIColor colorWithRed:R/255.0 green:R/255.0 blue:R/255.0 alpha:1.0]
#define ColorWithRGB(R,G,B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]

@implementation ALKnowledgeHomeTopView
{
    NewPagedFlowView *_pageFlowView;
    NSInteger clickBtnTag;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupSubView];
}

- (void)setupSubView {
    
    if (!_pageFlowView) {
        _pageFlowView = [[NewPagedFlowView alloc] initWithFrame:CGRectMake(0, 24
                                                                           , SCREEN_WIDTH, pageFlowH)];
        //初始化pageControl
        UIPageControl *pageControl = [[UIPageControl alloc] init];
        _pageFlowView.pageControl = pageControl;
        [_pageFlowView addSubview:pageControl];
        [self addSubview:_pageFlowView];
        pageControl.sd_layout.topSpaceToView(_pageFlowView,pageFlowH + 5).leftSpaceToView(_pageFlowView,0).rightSpaceToView(_pageFlowView,0).heightIs(8);
    }
    _pageFlowView.delegate = self;
    _pageFlowView.dataSource = self;
    _pageFlowView.minimumPageAlpha = 0.4;
    _pageFlowView.minimumPageScale = 0.85;
    [_pageFlowView reloadData];
    [_pageFlowView startTimer];
}

- (void)dealloc
{
    [_pageFlowView stopTimer];
}

- (void)onClickBannerView:(UIButton *)button
{
    
    [self.delegate headerView:self clickWithIndex:(clickBtnTag+1)%3 and:nil];
    
}

#pragma mark NewPagedFlowView Delegate
- (CGSize)sizeForPageInFlowView:(NewPagedFlowView *)flowView {
    return CGSizeMake(SCREEN_WIDTH*0.74f, pageFlowH);
}

#pragma mark NewPagedFlowView Datasource
- (NSInteger)numberOfPagesInFlowView:(NewPagedFlowView *)flowView {
    return 3;
}

- (UIView *)flowView:(NewPagedFlowView *)flowView cellForPageAtIndex:(NSInteger)index{
    ALKnowledgeCardView *bannerView = (ALKnowledgeCardView *)[flowView dequeueReusableCell];
    if (!bannerView) {
        bannerView = (ALKnowledgeCardView *)[[NSBundle mainBundle] loadNibNamed:@"ALKnowledgeCardView" owner:self options:nil][0];
        bannerView.layer.cornerRadius = 4;
        bannerView.layer.masksToBounds = YES;
    }
    NSArray *titleArr = @[@"环球礼仪",@"传统礼仪",@"现代礼仪"];
    NSArray *contentArr = @[@"地域性是礼仪概念的重要属性，正是因为这一属性的存在，不同地域的人对礼仪的看法有所不同，所表现出来的礼貌也不同。随着交通的快速发展，地球“缩小”成了地球村。出国工作、旅行成了人们的日常事项，了解不同国家的礼仪要点，更好地尊重国际友人，表达友好，成为人们的迫切之事。 环球礼仪主要分为环球的宗教礼仪及不同地域礼仪。地域礼仪按照全球区域划分又可分为亚洲礼仪、欧洲礼仪、非洲礼仪、南美洲礼仪、北美洲礼仪、大洋州礼仪。不同的地域版块下又进行了细分，如亚洲礼仪又分为中国、日本、韩国，等。力求完全传播全球各个地域的礼仪知识点。",@"中国自古以来就是礼仪之邦，文化历史悠久。传统礼仪的存在意义是为了守护、弘扬这份礼仪文化，让每一个中华儿女明白传统礼仪的历史起源以及深刻意义。传统礼仪版块涵盖了中国历史各代的礼仪发展、典故、规范，让礼仪爱好者找到每一个礼仪点的根所在。 传统礼仪版块包括了传统节日、吉礼、凶礼、军礼、宾礼、嘉礼、九州风俗、国学礼仪、服饰礼仪，等内容。各大版块下又进行了细分，如嘉礼又分为了婚冠之礼、宾射之礼，等。而婚冠之礼又分为成长礼、婚礼，等等。传统礼仪再现了中国古人的礼仪文化，每一个想追踪礼仪文化的人都能在这里找到想要的答案。",@"时间性是礼仪概念的另一个重要属性，不同的朝代，人们对礼仪的认识有所不同。随着时间的推进，人们对礼仪的看法发生了变化，过去是礼貌的事情，现代看来可能是不必要的讲究。为了跟上时代的变化，现代礼仪版块提供了当代人际交往切实可行的礼仪知识，弘扬现代社会中的礼仪文化。 现代礼仪版块包括了现代人生活中的方方面面，如公共礼仪、婚礼礼仪、丧葬礼仪、日常聚会礼仪、用餐礼仪、商务礼仪、职场礼仪，等内容。各个大版块下又进行了细分，如商务礼仪又细分为商务接待礼仪、商务会议礼仪，等等。"];
    
    NSArray *imageNameArr = @[@"global_eti",@"trodition_eti",@"modern_eti"];
    bannerView.imageView.image = [UIImage imageNamed:imageNameArr[index]];
    NSString *typeS = titleArr[index];
    bannerView.typeL.text = typeS;
    bannerView.contentL.text = contentArr[index];
    clickBtnTag = index;
    [bannerView.actionButton addTarget:self action:@selector(onClickBannerView:) forControlEvents:UIControlEventTouchUpInside];
    return bannerView;
}


@end
