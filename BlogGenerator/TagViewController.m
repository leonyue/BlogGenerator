//
//  TagViewController.m
//  BlogGenerator
//
//  Created by dj.yue on 2017/9/19.
//  Copyright © 2017年 dj.yue. All rights reserved.
//

#import "TagViewController.h"
#import "TagItem.h"

@interface TagViewController ()<NSCollectionViewDataSource,NSCollectionViewDelegateFlowLayout>
@property (weak) IBOutlet NSCollectionView *collectionView;

@end

@implementation TagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerNib:[[NSNib alloc] initWithNibNamed:@"TagItem" bundle:nil] forItemWithIdentifier:@"TagItem"];
    // Do view setup here.
}


- (void)viewWillAppear {
    [super viewWillAppear];
    [self addObserver:self forKeyPath:@"tags" options:(NSKeyValueObservingOptionNew) context:nil];
}

- (void)viewWillDisappear {
    [super viewWillDisappear];
    [self removeObserver:self forKeyPath:@"tags"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"tags"]) {
        NSValue *kind = [change valueForKey:NSKeyValueChangeKindKey];
        NSLog(@"kind is %@", kind);
        NSString *value = [change valueForKey:NSKeyValueChangeNewKey];
        [self.collectionView reloadData];
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(NSCollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(NSCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (NSCollectionViewItem *)collectionView:(NSCollectionView *)collectionView itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath {
    TagItem *item = [collectionView makeItemWithIdentifier:@"TagItem" forIndexPath:indexPath];
    item.label.stringValue = self.tags[indexPath.item];
    
    __weak typeof(self) weakSelf = self;
    item.deleteClickBlock = ^ {
        [[weakSelf mutableArrayValueForKey:@"tags"] removeObjectAtIndex:indexPath.item];
//        [weakSelf.tags removeObjectAtIndex:indexPath.item];
//        [weakSelf.collectionView reloadData];
    };
    return item;
}

- (NSSize)collectionView:(NSCollectionView *)collectionView layout:(NSCollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.item > self.tags.count-1 ||
        self.tags.count == 0) {
        return CGSizeZero;
    }
    CGSize size = [self.tags[indexPath.item] sizeWithAttributes:@{NSFontAttributeName:[NSFont systemFontOfSize:13.f]}];
    size.width += 16.f;
    return size;
}


- (NSMutableArray *)tags {
    if (_tags == nil) {
        _tags = [NSMutableArray new];
    }
    return _tags;
}

@end
