//
//  ViewController.swift
//  TicTacToe
//
//  Created by Irene Truchado Mazzoli on 01/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    var player1 : Bool = true // X
    var player2 : Bool = false // 0

    var movesCount : Int = 0 // counts the number of moves in the game
    
    @IBOutlet weak var box1: UIButton!
    @IBOutlet weak var box2: UIButton!
    @IBOutlet weak var box3: UIButton!
    @IBOutlet weak var box4: UIButton!
    @IBOutlet weak var box5: UIButton!
    @IBOutlet weak var box6: UIButton!
    @IBOutlet weak var box7: UIButton!
    @IBOutlet weak var box8: UIButton!
    @IBOutlet weak var box9: UIButton!

    @IBOutlet weak var arrowPlayer1: UIImageView!
    @IBOutlet weak var arrowPlayer2: UIImageView!
        
    override func viewDidLoad() { super.viewDidLoad() }
    
    @IBAction func markBox(_ buttonImg: UIButton) {
        if buttonImg.currentImage == nil  {
            if player1 {
                buttonImg.setImage(UIImage(named: "img-X"), for: UIControl.State())
                arrowPlayer1.isHidden = true
                arrowPlayer2.isHidden = false
            } else if player2 {
                buttonImg.setImage(UIImage(named: "img-0"), for: UIControl.State())
                arrowPlayer1.isHidden = false
                arrowPlayer2.isHidden = true
            }
            player1 = !player1
            player2 = !player2
            checkWinner()
            movesCount += 1
        }
        if movesCount > 8 {
            Tie()
        }
    }

    func checkWinner() {
        if (box1.currentImage, box2.currentImage) == ( box2.currentImage, box3.currentImage) && box1.currentImage != nil { sendWinner(box1,box2,box3)
        } else if (box4.currentImage, box5.currentImage) == ( box5.currentImage, box6.currentImage) && box4.currentImage != nil { sendWinner(box4,box5,box6)
        } else if (box7.currentImage, box8.currentImage) == ( box8.currentImage, box9.currentImage) && box7.currentImage != nil { sendWinner(box7,box8,box9)
        } else if (box1.currentImage, box4.currentImage) == ( box4.currentImage, box7.currentImage) && box1.currentImage != nil { sendWinner(box1,box4,box7)
        } else if (box2.currentImage, box5.currentImage) == ( box5.currentImage, box8.currentImage) && box2.currentImage != nil { sendWinner(box2,box5,box8)
        } else if (box3.currentImage, box6.currentImage) == ( box6.currentImage, box9.currentImage) && box3.currentImage != nil { sendWinner(box3,box6,box9)
        } else if (box1.currentImage, box5.currentImage) == ( box5.currentImage, box9.currentImage) && box1.currentImage != nil { sendWinner(box1,box5,box9)
        } else if (box3.currentImage, box5.currentImage) == ( box5.currentImage, box7.currentImage) && box3.currentImage != nil { sendWinner(box3,box5,box7)
        }
    }

    func sendWinner(_ w1: UIButton, _ w2: UIButton, _ w3: UIButton) {
        // hides the turn arrow
        arrowPlayer1.isHidden = true
        arrowPlayer2.isHidden = true

        // shows message indicating the winner
        var msgWinner : String = ""
        if player1 { msgWinner = "Player 2 won the game" } else { msgWinner = "Player 1 won the game" }
        // shows message indicating the tie
        showAlert("Winner 🏆", msgWinner)
    }
    
    func Tie() {
        // hides the turn arrow
        arrowPlayer1.isHidden = true
        arrowPlayer2.isHidden = true

        // shows message indicating the tie
        showAlert("Tie", "Nobody won")
    }
    
    func showAlert(_ titleAlert: String, _ msgAlert: String) {
        let alert = UIAlertController(title: titleAlert, message: msgAlert, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Play again", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction!) in self.resetBoard()}))
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func restartGame(_ buttonImg: UIButton) {
        resetBoard()
    }
    
    func resetBoard() {
        player1 = true // X
        player2 = false // 0
        
        movesCount = 0

        box1.setImage(nil, for: UIControl.State())
        box2.setImage(nil, for: UIControl.State())
        box3.setImage(nil, for: UIControl.State())
        box4.setImage(nil, for: UIControl.State())
        box5.setImage(nil, for: UIControl.State())
        box6.setImage(nil, for: UIControl.State())
        box7.setImage(nil, for: UIControl.State())
        box8.setImage(nil, for: UIControl.State())
        box9.setImage(nil, for: UIControl.State())
        
        arrowPlayer1.isHidden = false
        arrowPlayer2.isHidden = true
    }
}
