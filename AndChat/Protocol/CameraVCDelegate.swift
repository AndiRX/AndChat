//
//  CameraVCDelegate.swift
//  AndChat
//
//  Created by Petr on 03.12.17.
//  Copyright © 2017 Andi. All rights reserved.
//

import Foundation

protocol CameraVCDelegate {
    
    init()
    
    func shouldEnableCameraUI(enabled: Bool)
    func shouldEnableRecordUI(enabled: Bool)
    func canStartRecording()
    func recordingHasStarted()
    func videoRecordingComplete(videoURL: URL)
    func videoRecordingFailed()
    func snapshotTaken(snapshotData: Data)
    func snapshotFailed()
}
