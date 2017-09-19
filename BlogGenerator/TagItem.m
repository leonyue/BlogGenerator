//
//  TagItem.m
//  BlogGenerator
//
//  Created by dj.yue on 2017/9/19.
//  Copyright © 2017年 dj.yue. All rights reserved.
//

#import "TagItem.h"

@interface TagItem ()

@end

@implementation TagItem

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}
- (IBAction)deleteClick:(id)sender {
    if (self.deleteClickBlock) self.deleteClickBlock();
}

@end
