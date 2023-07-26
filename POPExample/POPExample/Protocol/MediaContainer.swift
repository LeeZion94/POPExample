//
//  MediaContainer.swift
//  POPExample
//
//  Created by Hyungmin Lee on 2023/07/26.
//

import UIKit
import AVFoundation

// MARK : Layout
protocol Layout {
    var frame: CGRect { get set }
    mutating func layout(in rect: CGRect)
}

extension Layout {
    mutating func layout(in rect: CGRect) {
        self.frame = rect
    }
}

// MARK : ContentPresentable
protocol ContentPresentable: Layout {
    var canPresentContent: Bool { get }
}

extension ContentPresentable {
    var canPresentContent: Bool {
        return true
    }
}

extension UIImageView: ContentPresentable { }
extension AVPlayerLayer: ContentPresentable { }
extension UILabel: Layout { }

// MARK : MediaContainer
protocol MediaContainer {
    var content: Content? { get set }
    var media: ContentPresentable { get }
    var note: UILabel { get set }
    
    var videoLayer: AVPlayerLayer { get }
    var mediaImageView: UIImageView { get }
    
    func contentChanged()
}

extension MediaContainer {
    func contentChanged() {
        guard let content = content else {
            mediaImageView.isHidden = true
            mediaImageView.image = nil
            videoLayer.isHidden = true
            videoLayer.player = nil
            return
        }
        
        switch content.type {
        case .image:
            mediaImageView.isHidden = false
            videoLayer.isHidden = true
            
            let image = UIImage(contentsOfFile: content.urlString)
            
            mediaImageView.image = image
        case .video:
            mediaImageView.isHidden = true
            videoLayer.isHidden = false
            
            let videoURL = URL(filePath: content.urlString)
            let player = AVPlayer(url: videoURL)
            
            videoLayer.player = player
        }
        
        note.text = content.note
    }
    
    var media: ContentPresentable {
        switch content!.type {
        case .image:
            return mediaImageView
        case .video:
            return videoLayer
        }
    }
}
