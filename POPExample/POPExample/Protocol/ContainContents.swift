//
//  ContainContents.swift
//  POPExample
//
//  Created by Hyungmin Lee on 2023/07/26.
//

protocol ContainContents {
    var contents: [Content] { get }
    var numberOfContents: Int { get }
}

extension ContainContents {
    var contents: [Content] {
        return TimeLineContentObject.shared.contents
    }
    
    var numberOfContents: Int {
        return contents.count
    }
}
