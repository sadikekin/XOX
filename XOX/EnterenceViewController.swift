//
//  ViewController.swift
//  XOX
//
//  Created by Sadik Ekin Ozbay on 11/25/17.
//  Copyright © 2017 Sadik Ekin Ozbay. All rights reserved.
//

import UIKit

class EnterenceViewController: UIViewController {

    @IBOutlet weak var vsMachine: UIButton!
    @IBOutlet weak var vsPlayer: UIButton!
    @IBOutlet weak var boardSize: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vsMachine.layer.cornerRadius = 10
        vsPlayer.layer.cornerRadius = 10
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let givenSize = boardSize.selectedSegmentIndex+3
        if segue.identifier == "vsPlayerSegue"{
            if let destinationVC = segue.destination as? VsPlayerViewController {
                destinationVC.size = givenSize
            }
        }
        if segue.identifier == "vsMachine"{
            if let destinationVC = segue.destination as? VsMachineViewController {
                destinationVC.size = givenSize
            }
        }
    }
}

