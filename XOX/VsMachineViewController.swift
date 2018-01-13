//
//  VsPlayerViewController.swift
//  XOX
//
//  Created by Sadik Ekin Ozbay on 11/25/17.
//  Copyright © 2017 Sadik Ekin Ozbay. All rights reserved.
//

import UIKit

class VsMachineViewController: UIViewController {
    
    var size: Int = 0
    var boardWidthAndLength = 240
    var boardObj: Board?
    var buttonList : [[UIButton]] = []
    
    @IBAction func closeVC(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @objc func restarter() {
        print("Restarter Started")
        boardObj = Board(given: size)
        buttonList  = []
        createTheBoard()
        print("Restarter Ended")
    }
    
    func checkWinner(_ winner: String){
        if(winner == "b"){
            let alert = UIAlertController(title: "Draw", message: "", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "Restart", style: UIAlertActionStyle.default, handler: {(action: UIAlertAction!) in self.restarter()}))
            
            self.present(alert, animated: true, completion: nil)
        }else if(winner != ""){
            let alert = UIAlertController(title: "Winner is \(String(describing: winner)).", message: "", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "Restart", style: UIAlertActionStyle.default, handler: {(action: UIAlertAction!) in self.restarter()}))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    @objc func buttonAction(_ sender:UIButton!)
    {
        if(sender.titleLabel?.text == nil ){
            
            sender.setTitle("O", for: .normal)
            sender.setTitleColor(.white, for: .normal)
            sender.titleLabel?.font = UIFont (name: "HelveticaNeue", size: 60)
            let i = sender.tag/10, j = sender.tag%10
            var winner = (boardObj?.playerPlayed(row: size-i, column: j-1, playerType: "O"))
            checkWinner(winner ?? "nil")
            winner = boardObj?.playAsBot(buttonList, size-i, j-1)
            checkWinner(winner ?? "nil")
        }
        
    }
    func createTheBoard(){
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        

        for i in 0...(size-1){
            var tempList = [UIButton]()
            for j in 0...(size-1){
                let boardButton = UIButton(type: UIButtonType.system) as UIButton
                boardButton.backgroundColor = UIColor(red: 89/255, green: 139/255, blue: 219/255, alpha: 1)
                boardButton.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
                boardButton.tag = (i+1)*10 + j+1
                tempList.append(boardButton)
            }
            buttonList.append(tempList)
        }
        
        
        let counterLocation = screenWidth/CGFloat(size+1)
        var yLocation: CGFloat = screenHeight - counterLocation - 50
        for i in 0...(size-1){
            var xPosition: CGFloat = counterLocation
            for j in 0...(size-1){
                let button = buttonList[i][j]
                view.addSubview(button)
                
                button.translatesAutoresizingMaskIntoConstraints = false
                button.centerXAnchor.constraint(equalTo: view.leftAnchor, constant: xPosition).isActive = true
                button.centerYAnchor.constraint(equalTo: view.topAnchor, constant: yLocation).isActive = true
                button.widthAnchor.constraint(equalToConstant: CGFloat(boardWidthAndLength/size)).isActive = true
                button.heightAnchor.constraint(equalToConstant: CGFloat(boardWidthAndLength/size)).isActive = true
                xPosition += counterLocation
            }
            yLocation -= counterLocation
        }
        

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("vs Machine")
        boardObj = Board(given: size)
        createTheBoard()
    }
}


