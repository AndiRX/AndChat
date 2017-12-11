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
    func videoRecordingComplete(videoURL: URL) {
        performSegue(withIdentifier: USERSVC_SEGUE, sender: ["videoURL":videoURL])
    }
    
    func videoRecordingFailed() {
        
    }
    
    func snapshotTaken(snapshotData: Data) {
        performSegue(withIdentifier: USERSVC_SEGUE, sender: ["snapshotData":snapshotData])
    }
    
    func snapshotFailed() {
        
    }
    
  
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let usersVC = segue.destination as? UsersVC {
            if let videoDict = sender as? Dictionary<String, URL> {
                let url = videoDict["videoURL"]
                usersVC.videoURL = url
            } else if let snapDict = sender as? Dictionary<String, Data> {
                let snapData = snapDict["snapshotData"]
                usersVC.snapData = snapData
            }
        }
    }
    
    
    
    @IBAction func changeCameraBtnPressed(_ sender: Any) {
        changeCamera(cameraBtn)
    }
    
    @IBAction func recordBtnPressed(_ sender: UIButton) {
        print("record button pressed")
        toggleMovieRecording()
        
    }
    
}

