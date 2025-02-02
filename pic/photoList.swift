//
//  codeFile.swift
//  pic
//
//  Created by Aliisa Roe on 12/1/15.
//  Copyright © 2015 Aliisa Roe. All rights reserved.
//

import Foundation
import Photos

class PhotoList {
    
    static let sharedInstance = PhotoList()
    private init() {}
    
    var keepers: [ Int : PhotoKey ] = [:]
    var allPhotoList: [ Int : PhotoKey ] = [:]
    var discards: [ Int : PhotoKey ] = [:]
    
    enum list {
        case keepers
        case discards
    }
    
    func photoKeyExists(photo: PhotoKey) -> Bool {
        var found = false
        for eachPhoto in allPhotoList.values {
            if photo.index == eachPhoto.index {
                found = true
            } else {
                found = false
            }
        }
        return found
    }
    
    func keepPhoto(photo: PhotoKey, list: PhotoList.list) {
        if list == .keepers {
            keepers[photo.index] = photo
            self.discards[photo.index] = nil
            if !photoKeyExists(photo)  {
                self.allPhotoList[photo.index] = photo
            }
        }
        if list == .discards {
            self.keepers[photo.index] = nil
            discards[photo.index] = photo
        }
    }
    
    func clearPhotos(){
        //how to delete photokeys??
        self.keepers = [:]
        self.discards = [:]
    }
    
    func deletePhoto(photo: PhotoKey) {
        self.keepers[photo.index] = nil
        self.discards[photo.index] = nil
        self.discards[photo.index] = nil
    }

    func sortedListOfPhotoIndices(list: PhotoList.list) -> [Int] {
        var sortedIndices = [Int]()
        if list == .keepers {
            sortedIndices = keepers.keys.sort()
        }
        if list == .discards {
            sortedIndices = discards.keys.sort()
        }
        return sortedIndices
    }


//    func getTotalImages(list: PhotoList.list) -> [Int : UIImage] {
//        var imageDict = [Int: UIImage]()
//        if list == .discards {
//            for i in 0 ..< self.discards.count {
//                let photo = Array(self.discards.values)[i].image
//                imageDict[i] = photo
//            }
//        } else if list == .keepers {
//            for i in 0 ..< self.keepers.count {
//                let photo = Array(self.keepers.values)[i].image
//                imageDict[i] = photo
//            }
//        }
//
//        return imageDict
//    }
//    
    
    //end
}

