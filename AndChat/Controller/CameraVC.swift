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
        self._previewView = previewView
        super.viewDidLoad()
    
        
        
    }


}

