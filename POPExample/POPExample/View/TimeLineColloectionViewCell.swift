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

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        var mediaRect: CGRect = bounds
        mediaRect.size.width -= 10
        mediaRect.size.height -= 40
        mediaRect.origin.x += 5
        mediaRect.origin.y += 5
        
        var noteRect: CGRect = mediaRect
        noteRect.origin.y = bounds.size.height - 30
        noteRect.size.height = 30
        
        note.textAlignment = .center
        note.font = UIFont.systemFont(ofSize: 15)
        note.adjustsFontSizeToFitWidth = true
        note.minimumScaleFactor = 0.1
        
        mediaImageView.contentMode = .scaleAspectFit
        mediaImageView.layout(in: mediaRect)
        videoLayer.layout(in: mediaRect)
        note.layout(in: noteRect)
        
        layer.addSublayer(videoLayer)
        addSubview(mediaImageView)
        addSubview(note)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
