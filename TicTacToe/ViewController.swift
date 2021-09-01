//
//  ViewController.swift
//  TicTacToe
//
//  Created by Irene Truchado Mazzoli on 01/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    var player1: Bool = true // X
    var player2: Bool = false // 0
    var boxes: [Bool] = [true,true,true,true,true,true,true,true,true]

    @IBAction func putX(_ buttonImg: UIButton) {
        if boxes[buttonImg.tag-1] {
            if player1 {
                buttonImg.setImage(UIImage(named: "img-X"), for: UIControl.State())

            } else if player2 {
                buttonImg.setImage(UIImage(named: "img-0"), for: UIControl.State())
            }
            player1 = !player1
            player2 = !player2
            boxes[buttonImg.tag-1] = false
            checkWinner()
        }
    }
    override func viewDidLoad() { super.viewDidLoad() }
    
    func checkWinner() -> Bool {
        return true
    }

    @IBAction func restartGame(_ buttonImg: UIButton) {
        player1 = true // X
        player2 = false // 0
        boxes = [true,true,true,true,true,true,true,true,true]
        
        buttonImg.setImage(nil, for: UIControl.State())
    }
}

