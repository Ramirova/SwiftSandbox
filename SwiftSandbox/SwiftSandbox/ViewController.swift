//
//  ViewController.swift
//  SwiftSandbox
//
//  Created by r.r.amirova on 13.10.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        demonstrate()
    }


    func demonstrate() {
        let demos: [Provable] = [EntitiesDemo(), StandardProtocols()]

        for demo in demos {
            demo.demonstrate()
        }
    }
}

