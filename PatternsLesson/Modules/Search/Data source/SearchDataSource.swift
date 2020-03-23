//
//  SearchDataSource.swift
//  PatternsLesson
//
//  Created by Amir on 23.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit

protocol SearchDataSourceProtocol: AnyObject, UITableViewDataSource {
    
    /// places array
    var placesArray: [Place] { get set }
}

class SearchDataSource: NSObject, SearchDataSourceProtocol {
    
    var placesArray = [Place]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ResultCell.identifier, for: indexPath) as! ResultCell
        
        cell.configure(with: placesArray[indexPath.row])
        
        return cell
    }
}
