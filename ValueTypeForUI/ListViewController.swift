//
//  ListViewController.swift
//  ValueTypeForUI
//
//  Created by ShengHua Wu on 8/26/16.
//  Copyright © 2016 ShengHua Wu. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    // MARK: - Lazy Initializations
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .Plain)
        tableView.registerClass(DecoratingCell.self, forCellReuseIdentifier: DecoratingCell.description())
        tableView.dataSource = self
        return tableView
    }()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "List"
        
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        var fullScreenLayout = FullScreenLayout(content: tableView)
        fullScreenLayout.layoutIn(view.bounds)
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier(DecoratingCell.description(), forIndexPath: indexPath) as? DecoratingCell else {
            fatalError("Cell type is wrong")
        }
        
        return cell
    }
}
