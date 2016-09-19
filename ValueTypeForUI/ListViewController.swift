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
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.rowHeight = 100.0
        tableView.register(DecoratingCell.self, forCellReuseIdentifier: DecoratingCell.description())
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
        fullScreenLayout.layout(in: view.bounds)
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DecoratingCell.description(), for: indexPath) as? DecoratingCell else {
            fatalError("Cell type is wrong")
        }
        
        return cell
    }
}
