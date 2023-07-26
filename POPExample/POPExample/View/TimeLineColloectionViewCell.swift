//
//  TimeLineColloectionViewCell.swift
//  POPExample
//
//  Created by Hyungmin Lee on 2023/07/26.
//

import UIKit
import AVFoundation

final class TimeLineCollectionViewCell: UICollectionViewCell, MediaContainer {
    var note = UILabel()
    var videoLayer = AVPlayerLayer()
    var mediaImageView = UIImageView()
    
    var content: Content? {
        didSet {
            self.contentChanged()
        }
    }
    
    convenience init(frame: CGRect, content: Content) {
        self.init(frame: frame)
        self.content = content
        contentChanged()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        var mediaRect: CGRect = self.bounds
        mediaRect.size.width -= 10
        mediaRect.size.height -= 40
        mediaRect.origin.x += 5
        mediaRect.origin.y += 5
        
        mediaImageView.layout(in: mediaRect)
        videoLayer.layout(in: mediaRect)
        
        mediaImageView.contentMode = .scaleAspectFit
        
        self.addSubview(mediaImageView)
        self.layer.addSublayer(videoLayer)
        
        note.textAlignment = .center
        
        var noteRect: CGRect = mediaRect
        noteRect.origin.y = self.bounds.size.height - 30
        noteRect.size.height = 30
        
        note.layout(in: noteRect)
        
        self.addSubview(note)
        
        note.font = UIFont.systemFont(ofSize: 15)
        note.adjustsFontSizeToFitWidth = true
        note.minimumScaleFactor = 0.1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
