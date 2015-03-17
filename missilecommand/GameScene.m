//
//  GameScene.m
//  missilecommand
//
//  Created by giaunv on 3/17/15.
//  Copyright (c) 2015 366. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

-(id)initWithSize:(CGSize)size{
    if (self = [super initWithSize:size]) {
        
    }
    
    return self;
}

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    self.backgroundColor = [SKColor colorWithRed:(198.0/255.0) green:(220.0/255.0) blue:(54.0/255.0) alpha:1.0];
    
    position = self.size.width/3;
    sizeGlobal = self.size;
    [self addFlowerCommand];
    
    // Label Informing Missiles Exploded
    labelMissilesExploded = [SKLabelNode labelNodeWithFontNamed:@"Hiragino-Kaku-Gothic-ProN"];
    labelMissilesExploded.text = [NSString stringWithFormat:@"Missiles Exploded: %d", missileExploded];
    labelMissilesExploded.fontSize = 30;
    labelMissilesExploded.position = CGPointMake(self.size.width/2, self.size.height - labelMissilesExploded.frame.size.height);
    labelMissilesExploded.zPosition = 3;
    [self addChild:labelMissilesExploded];
    
    flowerBullets1 = 10;
    flowerBullets2 = 10;
    flowerBullets3 = 10;
    
    labelflowerBullets1 = [SKLabelNode labelNodeWithFontNamed:@"Hiragino-Kaku-Gothic-ProN"];
    labelflowerBullets1.text = [NSString stringWithFormat:@"%d", flowerBullets1];
    labelflowerBullets1.fontSize = 30;
    labelflowerBullets1.position = CGPointMake(position - position/2, labelflowerBullets1.frame.size.height/2);
    labelflowerBullets1.zPosition = 3;
    [self addChild:labelflowerBullets1];
    
    labelflowerBullets2 = [SKLabelNode labelNodeWithFontNamed:@"Hiragino-Kaku-Gothic-ProN"];
    labelflowerBullets2.text = [NSString stringWithFormat:@"%d", flowerBullets2];
    labelflowerBullets2.fontSize = 30;
    labelflowerBullets2.position = CGPointMake(position*2 - position/2, labelflowerBullets2.frame.size.height/2);
    labelflowerBullets2.zPosition = 3;
    [self addChild:labelflowerBullets2];
    
    labelflowerBullets3 = [SKLabelNode labelNodeWithFontNamed:@"Hiragino-Kaku-Gothic-ProN"];
    labelflowerBullets3.text = [NSString stringWithFormat:@"%d", flowerBullets3];
    labelflowerBullets3.fontSize = 30;
    labelflowerBullets3.position = CGPointMake(position*3 - position/2, labelflowerBullets3.frame.size.height/2);
    labelflowerBullets3.zPosition = 3;
    [self addChild:labelflowerBullets3];
    
    // Add Monsters
    [self addMonstersBetweenSpace:1];
    [self addMonstersBetweenSpace:2];
    
    // Create Actions
    SKAction *wait = [SKAction waitForDuration:2];
    SKAction *createMissiles = [SKAction runBlock:^{
        [self addMissilesFromSky:self.size];
    }];
    
    SKAction *updateMissiles = [SKAction sequence:@[wait, createMissiles]];
    [self runAction:[SKAction repeatActionForever:updateMissiles]];
}

-(void)addMissilesFromSky:(CGSize)size{
    int numberMissiles = [self getRandomNumberBetween:0 to:3];
    
    for (int i = 0; i < numberMissiles; i++) {
        SKSpriteNode *missile;
        missile = [SKSpriteNode spriteNodeWithImageNamed:@"enemyMissile"];
        missile.scale = 0.6;
        missile.zPosition = 1;
        
        int startPoint = [self getRandomNumberBetween:0 to:self.size.width];
        missile.position = CGPointMake(startPoint, size.height);
        
        int endPoint = [self getRandomNumberBetween:0 to:self.size.width];
        SKAction *move = [SKAction moveTo:CGPointMake(endPoint, 0) duration:15];
        SKAction *remove = [SKAction removeFromParent];
        [missile runAction:[SKAction sequence:@[move, remove]]];
        
        [self addChild:missile];
    }
}

-(void)addFlowerCommand{
    for (int i = 1; i <= 3; i++) {
        SKSpriteNode *flower = [SKSpriteNode spriteNodeWithImageNamed:@"flower.png"];
        flower.zPosition = 2;
        flower.position = CGPointMake(position*i - position/2, flower.size.height/2);
        [self addChild:flower];
    }
}

-(void)addMonstersBetweenSpace:(int)spaceOrder{
    for (int i = 0; i < 3; i++) {
        int giveDistanceToMonsters = 60 * i - 60;
        int randomMonster = [self getRandomNumberBetween:0 to:1];
        SKSpriteNode *monster;
        
        if (randomMonster == 0) {
            monster = [SKSpriteNode spriteNodeWithImageNamed:@"protectCreature4"];
        } else {
            monster = [SKSpriteNode spriteNodeWithImageNamed:@"protectCreature2"];
        }
        monster.zPosition = 2;
        monster.position = CGPointMake(position * spaceOrder - giveDistanceToMonsters, monster.size.height / 2);
        
        [self addChild:monster];
    }
}

-(int)getRandomNumberBetween:(int)from to:(int)to{
    return (int)from + arc4random() % (to - from + 1);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
