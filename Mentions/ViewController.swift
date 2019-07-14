//
//  ViewController.swift
//  Mentions
//
//  Created by Rohit Saini on 13/07/19.
//  Copyright © 2019 Rohit Saini. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextViewDelegate,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var mentionsTextView: UITextView!
    private var mentionArr: [Mention] = [Mention(name: "Rohit", id: "1"),Mention(name: "Sonu", id: "2"),Mention(name: "Vikas", id: "3"),Mention(name: "Anish", id: "4"),Mention(name: "Shivam", id: "5"),Mention(name: "Sheetal", id: "6"),Mention(name: "Krrish", id: "7")]
    
    private var mentionedWord: String = "something."
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        tableView.register(UINib(nibName: "mentionCell", bundle: nil), forCellReuseIdentifier: "mentionCell")
        
        
        // Do any additional setup after loading the view.
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if let splitText = textView.text?.split(separator: " ") {
            for word in splitText {
                if word.hasPrefix("#") {
                    print(word)
                    mentionedWord = String(word)
                    print("API CALLED")
                    tableView.isHidden = false// call whatever function you need here
                }
                else{
                    tableView.isHidden = true
                }
            }
        }
        
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
    }
    
    
    //MARK:- TABLE VIEW DELEGATE AND DATASOURCE
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mentionArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "mentionCell", for: indexPath) as? mentionCell else{
            return UITableViewCell()
        }
        cell.mentionNameLbl.text = mentionArr[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let modifiedText = mentionsTextView.text.replacingOccurrences(of: mentionedWord, with: mentionArr[indexPath.row].name)
        mentionsTextView.text = modifiedText
        print(mentionArr[indexPath.row].name)
    }
    

}


