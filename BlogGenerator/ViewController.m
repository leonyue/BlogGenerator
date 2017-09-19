//
//  ViewController.m
//  BlogGenerator
//
//  Created by dj.yue on 2017/9/19.
//  Copyright © 2017年 dj.yue. All rights reserved.
//

#import "ViewController.h"
#import "TagViewController.h"
@interface ViewController()

@property (nonatomic, weak) TagViewController *tagsViewController;
@property (weak) IBOutlet NSTextField *tagTextField;

@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)prepareForSegue:(NSStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"tagsEmbed"]) {
        self.tagsViewController = segue.destinationController;
    }
}

- (IBAction)tagEnterClick:(id)sender {
    if (![self.tagTextField.stringValue isEqualToString:@""]) {
        [[self.tagsViewController mutableArrayValueForKey:@"tags"] addObject:self.tagTextField.stringValue];
    }
    NSLog(@"Enter Click");
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
