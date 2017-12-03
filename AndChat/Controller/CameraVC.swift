//
//  ViewController.swift
//  AndChat
//
//  Created by Petr on 03.12.17.
//  Copyright © 2017 Andi. All rights reserved.
//

import UIKit

class CameraVC: CameraViewController {
    
    @IBOutlet weak var previewView: PreviewView!
    
    override func viewDidLoad() {
        _previewView = previewView
        super.viewDidLoad()
    
        
        
    }

    @IBAction func changeCameraBtnPressed(_ sender: Any) {
        changeCamera(UIButton)
    }
    
    @IBAction func recordBtnPressed(_ sender: UIButton) {
        toggleMovieRecording(UIButton)
        
    }
    
}

