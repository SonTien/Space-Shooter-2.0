//
//  GameMenuVC.swift
//  SpaceShooter
//
//  Created by Hùng Nguyễn  on 8/1/16.
//  Copyright © 2016 Tien Son. All rights reserved.
//

import UIKit

class GameMenuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func newGame(sender: UIButton) {
        let loadGame = self.storyboard?.instantiateViewControllerWithIdentifier("LoadGame") as! LoadGameVC
        self.navigationController?.pushViewController(loadGame, animated: true)
        
    }
    
    @IBAction func continueGame(sender: UIButton) {
        print("Game continue")
        let playGame = self.storyboard?.instantiateViewControllerWithIdentifier("MainVC") as! ViewController
        self.navigationController?.pushViewController(playGame, animated: true)

    }
    
    @IBAction func optionsGame(sender: UIButton) {
        print("Setting Game")
        let settingGame = self.storyboard?.instantiateViewControllerWithIdentifier("Setting")
         as! SettingVC
        self.navigationController?.pushViewController(settingGame, animated: true)
        
    }
    
    @IBAction func exitGame(sender: UIButton)
    {
        print("Exit Game")
        let gameMenu = self.storyboard?.instantiateViewControllerWithIdentifier("GameMenu") as! GameMenuVC
        self.navigationController?.pushViewController(gameMenu, animated: true)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
