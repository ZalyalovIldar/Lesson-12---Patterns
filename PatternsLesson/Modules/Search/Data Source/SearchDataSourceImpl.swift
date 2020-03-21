//
//  SearchDataSourceImpl.swift
//  PatternsLesson
//
//  Created by Enoxus on 19/03/2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation
import UIKit

class SearchDataSourceImpl: NSObject, SearchDataSource {
    
    var places: [PlaceModel] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ResultTableViewCell.nibName, for: indexPath) as! ResultTableViewCell
        
        cell.configure(with: places[indexPath.row])
        
        return cell
    }
}
