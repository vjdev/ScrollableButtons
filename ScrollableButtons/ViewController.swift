//
//  ViewController.swift
//  ScrollableButtons
//
//  Created by Vijeesh on 25/06/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollableButtonCollection: ScrollableButtonsView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollableButtonCollection.delegate = self
    }
}


extension ViewController: ScrollableButtonsProtocol {
    var arrayOfButtonNames: [String] {
        return ["one","twdsfusbdfjgbsjdfbgsjdbo","three","one","two","three","one","two","three","one","two","three","one","two","three"]
    }
    
    func didSelectButtonAtIndex(_ index: Int){
        print("Button selected at index", index)
    }
}
