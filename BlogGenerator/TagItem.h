//
//  TagItem.h
//  BlogGenerator
//
//  Created by dj.yue on 2017/9/19.
//  Copyright © 2017年 dj.yue. All rights reserved.
//

#import <Cocoa/Cocoa.h>


typedef void(^DeleteClick)();
@interface TagItem : NSCollectionViewItem
@property (weak) IBOutlet NSTextField *label;
@property (nonatomic, copy) DeleteClick deleteClickBlock;

@end
