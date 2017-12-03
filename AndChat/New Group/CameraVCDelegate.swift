//
//  CameraVCDelegate.swift
//  AndChat
//
//  Created by Petr on 03.12.17.
//  Copyright © 2017 Andi. All rights reserved.
//

import Foundation

protocol CameraVCDelegate {
    
    func shouldEnableCameraUI(enabled: Bool)
    func shouldEnableRecordUI(enabled: Bool)
    func canStartRecording()
    func recordingHasStarted()
}
