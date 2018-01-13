//
//  boardModel.swift
//  XOX
//
//  Created by Sadik Ekin Ozbay on 1/12/18.
//  Copyright © 2018 Sadik Ekin Ozbay. All rights reserved.
//

import UIKit

class Board{
    var size: Int
    var board: [[String]]
    init(given input: Int) {
        size = input
        board = []
        for _ in 1...input {
            board.append(Array(repeating: "", count: size))
        }
    }
    
    func checkIfWinnedOrNot() -> String {
        var playerWon = ""
        for i in 0...(size-1) {
            var counterRow = 0
            var counterColumn = 0
            for j in 0...(size-2) {
                if(board[i][j] == board[i][j+1] && board[i][j] != "" && board[i][j+1] != "" ){
                    counterRow += 1
                    playerWon = board[i][j]
                }
                if(board[j][i] == board[j+1][i] && board[j][i] != "" && board[j+1][i] != "" ){
                    counterColumn += 1
                    playerWon = board[j][i]
                }
            }
            if(counterRow == size-1 || counterColumn == size-1){
                return playerWon
            }
        }
        
        var counterDiagonalOne = 0, counterDiagonalTwo = 0
        for i in 0...(size-2){
            if(board[i][i] == board[i+1][i+1] && board[i][i] != "" && board[i+1][i+1] != ""){
                counterDiagonalOne += 1
                playerWon = board[i][i]
            }
        }
        if(counterDiagonalOne == size-1){
            return playerWon
        }
        
        for i in 0...(size-2){
            if(board[i][size-i-1] == board[i+1][size-i-2] && board[i][size-i-1] != "" && board[i+1][size-i-2] != ""){
                counterDiagonalTwo += 1
                playerWon = board[i][size-i-1]
            }
        }
        
        if(counterDiagonalTwo == size-1){
            return playerWon
        }

        
        var tieCounter = 0
        for i in 0...size-1{
            for j in 0...size-1{
                if(board[i][j] != ""){
                    tieCounter += 1
                }
            }
        }
        if(tieCounter == size*size){
            return "b"
        }
        playerWon = ""
        return playerWon
    }
    
    
    
