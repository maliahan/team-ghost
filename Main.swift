//
//  main.swift
//  ghost escape
//
//  Created by ali on 6/19/17.
//  Copyright © 2017 amapps. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation

class Main: SKScene {
    static var flagSound = 0
    static var musicAction : Bool = true
    static var bgSound = AVAudioPlayer()
    static var vibAction : Bool = true
    static var sfx : Bool = true
    func big_small(sprite : SKSpriteNode , h_s: Int , w_s : Int , h_b : Int , w_b : Int , speed_small : TimeInterval ,speed_big : TimeInterval , waiting_before : TimeInterval , waiting_after : TimeInterval) {
        let big_h = SKAction.resize(toHeight: CGFloat(h_b), duration: speed_big)
        let big_w = SKAction.resize(toWidth: CGFloat(w_b), duration: speed_big)
        let small_h = SKAction.resize(toHeight: CGFloat(h_s), duration: speed_small)
        let small_w = SKAction.resize(toWidth: CGFloat(w_s), duration: speed_small)
        let seq_h = SKAction.sequence([SKAction.wait(forDuration: waiting_before),big_h , small_h,SKAction.wait(forDuration: waiting_after)])
        let seq_W = SKAction.sequence([SKAction.wait(forDuration: waiting_before ),big_w , small_w,SKAction.wait(forDuration: waiting_after)])
        sprite.run(SKAction.repeatForever(seq_h))
        sprite.run(SKAction.repeatForever(seq_W))
    }
    func rotate(sprite : SKSpriteNode ,go_angle : CGFloat ,come_angle : CGFloat ,direction : CGFloat ,speed_go : TimeInterval ,speed_come : TimeInterval ,rotate_full_circle : Bool){
        if rotate_full_circle == false {
            let rotat_go = SKAction.rotate(toAngle: CGFloat(go_angle), duration: speed_go)
            let rotat_come = SKAction.rotate(toAngle: CGFloat(come_angle), duration: speed_come)
            let seq = SKAction.sequence([rotat_go,rotat_come])
            sprite.run(SKAction.repeatForever(seq))
        }
        else{
            if direction == 1{
                sprite.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(-(Double.pi)), duration: speed_go)))
            }
            else if direction == -1 {
                sprite.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat((Double.pi)), duration: speed_go)))
            }
        }
    }
    func rotate_to_point(sprite : SKSpriteNode , go_x : CGFloat , go_y : CGFloat , speed : TimeInterval){
        
        let rotate_angle = atan2(go_y, go_x) - CGFloat(Double.pi/2)
       
        sprite.run(SKAction.rotate(toAngle: rotate_angle, duration: speed))
    }
    func move_char(sprite : SKSpriteNode , gox : Int , goy : Int , comex : Int ,comey : Int , speed_go : TimeInterval , speed_come : TimeInterval ,back : Bool){
        if back == true {
            let go_y = SKAction.moveTo(y: CGFloat(goy), duration: speed_go)
            let come_y = SKAction.moveTo(y: CGFloat(comey), duration: speed_come)
            let go_x = SKAction.moveTo(x: CGFloat(gox), duration: speed_go)
            let come_x = SKAction.moveTo(x: CGFloat(comex), duration: speed_come)
            let seq1 = SKAction.sequence([go_y,come_y])
            let seq2 = SKAction.sequence([go_x,come_x])
            sprite.run(SKAction.repeatForever(seq1))
            sprite.run(SKAction.repeatForever(seq2))
        }
        else {
            sprite.run(SKAction.moveTo(x: CGFloat(gox), duration: speed_go))
            sprite.run(SKAction.moveTo(y: CGFloat(goy), duration: speed_go))
        }
    }
    func find_distance(sprite : SKSpriteNode,gotox : Int ,gotoy : Int)-> Int{
        let a = sprite.position.y - CGFloat(gotoy)
        let b = sprite.position.x - CGFloat(gotox)
        let c = (a * a) + (b * b)
        return Int(c);
    }
    func win(sprite : SKSpriteNode , x : Int , y : Int){
        let win = find_distance(sprite: sprite, gotox: x, gotoy: y)
    }
    
    func lvlseven_laser(sprite : SKSpriteNode ,comex : CGFloat ,speed_go : TimeInterval){
        let step_1 = SKAction.moveTo(x: 430, duration: speed_go)
        let step_2 = SKAction.moveTo(x: -239, duration: 0.01)
        let seq = SKAction.sequence([step_1,step_2])
        sprite.run(SKAction.repeatForever(seq))
        
        
    }
    
    
    func lvlsix_angry_ghost(sprite : SKSpriteNode ,go_angle : CGFloat ,gox : CGFloat , come_angle : CGFloat ,comex : CGFloat ,speed_rotate : TimeInterval ,speed_move : TimeInterval, waiting_before : TimeInterval, waiting_after : TimeInterval){
        let step_1 = SKAction.rotate(toAngle: go_angle, duration: speed_rotate)
        let step_2 = SKAction.moveTo(x: gox, duration: speed_move)
        let step_3 = SKAction.rotate(toAngle: come_angle, duration: speed_rotate)
        let step_4 = SKAction.moveTo(x: comex, duration: speed_move)
        let seq = SKAction.sequence([SKAction.wait(forDuration: waiting_before),step_1,step_2,step_3,step_4,SKAction.wait(forDuration: waiting_after)])
        sprite.run(SKAction.repeatForever(seq))
        
    }

    

    func angry_ghost(sprite : SKSpriteNode){
        
        let offsetX = sprite.size.width * sprite.anchorPoint.x
        let offsetY = sprite.size.height * sprite.anchorPoint.y
        
        let path = CGMutablePath()
        
        path.move(to: CGPoint(x:  118 - offsetX, y: 76 - offsetY))
        path.addLine(to: CGPoint(x: 118 - offsetX, y: 76 - offsetY))
        path.addLine(to: CGPoint(x: 118 - offsetX, y: 76 - offsetY))
        path.addLine(to: CGPoint(x: 115 - offsetX, y: 84 - offsetY))
        path.addLine(to: CGPoint(x: 110 - offsetX, y: 82 - offsetY))
        path.addLine(to: CGPoint(x: 106 - offsetX, y: 79 - offsetY))
        path.addLine(to: CGPoint(x: 103 - offsetX, y: 73 - offsetY))
        path.addLine(to: CGPoint(x: 102 - offsetX, y: 64 - offsetY))
        path.addLine(to: CGPoint(x: 98 - offsetX, y: 66 - offsetY))
        path.addLine(to: CGPoint(x: 95 - offsetX, y: 71 - offsetY))
        path.addLine(to: CGPoint(x: 92 - offsetX, y: 72 - offsetY))
        path.addLine(to: CGPoint(x: 89 - offsetX, y: 68 - offsetY))
        path.addLine(to: CGPoint(x: 90 - offsetX, y: 62 - offsetY))
        path.addLine(to: CGPoint(x: 93 - offsetX, y: 58 - offsetY))
        path.addLine(to: CGPoint(x: 96 - offsetX, y: 54 - offsetY))
        path.addLine(to: CGPoint(x: 100 - offsetX, y: 50 - offsetY))
        path.addLine(to: CGPoint(x: 98 - offsetX, y: 44 - offsetY))
        path.addLine(to: CGPoint(x: 96 - offsetX, y: 39 - offsetY))
        path.addLine(to: CGPoint(x: 92 - offsetX, y: 33 - offsetY))
        path.addLine(to: CGPoint(x: 91 - offsetX, y: 32 - offsetY))
        path.addLine(to: CGPoint(x: 11 - offsetX, y: 31 - offsetY))
        path.addLine(to: CGPoint(x: 10 - offsetX, y: 18 - offsetY))
        path.addLine(to: CGPoint(x: 19 - offsetX, y: 7 - offsetY))
        path.addLine(to: CGPoint(x: 24 - offsetX, y: 14 - offsetY))
        path.addLine(to: CGPoint(x: 28 - offsetX, y: 7 - offsetY))
        path.addLine(to: CGPoint(x: 33 - offsetX, y: 12 - offsetY))
        path.addLine(to: CGPoint(x: 38 - offsetX, y: 7 - offsetY))
        path.addLine(to: CGPoint(x: 42 - offsetX, y: 13 - offsetY))
        path.addLine(to: CGPoint(x: 47 - offsetX, y: 7 - offsetY))
        path.addLine(to: CGPoint(x: 52 - offsetX, y: 13 - offsetY))
        path.addLine(to: CGPoint(x: 57 - offsetX, y: 7 - offsetY))
        path.addLine(to: CGPoint(x: 62 - offsetX, y: 12 - offsetY))
        path.addLine(to: CGPoint(x: 67 - offsetX, y: 8 - offsetY))
        path.addLine(to: CGPoint(x: 72 - offsetX, y: 15 - offsetY))
        path.addLine(to: CGPoint(x: 100 - offsetX, y: 15 - offsetY))
        path.addLine(to: CGPoint(x: 227 - offsetX, y: 16 - offsetY))
        path.addLine(to: CGPoint(x: 227 - offsetX, y: 29 - offsetY))
        path.addLine(to: CGPoint(x: 219 - offsetX, y: 39 - offsetY))
        path.addLine(to: CGPoint(x: 214 - offsetX, y: 34 - offsetY))
        path.addLine(to: CGPoint(x: 209 - offsetX, y: 39 - offsetY))
        path.addLine(to: CGPoint(x: 205 - offsetX, y: 34 - offsetY))
        path.addLine(to: CGPoint(x: 200 - offsetX, y: 39 - offsetY))
        path.addLine(to: CGPoint(x: 195 - offsetX, y: 34 - offsetY))
        path.addLine(to: CGPoint(x: 191 - offsetX, y: 39 - offsetY))
        path.addLine(to: CGPoint(x: 186 - offsetX, y: 34 - offsetY))
        path.addLine(to: CGPoint(x: 181 - offsetX, y: 39 - offsetY))
        path.addLine(to: CGPoint(x: 176 - offsetX, y: 34 - offsetY))
        path.addLine(to: CGPoint(x: 172 - offsetX, y: 39 - offsetY))
        path.addLine(to: CGPoint(x: 166 - offsetX, y: 32 - offsetY))
        path.addLine(to: CGPoint(x: 147 - offsetX, y: 32 - offsetY))
        path.addLine(to: CGPoint(x: 143 - offsetX, y: 37 - offsetY))
        path.addLine(to: CGPoint(x: 141 - offsetX, y: 42 - offsetY))
        path.addLine(to: CGPoint(x: 139 - offsetX, y: 49 - offsetY))
        path.addLine(to: CGPoint(x: 143 - offsetX, y: 54 - offsetY))
        path.addLine(to: CGPoint(x: 148 - offsetX, y: 58 - offsetY))
        path.addLine(to: CGPoint(x: 150 - offsetX, y: 64 - offsetY))
        path.addLine(to: CGPoint(x: 149 - offsetX, y: 69 - offsetY))
        path.addLine(to: CGPoint(x: 146 - offsetX, y: 73 - offsetY))
        path.addLine(to: CGPoint(x: 142 - offsetX, y: 69 - offsetY))
        path.addLine(to: CGPoint(x: 139 - offsetX, y: 65 - offsetY))
        path.addLine(to: CGPoint(x: 138 - offsetX, y: 64 - offsetY))
        path.addLine(to: CGPoint(x: 137 - offsetX, y: 69 - offsetY))
        path.addLine(to: CGPoint(x: 135 - offsetX, y: 76 - offsetY))
        path.addLine(to: CGPoint(x: 131 - offsetX, y: 81 - offsetY))
        path.addLine(to: CGPoint(x: 124 - offsetX, y: 84 - offsetY))
        path.addLine(to: CGPoint(x: 119 - offsetX, y: 84 - offsetY))
        path.addLine(to: CGPoint(x: 114 - offsetX, y: 84 - offsetY))
        
        path.closeSubpath()
        
        sprite.physicsBody = SKPhysicsBody(polygonFrom: path)
    }
}
