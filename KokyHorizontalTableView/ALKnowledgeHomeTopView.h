//
//  ALKnowledgeTopView.h
//  ALApp
//
//  Created by Tywin on 16/8/8.
//  Copyright © 2016年 AiLi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewPagedFlowView.h"
@protocol ALKnowledgeHomeTopViewDelegate;

@interface ALKnowledgeHomeTopView : UIView<NewPagedFlowViewDelegate,NewPagedFlowViewDataSource>
@property (nonatomic, assign) id<ALKnowledgeHomeTopViewDelegate> delegate;
@end

@protocol ALKnowledgeHomeTopViewDelegate <NSObject>

- (void)headerView:(ALKnowledgeHomeTopView *)header clickWithIndex:(NSInteger)index and:(id)obj;

@end


