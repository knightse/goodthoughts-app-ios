//
//  ViewController+Extensions.swift
//  GoodThoughts
//
//  Created by Caine Simpson on 1/15/21.
//

import Foundation
import UIKit

extension ViewController {
    
    func getQuotes() {
        NetworkManager().fetchQuotes() { [weak self] (quotes) in
            self?.quotes = quotes
            DispatchQueue.main.async {
//                1643 quotes
                let quote = self?.getRandomQuote(quotes: quotes)
                self?.displayedQuote = quote
                self?.mainView.quoteLabel.text = quote?.text
                self?.mainView.authorLabel.text = quote?.author
                self?.handleTime()
            }
        }
    }
    
    func getRandomQuote(quotes: [Quote]) -> Quote {
        let randomNumber = Int.random(in: 0...quotes.count)
        let quote = quotes[randomNumber]
        
        return quote
    }
    
    func handleTime() {
        let hour = Calendar.current.component(.hour, from: Date())
        
        switch hour {
        case 6..<12:
            print("Morning")
            self.mainView.titleLabel.text = "Good Morning"
        case 12:
            print("Noon")
            self.mainView.titleLabel.text = "Good Afternoon"
//            1(13),2(14),3(15),4(16),5(17)
        case 13..<17:
            print("Afternoon")
            self.mainView.titleLabel.text = "Good Afternoon"
//            6(18),7(19),8(20)
        case 17..<20:
            print("Evening")
            self.mainView.titleLabel.text = "Good Evening"
        default:
            self.mainView.titleLabel.text = "Good Night"
            print("night")
        }
    }
    @objc func randomButtonPressed(sender:UIButton) {
        self.animateView(sender)
//        selectNewQuote()
        let newQuote = getRandomQuote(quotes: quotes!)
        displayedQuote = newQuote
        isCurrentQuoteLiked = true
        self.animateHeartButton(self.mainView.heartButton)
        self.mainView.quoteLabel.text = newQuote.text
        self.mainView.authorLabel.text = newQuote.author
        
        animateTextChange()
    }
    
    @objc func saveQuoteButtonPressed(sender: UIButton) {
        var quote = Quote()
        quote.author = displayedQuote?.author
        quote.text = displayedQuote?.text
        self.animateHeartButton(sender)
        saveQuote(quoteToSave: quote)
    }
    
    
    @objc func shareButtonPressed(sender: UIButton) {
        print("Share button pressed")
        print("Attaching quote : \(displayedQuote?.author) : \(displayedQuote?.text)")
        let quoteToShare = displayedQuote
        shareQuote(quote: quoteToShare!)
    }
    
    @objc func libraryButtonPressed(sender: UIButton) {
        moveToLibrary()
    }
    
    func moveToLibrary() {
        let libraryVC = LibraryVC()
        self.present(libraryVC, animated: true, completion: nil)
    }
    
    func saveQuote(quoteToSave: Quote) {
//        NSMANAGED PERSON OBJECT
        print("saving")
        let savedQuote = SavedQuote(context: self.context)
        
//        Adding data
        savedQuote.author = quoteToSave.author
        savedQuote.content = quoteToSave.text
        
//        Saving Data
        
        do {
            try self.context.save()
        } catch {
            print(error)
        }
    
    }
    
    func shareQuote(quote: Quote) {
        let text = """
        \(quote.text)

            \(quote.author)
    """
        let shareText = [text]
        let shareQuote = quote.text!
        let shareAuthor = quote.author!
        let activityViewController = UIActivityViewController(activityItems: [shareQuote, shareAuthor], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        self.present(activityViewController, animated: true, completion: nil)
    }
    
//    ANIMATIONS
    
    func animateTextChange() {
        self.mainView.authorLabel.fadeTransition(0.4)
        self.mainView.quoteLabel.fadeTransition(0.4)
    }
    
    fileprivate func animateView(_ viewToAnimate: UIView) {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn) {
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        } completion: { (_) in
            UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2, options: .curveEaseIn) {
                viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
            } completion: { (_) in
                print("ease out")
            }
        }
    }
    
    fileprivate func animateHeartButton(_ viewToAnimate: UIButton) {
        let unfilledHeart = UIImage(systemName: "heart")
        let filledHeart = UIImage(systemName: "heart.fill")
        
        UIView.animate(withDuration: 0.1) {
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            if (!self.isCurrentQuoteLiked) {
                self.isCurrentQuoteLiked = !self.isCurrentQuoteLiked
            viewToAnimate.setImage(filledHeart, for: .normal)
            } else {
                self.isCurrentQuoteLiked = !self.isCurrentQuoteLiked
                viewToAnimate.setImage(unfilledHeart, for: .normal)
            }
        } completion: { (_) in
            UIView.animate(withDuration: 0.1) {
                viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        }
        viewToAnimate.imageView?.contentMode = .scaleAspectFill
    }
    
//    fileprivate func unfillHeart
}
