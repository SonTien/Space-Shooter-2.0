//
//  Blalajljdad.swift
//  SpaceShooter
//
//  Created by HoangHai on 7/12/16.
//  Copyright © 2016 Tien Son. All rights reserved.
//

import UIKit

class Blalajljdad: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var photo: [UIImageView] = []
    var pageImages: [String] = []
    var frontScrollViews: [UIScrollView] = []
    var first = false
    var currentPage = 0
    var newScrollView: [UIScrollView] = []
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageImages = ["tut", "tut2", "tut3"]
        pageControl.currentPage = currentPage
        pageControl.numberOfPages = pageImages.count
        
        
    
    }

    override func viewDidLayoutSubviews() {
        if(!first)
        {
            first = true
            let pageScrollViewSize = scrollView.frame.size
            scrollView.contentSize = CGSizeMake(pageScrollViewSize.width * CGFloat(pageImages.count), 0)
            scrollView.contentOffset = CGPointMake(CGFloat(currentPage) * scrollView.frame.size.width, 0)
            for (var i = 0;i < pageImages.count;i += 1)
            {
               
                let imgView = UIImageView(image: UIImage(named: pageImages[i]+".png"))
                imgView.frame = CGRectMake(0, 0, scrollView.frame.size.width, scrollView.frame.size.height)
                
                imgView.contentMode = .ScaleAspectFit
                
                
                photo.append(imgView)
                
                let frontScollView = UIScrollView(frame: CGRectMake(CGFloat(i) * scrollView.frame.size.width , 0, scrollView.frame.size.width, scrollView.frame.size.height))
                frontScollView.delegate = self
                frontScollView.addSubview(imgView)
                newScrollView.append(frontScollView)
                self.scrollView.addSubview(frontScollView)
                
               
            }
        }
    }
    
    // tap vao pageController thi chuyen imgView
    @IBAction func changePage(sender: UIPageControl) {
        scrollView.contentOffset = CGPointMake(CGFloat(pageControl.currentPage) * scrollView.frame.size.width, 0)
        if pageControl.currentPage  == pageControl.numberOfPages - 1
        {
                let gameMenu = self.storyboard?.instantiateViewControllerWithIdentifier("GameMenu") as! GameMenuVC
                self.navigationController?.pushViewController(gameMenu, animated: true)
            }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView)
    {
        switch scrollView.contentOffset {
        case CGPointMake(0, 0):
            pageControl.currentPage = 0
        case CGPointMake(scrollView.frame.size.width, 0):
            pageControl.currentPage = 1
        case CGPointMake(2 * scrollView.frame.size.width, 0):
            pageControl.currentPage = 2
        default:
            break
        }
    }
    
}
