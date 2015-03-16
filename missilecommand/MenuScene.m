//
//  MenuScene.m
//  missilecommand
//
//  Created by giaunv on 3/17/15.
//  Copyright (c) 2015 366. All rights reserved.
//

#import "MenuScene.h"

@implementation MenuScene
-(void)didMoveToView:(SKView *)view{
    self.backgroundColor = [SKColor colorWithRed:(198.0/255.0) green:(220.0/255.0) blue:(54.0/255.0) alpha:1.0];
    SKSpriteNode *title = [SKSpriteNode spriteNodeWithImageNamed:@"title"];
    title.zPosition = 2;
    title.scale = 0.4;
    title.position = CGPointMake(self.size.width/2, self.size.height/2);
    [self addChild:title];
}
@end
