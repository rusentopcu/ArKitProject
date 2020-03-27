//
//  ViewController.swift
//  ArKitProject
//
//  Created by Rusen Topcu on 27.03.2020.
//  Copyright © 2020 Rusen Topcu. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        //sceneView.showsStatistics = true
        
        // Create a new scene
        //let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
        //sceneView.scene = scene
        
        
        /*
        //MARK: - Sahnedeki Objelerin dizi olarak alınıp hareket özelliği vs katılması
        for node in sceneView.scene.rootNode.childNodes {
            
            let moveShip = SCNAction.moveBy(x: 1, y: 0.5, z: -0.5, duration: 1)
            let fadeOut = SCNAction.fadeOpacity(to: 0.5, duration: 1)
            let fadeIn = SCNAction.fadeOpacity(to: 1, duration: 1)
            let sequence = SCNAction.sequence([moveShip,fadeOut,fadeIn])
            let repeatForever = SCNAction.repeatForever(sequence)
            node.runAction(repeatForever)
         
        }
        */
        /*
        //MARK: - Ekranda obje oluşturma adımları
        let myBox = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        let boxMaterial = SCNMaterial()
        boxMaterial.diffuse.contents = UIImage(named: "art.scnassets/wood.jpg")
        myBox.materials = [boxMaterial]
        let node = SCNNode()
        node.position = SCNVector3(0, 0.1, -0.5)
        node.geometry = myBox
        sceneView.scene.rootNode.addChildNode(node)
        */
        
        let mySphere = createSphere(radius: 0.1, content: "wall.png", vector: SCNVector3(0, 0.2, -1))
        sceneView.scene.rootNode.addChildNode(mySphere)
        sceneView.automaticallyUpdatesLighting = true
        
    }
    
    //MARK: - fonk ile obje oluşturma
    func createSphere(radius: CGFloat, content: String, vector: SCNVector3) -> SCNNode {
        
        let mySphere = SCNSphere(radius: radius)
        let boxMaterial = SCNMaterial()
        boxMaterial.diffuse.contents = UIImage(named: "art.scnassets/\(content)")
        mySphere.materials = [boxMaterial]
        let node = SCNNode()
        node.position = vector
        node.geometry = mySphere
        return node
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
