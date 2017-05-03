//
//  ALKnowledgeCardView.h
//  ALApp
//
//  Created by xujing on 16/7/28.
//  Copyright © 2016年 AiLi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PGIndexBannerSubiew.h"
@interface ALKnowledgeCardView : PGIndexBannerSubiew
@property (weak, nonatomic) IBOutlet UILabel *_titleLabel;

@property (weak, nonatomic) IBOutlet UIButton *actionButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *typeL;

@property (weak, nonatomic) IBOutlet UILabel *contentL;
@end
