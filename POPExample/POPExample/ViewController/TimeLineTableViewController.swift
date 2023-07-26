//
//  TimeLineTableViewController.swift
//  POPExample
//
//  Created by Hyungmin Lee on 2023/07/26.
//

import UIKit

final class TimeLineTableViewController: UITableViewController, ContainContents, CanShowDetailViewController {
    private let tableViewCellIdentifier = "reuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = timelineTitle
        tableView.register(TimeLineTableViewCell.self, forCellReuseIdentifier: tableViewCellIdentifier)
    }
}

// MARK: - TableView DataSource
extension TimeLineTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfContents
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier, for: indexPath) as? TimeLineTableViewCell else { return UITableViewCell() }
        
        let content = contents[indexPath.row]
        
        cell.content = content
        return cell
    }
}

// MARK: - TableView Delegate
extension TimeLineTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showDetaiViewController(content: contents[indexPath.row])
    }
}
