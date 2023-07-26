//
//  Content.swift
//  POPExample
//
//  Created by Hyungmin Lee on 2023/07/26.
//

struct Content {
    enum MediaType {
         case image, video
    }
    
    var type: MediaType
    var urlString: String
    var note: String
}
