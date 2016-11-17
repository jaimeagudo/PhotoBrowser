//
//  PhotoInfo.swift
//  PhotoBrowser
//
//  Created by Zhouqi Mo on 1/2/15.
//  Copyright (c) 2015 Zhouqi Mo. All rights reserved.
//

import Foundation
import Alamofire
import FastImageCache

class PhotoInfo: NSObject, FICEntity {
    var uuid: String @objc(UUID) {
        let imageName = sourceImageURL.lastPathComponent
        let UUIDBytes = FICUUIDBytesFromMD5HashOfString(imageName)
        return FICStringWithUUIDBytes(UUIDBytes)
    }
    
    var sourceImageUUID: String {
        return UUID
    }
    
    var sourceImageURL: URL
    var request: Alamofire.Request?
    
    init(sourceImageURL: URL) {
        self.sourceImageURL = sourceImageURL
        super.init()
    }

    override func isEqual(_ object: Any?) -> Bool {
        return (object as! PhotoInfo).UUID == self.UUID
    }
    
    func sourceImageURL(withFormatName formatName: String!) -> URL! {
        return sourceImageURL
    }
    
    func drawingBlock(for image: UIImage!, withFormatName formatName: String!) -> FICEntityImageDrawingBlock! {
        
        let drawingBlock:FICEntityImageDrawingBlock = {
            (context:CGContext!, contextSize:CGSize) in
            var contextBounds = CGRectZero
            contextBounds.size = contextSize
            context.clear(contextBounds)
            
            UIGraphicsPushContext(context)
            image.draw(in: contextBounds)
            UIGraphicsPopContext()
        } as! FICEntityImageDrawingBlock
        return drawingBlock
    }
    
    
}
