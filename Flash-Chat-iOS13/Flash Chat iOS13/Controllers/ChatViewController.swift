//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore()
    
    var messages: [Message] = [
    Message(sender: "1@2.com", body: "Hey!"),
    Message(sender: "1@2.com", body: "How are you?"),
    Message(sender: "1@2.com", body: "Buy")
    ]
    
    private lazy var rightButton = UIBarButtonItem(
        title: "Log Out",
        style: .plain,
        target: self,
        action: #selector(welcomeButtonAction)
    )
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.allowsSelection = false
        tableView.dataSource = self
        tableView.register(
            UINib(
                nibName: K.cellNibName,
                bundle: nil
            ),
            forCellReuseIdentifier: K.cellIdentifier
        )
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 18, weight: .bold),
                    .foregroundColor: UIColor.black
                ]
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "BrandPurple")
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationItem.hidesBackButton = true
        rightButton.setTitleTextAttributes(attributes, for: .normal)
        navigationItem.leftBarButtonItem = rightButton
        loadData()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 18, weight: .bold),
                    .foregroundColor: UIColor.black // Цвет текста
                ]
        
        navigationController?.navigationBar.titleTextAttributes = attributes
        title = K.appName
    }
    
    
    @IBAction func sendPressed(_ sender: UIButton) {
        guard let messageBody = messageTextfield.text,
              let messageSender = Auth.auth().currentUser?.email else { return }
        db.collection(K.FStore.collectionName).addDocument(
            data: [
                K.FStore.senderField: messageSender,
                K.FStore.bodyField: messageBody,
                K.FStore.dateField: Date().timeIntervalSince1970
            ]) { error in
                guard let error else { print("Data saved"); return }
                print(error.localizedDescription)
            }
        messageTextfield.text = ""
    }
    
    @objc
    private func welcomeButtonAction() {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
    
    func loadData() {
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener { querySnapshot, error in
                self.messages = []
                if let error {
                    print("There was an issue retrivering data from Firestore. \(error)")
                } else {
                    if let snapshotDocuments = querySnapshot?.documents {
                        for doc in snapshotDocuments {
                            let data = doc.data()
                            if let sender = data[K.FStore.senderField] as? String,
                               let message = data[K.FStore.bodyField] as? String {
                                let message = Message(sender: sender, body: message)
                                self.messages.append(message)
                                
                                DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                    let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                    self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                                }
                            }
                            
                        }
                    }
                }
        }
    }
    

}

    extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.label.text = message.body
        
        if message.sender == Auth.auth().currentUser?.email {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightPurple )
            cell.label.textColor = UIColor(named: K.BrandColors.purple)
        } else {
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.purple )
            cell.label.textColor = UIColor(named: K.BrandColors.lightPurple)

        }
        return cell
    }
    
    
}

