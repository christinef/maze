//
//  SpaceshipScene.m
//  SpriteKitWalkthrough
//
//  Created by Christine Franks on 7/22/13.
//  Copyright (c) 2013 Christine Franks. All rights reserved.
//

#import "SpaceshipScene.h"

@interface SpaceshipScene ()
@property BOOL contentCreated;
@property SKSpriteNode* spaceship;
@property SKSpriteNode* hull;
@end

@implementation SpaceshipScene
- (void)didMoveToView:(SKView *)view
{
    if (!self.contentCreated)
    {
        [self createSceneContents];
        self.contentCreated = YES;
    }
}

- (void)createSceneContents
{
    self.backgroundColor = [SKColor blackColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    _spaceship = [self newSpaceship];
    _spaceship.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)-150);
    [self addChild:_spaceship];
}

- (SKSpriteNode *)newSpaceship
{
    _hull = [[SKSpriteNode alloc] initWithColor:[SKColor blueColor] size:CGSizeMake(64,32)];

    SKSpriteNode *light1 = [self newLight];
    light1.position = CGPointMake(-28.0, 6.0);
    [_hull addChild:light1];
    
    SKSpriteNode *light2 = [self newLight];
    light2.position = CGPointMake(28.0, 6.0);
    [_hull addChild:light2];
    
    _hull.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_hull.size];
    _hull.physicsBody.dynamic = NO;
    
    return _hull;
}

- (SKSpriteNode *)newLight
{
    SKSpriteNode *light = [[SKSpriteNode alloc] initWithColor:[SKColor yellowColor] size:CGSizeMake(8,8)];
    
    SKAction *blink = [SKAction sequence:@[
                                           [SKAction fadeOutWithDuration:0.5],
                                           [SKAction fadeInWithDuration:0.5]]];
    SKAction *blinkForever = [SKAction repeatActionForever:blink];
    [light runAction: blinkForever];
    
    return light;
}

- (void)touchesBegan:(NSSet*) touches withEvent:(UIEvent *)event
{
    CGPoint tapPoint = [[touches anyObject] locationInNode:self.spaceship.parent];
    CGPoint charPos = self.spaceship.position;
    SKAction *move = [SKAction sequence:@[
                                          [SKAction moveByX:tapPoint.x-charPos.x y:tapPoint.y-charPos.y duration:1.0]]];
    [_hull runAction:move];
}



@end
