//
//  TimeLineContentObject.swift
//  POPExample
//
//  Created by Hyungmin Lee on 2023/07/26.
//

import Foundation


final class TimeLineContentObject {
    static let shared: TimeLineContentObject = TimeLineContentObject()
    var contents: [Content] = []
    
    private init() {
        let notes: [String] = ["Let's go!", "야호", "Swift!!", "신나요"]
        
        for i in 0...3 {
            var content: Content?
            
            if let path = Bundle.main.path(forResource: "\(i)", ofType: "jpg") {
                content = Content(type: .image, urlString: path, note: notes[i])
            } else if let path = Bundle.main.path(forResource: "\(i)", ofType: "m4v") {
                content = Content(type: .video, urlString: path, note: notes[i])
            }
            
            if let content = content {
                contents.append(content)
            }
        }
    }
}
