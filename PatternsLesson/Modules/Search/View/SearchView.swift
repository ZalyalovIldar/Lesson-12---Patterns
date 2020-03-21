//
//  SearchView.swift
//  PatternsLesson
//
//  Created by Enoxus on 19/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit
import SnapKit

class SearchView: UIView {
    
    /// appearance-related constants
    private class Appearance {
        
        static let rowHeight: CGFloat = 182
        
        static let tableViewLeftOffset = 0
        static let tableViewRightOffset = 0
        static let tableViewTopOffset = 16
        static let tableViewBottomOffset = 0
        
        static let messageLabelTopOffset = 125
        static let messageLabelLeftOffset = 16
        static let messageLabelRightOffset = -16
        
        static let searchViewHeight = 45
        static let searchViewWidth = 350
        
        static let messageLabelLineNumber = 0
        
        static let exitButtonTitle = "Logout"
    }
    
    /// view delegate
    weak var delegate: SearchViewDelegate?

    lazy var tableView: UITableView = {
        
        var table = UITableView()
        table.rowHeight = Appearance.rowHeight
        table.register(cell: ResultTableViewCell.self)
        
        return table
    }()
    
    lazy var messageLabel: UILabel = {
        
        var label = UILabel()
        label.numberOfLines = Appearance.messageLabelLineNumber
        label.textAlignment = .center
        label.textColor = .gray
        
        return label
    }()
    
    lazy var indicator: UIActivityIndicatorView = {
        
        var indicator = UIActivityIndicatorView()
        indicator.startAnimating()
        indicator.style = .large
        
        return indicator
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        backgroundColor = .white
    }
    
    func displayTableView() {
        
        deleteAllSubviews()
        addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            
            make.left.equalToSuperview().offset(Appearance.tableViewLeftOffset)
            make.right.equalToSuperview().offset(Appearance.tableViewRightOffset)
            make.top.equalToSuperview().offset(Appearance.tableViewTopOffset)
            make.bottom.equalToSuperview().offset(Appearance.tableViewBottomOffset)
        }
    }
    
    func displayLoadingView() {
        
        deleteAllSubviews()
        addSubview(indicator)
        
        indicator.snp.makeConstraints { make in
            
            make.center.equalToSuperview()
        }
    }
    
    func displayMessage(_ msg: String) {
        
        deleteAllSubviews()
        addSubview(messageLabel)
        
        messageLabel.text = msg
        
        messageLabel.snp.makeConstraints { make in
            
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(Appearance.messageLabelTopOffset)
            make.left.equalToSuperview().offset(Appearance.messageLabelLeftOffset)
            make.right.equalToSuperview().offset(Appearance.messageLabelRightOffset)
        }
    }
    
    private func deleteAllSubviews() {
        subviews.forEach({ $0.removeFromSuperview() })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
