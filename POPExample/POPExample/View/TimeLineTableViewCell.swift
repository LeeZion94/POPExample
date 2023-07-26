//
//  TimeLineTableViewCell.swift
//  POPExample
//
//  Created by Hyungmin Lee on 2023/07/26.
//

import UIKit
import AVFoundation

final class TimeLineTableViewCell: UITableViewCell, MediaContainer {
    var note = UILabel()
    var videoLayer = AVPlayerLayer()
    var mediaImageView = UIImageView()

    var content: Content? {
        didSet {
            self.contentChanged()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentChanged()
        
        let cellHeight: CGFloat = 80
        
        let mediaRect: CGRect = CGRect(x: 5, y: 5, width: cellHeight - 10, height: cellHeight - 10)
        mediaImageView.layout(in: mediaRect)
        videoLayer.layout(in: mediaRect)
        
        mediaImageView.contentMode = .scaleAspectFit
        
        self.addSubview(mediaImageView)
        self.layer.addSublayer(videoLayer)
        
        var noteRect: CGRect = self.bounds
        noteRect.origin.x = mediaRect.size.width + 10
        noteRect.size.width -= noteRect.origin.x
        noteRect.size.height = cellHeight
        
        note.layout(in: noteRect)
        
        
        self.addSubview(note)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
