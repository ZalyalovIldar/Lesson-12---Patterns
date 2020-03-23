//
//  SearchTableView.swift
//  PatternsLesson
//
//  Created by Amir on 22.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit

class SearchTableView: UIView {
   
    private var tableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        initTable()
    }
    
    func setData(source: UITableViewDataSource) {
        tableView.dataSource = source
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func initTable() {
        
        tableView = UITableView().enableConstraints()
        tableView.register(cell: ResultCell.self)
        
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }    
}
