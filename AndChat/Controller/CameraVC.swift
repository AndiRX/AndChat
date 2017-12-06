//
//  ViewController.swift
//  AndChat
//
//  Created by Petr on 03.12.17.
//  Copyright © 2017 Andi. All rights reserved.
//

import UIKit
import FirebaseAuth

class CameraVC: CameraViewController, CameraVCDelegate {
  
    @IBOutlet weak var recordBtn: UIButton!
    @IBOutlet weak var cameraBtn: UIButton!
    @IBOutlet weak var previewView: PreviewView!
    
    override func viewDidLoad() {
        _previewView = previewView
        super.viewDidLoad()
        delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        guard Auth.auth().currentUser != nil else {
            performSegue(withIdentifier: "goToLoginVC", sender: nil)
            return
        }
    }
    
    func canStartRecording() {
        print("Can start recording")
    }
    
    func recordingHasStarted() {
        print("Recording has started")
    }
    
    func shouldEnableCameraUI(enabled: Bool) {
        cameraBtn.isEnabled = enabled
        print("Should Enable Camera UI")
    }
    
    func shouldEnableRecordUI(enabled: Bool) {
        recordBtn.isEnabled = enabled
        print("Should enable record UI")
    }

    
    @IBAction func changeCameraBtnPressed(_ sender: Any) {
        changeCamera(cameraBtn)
    }
    
    @IBAction func recordBtnPressed(_ sender: UIButton) {
        toggleMovieRecording(recordBtn)
        
    }
    
}

