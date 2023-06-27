//
//  ViewController.swift
//  network-test
//
//  Created by Jun on 2023/06/22.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var networkButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func networkButtonTapped(_ sender: UIButton) {
        APIClient.postArticle(title: "타이틀!", body: "바디!", userId: 1) { result in
            switch(result){
            case .success(let post):
                print(post)
            case .failure(let error):
                print(error)
            }
        }
    }
    

}

