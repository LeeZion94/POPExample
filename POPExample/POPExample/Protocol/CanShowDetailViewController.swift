//
//  CanShowDetailViewController.swift
//  POPExample
//
//  Created by Hyungmin Lee on 2023/07/26.
//

import UIKit

protocol CanShowDetailViewController {
    func showDetaiViewController(content: Content)
    var navigationController: UINavigationController? { get }
}

extension CanShowDetailViewController {
    func showDetaiViewController(content: Content) {
        let detailViewController = DetailViewController()
        
        detailViewController.content = content
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
