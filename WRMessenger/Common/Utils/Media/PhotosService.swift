//
//  PhotosService.swift
//  WRMessenger
//
//  Created by Brothers Harhun on 5/28/18.
//  Copyright © 2018 Iseck. All rights reserved.
//

import UIKit
import Photos

class PhotosService: NSObject {

    typealias PhotosPermissionCallback = () -> Void

    static func requesetAccess(completionHandler: @escaping PhotosPermissionCallback) {
        switch PHPhotoLibrary.authorizationStatus() {
        case .authorized:
            completionHandler()
        case .denied:
            // TODO: Create access alert
            break
        case .restricted, .notDetermined:
            PHPhotoLibrary.requestAuthorization({ status in
                switch status {
                case .authorized:
                    DispatchQueue.main.async {
                        completionHandler()
                    }
                case .denied, .restricted, .notDetermined: break
                }
            })
        }
    }
}
