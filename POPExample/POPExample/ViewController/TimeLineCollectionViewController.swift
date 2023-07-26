//
//  TimeLineCollectionViewController.swift
//  POPExample
//
//  Created by Hyungmin Lee on 2023/07/26.
//

import UIKit

final class TimeLineCollectionViewController: UICollectionViewController, ContainContents, CanShowDetailViewController {
    private let reuseIdentifier = "CollectionCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = timelineTitle
        collectionView.register(TimeLineCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
}

// MARK: - CollectionView DataSource
extension TimeLineCollectionViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfContents
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? TimeLineCollectionViewCell else { return UICollectionViewCell() }
        
        let content = contents[indexPath.row]
        
        cell.content = content
        return cell
    }
}

// MARK: - CollectionView Delegate
extension TimeLineCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showDetaiViewController(content: contents[indexPath.row])
    }
}
