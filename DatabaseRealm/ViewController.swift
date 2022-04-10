//
//  ViewController.swift
//  DatabaseRealm
//
//  Created by 酒井桃恵 on 2022/04/10.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITextFieldDelegate {
    
    let realm = try! Realm()
    
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var cotentTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        titleTextField.delegate = self
        cotentTextField.delegate = self
        
        let memo: Memo? = read()
        
        if memo != nil {
            titleTextField.text = memo?.title
            cotentTextField.text = memo?.content
        }
        
        //debug
        contentLabel.text = memo?.title
        
        
    }

    func read() -> Memo?{
        return realm.objects(Memo.self).first
    }
    
    @IBAction func save() {
        let title: String = titleTextField.text!
        let content: String = cotentTextField.text!
        
        let memo: Memo? = read()
        
        if memo != nil{
            try! realm.write {
                memo!.title = title
                memo!.content = content
            }
        }else {
            let newMemo = Memo()
            newMemo.title = title
            newMemo.content = content
            
            try! realm.write {
                realm.add(newMemo)
            }
        }
        
        let alert: UIAlertController = UIAlertController(title: "成功", message: "保存しました", preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(title: "OK", style: .default, handler: nil)
        )
        
        present(alert,animated: true, completion: nil)
        
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
}

