//
//  HoverScene.swift
//  ARWalkthrough
//
//  Created by Wyszynski, Daniel on 2/18/18.
//  Copyright © 2018 Nike, Inc. All rights reserved.
//

import Foundation
import SceneKit

struct HoverScene {
    
    var scene: SCNScene?
    
    init() {
        scene = self.initializeScene()
    }
    
    func initializeScene() -> SCNScene? {
        let scene = SCNScene()
        
        setDefaults(scene: scene)
        
        return scene
    }
    
    func setDefaults(scene: SCNScene) {
        
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light?.type = SCNLight.LightType.ambient
        ambientLightNode.light?.color = UIColor(white: 0.6, alpha: 1.0)
        scene.rootNode.addChildNode(ambientLightNode)
    }
    
    func addSphere(position: SCNVector3) {
        
        guard let scene = self.scene else { return }
        
        let containerNode = SCNNode()
        
        let nodesInFile = SCNNode.allNodes(from: "Gas_Ball.dae")
        nodesInFile.forEach { (node) in
            containerNode.addChildNode(node)
        }
        containerNode.position = position
        scene.rootNode.addChildNode(containerNode)
        
        addAnimation(node: containerNode)
    }
    
    func addAnimation(node: SCNNode) {
        let rotateOne = SCNAction.rotateBy(x: 0, y: CGFloat(Float.pi), z: 0, duration: 5.0)
        let repeatForever = SCNAction.repeatForever(rotateOne)
        node.runAction(repeatForever)
    }
}

