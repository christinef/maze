//
//  mazeViewController.m
//  SpriteKitWalkthrough
//
//  Created by Christine Franks on 7/22/13.
//  Copyright (c) 2013 Christine Franks. All rights reserved.
//

#import "mazeViewController.h"
#import "MazeScene.h"

@interface mazeViewController ()
@end

@implementation mazeViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    SKView *spriteView = (SKView*) self.view;
    spriteView.showsDrawCount = YES;
    spriteView.showsNodeCount = YES;
    spriteView.showsFPS = YES;
}

- (void) viewWillAppear:(BOOL)animated
{
    MazeScene* maze = [[MazeScene alloc] initWithSize:CGSizeMake(768,1024)];
    SKView *spriteView = (SKView*) self.view;
    [spriteView presentScene: maze];
}

@end
