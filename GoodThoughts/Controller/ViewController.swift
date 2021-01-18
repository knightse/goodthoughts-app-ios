//
//  ViewController.swift
//  GoodThoughts
//
//  Created by Caine Simpson on 1/2/21.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let mainView = MainView()
    var quotes: [Quote]?
    var displayedQuote: Quote?
    var isCurrentQuoteLiked = false
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        print("View did laod")
        super.viewDidLoad()
        
//        Get persistent storage
        // Do any additional setup after loading the view.
        getQuotes()
        mainView.randomButton.addTarget(self, action: #selector(self.randomButtonPressed(sender:)), for: .touchUpInside)
        mainView.heartButton.addTarget(self, action: #selector(self.saveQuoteButtonPressed(sender:)), for: .touchUpInside)
        mainView.shareButton.addTarget(self, action: #selector(self.shareButtonPressed(sender:)), for: .touchUpInside)
        mainView.libraryButton.addTarget(self, action: #selector(self.libraryButtonPressed(sender:)), for: .touchUpInside)
        
        var savedQuote = Quote()
        savedQuote.text = "This is a saved quote"
        savedQuote.author = "This is the saved quote author"
    }

}
