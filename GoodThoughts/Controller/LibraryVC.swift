//
//  LibraryVC.swift
//  GoodThoughts
//
//  Created by Caine Simpson on 1/15/21.
//

import Foundation
import UIKit
import CoreData


class LibraryVC: UITableViewController {
    
//    Reference to managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var savedQuotes : [SavedQuote]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(LibraryViewCell.self, forCellReuseIdentifier: "Cell")
        fetchSavedQuotes()
    }
    
    func fetchSavedQuotes() {
        do {
            self.savedQuotes = try context.fetch(SavedQuote.fetchRequest()) as? [SavedQuote]
            print(self.savedQuotes)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch {
            print("Error")
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! LibraryViewCell
        
//        cell.textLabel?.text = "\(indexPath.row)"
        cell.authorLabel.text = savedQuotes?[indexPath.row].author
        cell.quotelabel.text = savedQuotes?[indexPath.row].content
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if savedQuotes != nil {
            return savedQuotes!.count
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
//            Handle delete
            let quoteToDelete = self.savedQuotes![indexPath.row]
            
            self.context.delete(quoteToDelete)
            
            try! self.context.save()
            
            self.fetchSavedQuotes()
        }
    }
}
