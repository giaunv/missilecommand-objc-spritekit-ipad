//
//  GameScene.h
//  missilecommand
//

//  Copyright (c) 2015 366. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

typedef enum: NSUInteger{
    ExplosionCategory = (1 << 0),
    MissileCategory = (1 << 1),
    MonsterCategory = (1 << 2)
} NodeCatagory;

@interface GameScene : SKScene<SKPhysicsContactDelegate>{
    CGSize sizeGlobal;
    
    SKLabelNode *labelflowerBullets1;
    SKLabelNode *labelflowerBullets2;
    SKLabelNode *labelflowerBullets3;
    SKLabelNode *labelMissilesExploded;
    
    int position;
    int monstersDead;
    int missileExploded;
    
    int flowerBullets1;
    int flowerBullets2;
    int flowerBullets3;
}
@end
