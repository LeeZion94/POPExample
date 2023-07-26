//
//  DetailViewController.swift
//  POPExample
//
//  Created by Hyungmin Lee on 2023/07/26.
//

import UIKit
import AVFoundation

final class DetailViewController: UIViewController, MediaContainer {
    var note = UILabel()
    var videoLayer = AVPlayerLayer()
    var mediaImageView = UIImageView()
    
    var content: Content? {
        didSet {
            self.contentChanged()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        mediaImageView.layout(in: self.view.bounds)
        videoLayer.layout(in: self.view.bounds)
        
        mediaImageView.contentMode = .scaleAspectFit
        
        self.view.addSubview(mediaImageView)
        self.view.layer.addSublayer(videoLayer)
        
        var noteFrame: CGRect = self.view.bounds
        noteFrame.origin.y = noteFrame.size.height - 50
        noteFrame.size.height = 50
        
        note.layout(in: noteFrame)
        note.textAlignment = .center
        note.font = UIFont.systemFont(ofSize: 30)
        self.view.addSubview(note)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if content?.type == .video {
            videoLayer.player?.play()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if content?.type == .video {
            videoLayer.player?.pause()
            videoLayer.player = nil
        }
    }
}
