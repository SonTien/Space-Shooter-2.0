//
//  LoadGameVC.swift
//  SpaceShooter
//
//  Created by Hùng Nguyễn  on 8/2/16.
//  Copyright © 2016 Tien Son. All rights reserved.
//

import UIKit

class LoadGameVC: UIViewController {

    var progressView: UIProgressView?
    var progressLabel: UILabel?
    var loadBackground = UIImageView()
    var circle = UIImageView()
    var radian = CGFloat()
    var loadTime = NSTimer()
    var spinLoad = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBackgrondInterface()
        runLoad()
        circle = UIImageView(image: UIImage(named: "loadingCircle.png"))
        circle.frame = CGRectMake(view.bounds.size.width - 130 , view.bounds.size.height - 130, circle.bounds.size.width / 2.5, circle.bounds.size.height / 2.5)
        spinLoad = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: #selector(LoadGameVC.circleLoad), userInfo: nil, repeats: true)
    }
    
    func loadBackgrondInterface()  {
        //Loading Background
        randomImage()
        loadBackground.frame = CGRectMake(0, 0, view.bounds.size.width, view.bounds.size.height)
        loadBackground.contentMode = .ScaleToFill
        view.addSubview(loadBackground)
        
        // Create Progress View Control
        progressView = UIProgressView(progressViewStyle: UIProgressViewStyle.Default)
        let progressFrame = CGRectMake(view.bounds.origin.x, view.bounds.size.height - 2, 600, 21)
        progressView?.frame = progressFrame
        progressView?.transform = CGAffineTransformScale((progressView?.transform)!, 2.4, 4)
        progressView?.progressTintColor = UIColor.init(red: 246/255, green: 198/255, blue: 103/255, alpha: 1)
        view.addSubview(progressView!)
        
        // Add Label
        progressLabel = UILabel()
        progressLabel?.textColor = UIColor.whiteColor()
        let frame = CGRectMake(view.bounds.size.width - 105 , view.bounds.size.height - 97, 100 ,50 )
        progressLabel?.font = UIFont.boldSystemFontOfSize(30.0)
        progressLabel?.frame = frame
        view.addSubview(progressLabel!)
    }

    func randomImage() {
        let randomLoad = arc4random_uniform(3) + 1
        switch randomLoad {
        case 1:
            loadBackground.image = UIImage(named: "load1.jpg")
        case 2:
            loadBackground.image = UIImage(named: "load2.jpg")
        case 3:
            loadBackground.image = UIImage(named: "load3.png")
        default: break
        }
    }
    
    func circleLoad() {
        let deltaAngle: CGFloat = 0.1
        radian = radian + deltaAngle
        circle.transform = CGAffineTransformMakeRotation(radian)
        view.addSubview(circle)
    }
    
    func runLoad()  {
        if progressView?.progress == 0 {
           loadTime = NSTimer.scheduledTimerWithTimeInterval(0.08, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
        }
    }
    
    func startGame() {
        if progressView?.progress == 1 {
        spinLoad.invalidate()
        loadTime.invalidate()
        let playGame = self.storyboard?.instantiateViewControllerWithIdentifier("MainVC") as! ViewController
        self.navigationController?.pushViewController(playGame, animated: true)
        }
    }
    
    func updateProgress() {
        progressView?.progress += 0.01
        if (progressView?.progress >= 0.8){
            progressView?.progress += 0.1
        }
        let progressValue = self.progressView?.progress
        progressLabel?.text = String(format: "%.f %@",progressValue! * 100, "%")
        startGame()
    }

}
