//
//  MainNavigationViewController.swift
//  POPExample
//
//  Created by Hyungmin Lee on 2023/07/26.
//

import UIKit

let timelineTitle = "Timeline"

enum ViewModeList {
    case Table, Collection
}

final class MainNavigationViewController: UINavigationController {
    private var viewMode: ViewModeList = .Table {
        didSet {
            viewModeChange()
        }
    }
    
    private var tableViewController: UITableViewController?
    private var collectionViewController: UICollectionViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModeChange()
    }
    
    private func viewModeChange() {
        guard let rootViewController = changedViewModeRootViewController() else { return }
        
        let changeViewModeButton = UIBarButtonItem(title: "Mode", style: .plain, target: self, action: #selector(pivotViewMode))
        
        rootViewController.navigationItem.leftBarButtonItem = changeViewModeButton
        viewControllers = [rootViewController]
    }
    
    private func changedViewModeRootViewController() -> UIViewController? {
        var rootViewController: UIViewController?
        
        switch viewMode {
        case .Table:
            if let tableViewController = tableViewController {
                rootViewController = tableViewController
            } else {
                tableViewController = TimeLineTableViewController()
            }
            
            rootViewController = tableViewController
        case .Collection:
            if let collectionViewController = collectionViewController {
                rootViewController = collectionViewController
            } else {
                var cellSize: CGSize = (view.window?.windowScene?.screen.bounds.size)!
                let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
                
                cellSize.width /= 3.0
                cellSize.width -= 10
                cellSize.height = cellSize.width + 30
                flowLayout.itemSize = cellSize
                collectionViewController = TimeLineCollectionViewController(collectionViewLayout: flowLayout)
            }
            
            rootViewController = collectionViewController
        }
        
        return rootViewController
    }
}

// MARK: - Button Action
extension MainNavigationViewController {
    @objc private func pivotViewMode() {
        viewMode = viewMode == .Table ? .Collection : .Table
    }
}