    func setButtonTitleAsX(_ sender: UIButton,_ i: Int,_ j: Int){
        sender.setTitle("X", for: .normal)
        sender.setTitleColor(.white, for: .normal)
        sender.titleLabel?.font = UIFont (name: "HelveticaNeue", size: 60)
        board[i][j] = "X"
    }
    
    
    func checkWinnerMove() -> (Int,Int) {
        var returnValue = (-1,-1)
        for i in 0...(size-1) {
            var counterRow = 0
            for j in 0...(size-1) {
                if(board[i][j] == "X"){
                    counterRow += 1
                }else{
                    returnValue = (i,j)
                }
            }
            print("counterRow: \(counterRow)")
            if(counterRow == size-1 && board[returnValue.0][returnValue.1] == ""){
                return returnValue
            }
        }
        for i in 0...(size-1) {
            var counterColumn = 0
            for j in 0...(size-1) {
                if(board[j][i] == "X"){
                    counterColumn += 1
                }else{
                    returnValue = (j,i)
                }
            }
            print("counterColumn: \(counterColumn)")
            if(counterColumn == size-1 && board[returnValue.0][returnValue.1] == ""){
                return returnValue
            }
        }
        
        
        
        var counterDiagonalOne = 0, counterDiagonalTwo = 0
        for i in 0...(size-1){
            if(board[i][i] == "X"){
                counterDiagonalOne += 1
            }else{
                returnValue = (i,i)
            }
        }
        print("counterDiagonalOne: \(counterDiagonalOne)")
        if(counterDiagonalOne == size-1 && board[returnValue.0][returnValue.1] == ""){
            return returnValue
        }
        
        for i in 0...(size-1){
            if(board[i][size-i-1] == "X"){
                counterDiagonalTwo += 1
            }else{
                returnValue = (i, size-i-1)
            }
        }
        print("counterDiagonalTwo: \(counterDiagonalTwo)")
        
        if(counterDiagonalTwo == size-1 && board[returnValue.0][returnValue.1] == ""){
            return returnValue
        }
        
        return (-1,-1)
    }
    func checkForNminusOneStones() -> (Int,Int) {
        var returnValue = (-1,-1)
        for i in 0...(size-1) {
            var counterRow = 0
            for j in 0...(size-1) {
                if(board[i][j] == "O"){
                    counterRow += 1
                }else{
                  returnValue = (i,j)
                }
            }
            print("counterRow: \(counterRow)")
            if(counterRow == size-1 && board[returnValue.0][returnValue.1] == ""){
                return returnValue
            }
        }
        for i in 0...(size-1) {
            var counterColumn = 0
            for j in 0...(size-1) {
                if(board[j][i] == "O"){
                    counterColumn += 1
                }else{
                    returnValue = (j,i)
                }
            }
            print("counterColumn: \(counterColumn)")
            if(counterColumn == size-1 && board[returnValue.0][returnValue.1] == ""){
                return returnValue
            }
        }
        
        
        
        var counterDiagonalOne = 0, counterDiagonalTwo = 0
        for i in 0...(size-1){
            if(board[i][i] == "O"){
                counterDiagonalOne += 1
            }else{
                returnValue = (i,i)
            }
        }
        print("counterDiagonalOne: \(counterDiagonalOne)")
        if(counterDiagonalOne == size-1 && board[returnValue.0][returnValue.1] == ""){
            return returnValue
        }
        
        for i in 0...(size-1){
            if(board[i][size-i-1] == "O"){
                counterDiagonalTwo += 1
            }else{
                returnValue = (i, size-i-1)
            }
        }
        print("counterDiagonalTwo: \(counterDiagonalTwo)")

        if(counterDiagonalTwo == size-1 && board[returnValue.0][returnValue.1] == ""){
            return returnValue
        }
        
        return (-1,-1)
    }
    func tryToMakeItTwo() -> (Int,Int) {
        var returnValue = (-1,-1)
        var boardWithOs = [[String]](repeating: [String](repeating: "O", count: size+2), count: size+2)
        for i in 1...size{
            for j in 1...size{
                boardWithOs[i][j] = board[i-1][j-1]
            }
        }
        for i in 1...size{
            for j in 1...size{
                if(boardWithOs[i][j] == "X"){
                    if(boardWithOs[i-1][j-1] == ""){
                        returnValue = (i-1,j-1)
                    }else if(boardWithOs[i][j-1] == ""){
                        returnValue = (i,j-1)
                    }else if(boardWithOs[i+1][j-1] == ""){
                        returnValue = (i+1,j-1)
                    }else if(boardWithOs[i-1][j] == ""){
                        returnValue = (i-1,j)
                    }else if(boardWithOs[i+1][j] == ""){
                        returnValue = (i+1,j)
                    }else if(boardWithOs[i-1][j+1] == ""){
                        returnValue = (i-1,j+1)
                    }else if(boardWithOs[i][j+1] == ""){
                        returnValue = (i,j+1)
                    }else if(boardWithOs[i+1][j+1] == ""){
                        returnValue = (i+1,j+1)
                    }
                }
            }
        }
        return returnValue
    }
    func playAsBot(_ buttonListInput: [[UIButton]],_ iInput: Int,_ jInput: Int) -> String{
        var buttonList : [[UIButton]] = []
        for i in 0...size-1{
            buttonList.append(buttonListInput[size-1-i])
        }
        let winnerMove = checkWinnerMove()
        let minusOneStones = checkForNminusOneStones()
        let MakeItTwo = tryToMakeItTwo()
        
        if(winnerMove.0 != -1 && winnerMove.1 != -1){
            print("Winner Move")
            setButtonTitleAsX(buttonList[winnerMove.0][winnerMove.1], winnerMove.0, winnerMove.1)
        }else if(minusOneStones.0 != -1 && minusOneStones.1 != -1){ // if somebody has n-1 stones on board accordingly
            print("Blocked Two Values")
            setButtonTitleAsX(buttonList[minusOneStones.0][minusOneStones.1], minusOneStones.0, minusOneStones.1)
        }else if(MakeItTwo.0 != -1 && MakeItTwo.1 != -1){  //  make your stones 2 accordingly
            print("Tried to make 2 value")
            setButtonTitleAsX(buttonList[MakeItTwo.0-1][MakeItTwo.1-1], MakeItTwo.0-1, MakeItTwo.1-1)
        }else if(board[size/2][size/2] == ""){ // If mid is empty
            print("Mid")
            setButtonTitleAsX(buttonList[size/2][size/2], size/2, size/2)
        }else if(iInput == 0 && jInput == size-1 && board[size-1][0] == ""){ // If player played on corners
            setButtonTitleAsX(buttonList[size-1][0], size-1, 0)
        }else if(iInput == 0 && jInput == 0 && board[size-1][size-1] == ""){
            setButtonTitleAsX(buttonList[size-1][size-1], size-1, size-1)
        }else if(iInput == size-1 && jInput == 0 && board[0][size-1] == ""){
            setButtonTitleAsX(buttonList[0][size-1], 0, size-1)
        }else if(iInput == size-1 && jInput == size-1 && board[0][0] == ""){
            setButtonTitleAsX(buttonList[0][0], 0, 0)
        }else if(board[0][size-1] == ""){ // If corners are open
            setButtonTitleAsX(buttonList[0][size-1], 0, size-1)
        }else if(board[0][0] == ""){
            setButtonTitleAsX(buttonList[0][0], 0, 0)
        }else if(board[size-1][0] == ""){
            setButtonTitleAsX(buttonList[size-1][0], size-1, 0)
        }else if(board[size-1][size-1] == ""){
            setButtonTitleAsX(buttonList[size-1][size-1], size-1, size-1)
        }else{
            // Place randomly
            var iRand = Int(arc4random_uniform(UInt32(size)))
            var jRand = Int(arc4random_uniform(UInt32(size)))
            while board[iRand][jRand] != "" {
                iRand = Int(arc4random_uniform(UInt32(size)))
                jRand = Int(arc4random_uniform(UInt32(size)))
            }
            setButtonTitleAsX(buttonList[iRand][jRand], iRand, jRand)
            
        }

        
        
        //        for i in 0...size-1{
        //            for j in 0...size-1{
        //                print(board[i][j])
        //            }
        //        }
        //        print("  ")
        //        print("  ")
        
        let winner = checkIfWinnedOrNot()
        return winner
    }
    
    func playerPlayed(row: Int, column: Int, playerType: String) -> String{
        board[row][column] = playerType
        print(" ")
        print(" ")
        let winner = checkIfWinnedOrNot()
        return winner
    }
}
