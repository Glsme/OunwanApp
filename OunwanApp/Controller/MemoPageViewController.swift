//
//  MemoPageViewController.swift
//  OunwanApp
//
//  Created by Seokjune Hong on 2022/06/02.
//

import UIKit

class MemoPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var completeHandler: ((Int) -> ())?
    
    let viewList: [UIViewController] = {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let calenderVC = storyBoard.instantiateViewController(withIdentifier: "calenderVC")
        let exerciseMemoVC = storyBoard.instantiateViewController(withIdentifier: "exerciseMemoVC")
        let mealMemoVC = storyBoard.instantiateViewController(withIdentifier: "mealMemoVC")
        
        return[calenderVC, exerciseMemoVC, mealMemoVC]
    }()
    
    var currentIndex: Int {
        guard let vc = viewControllers?.first else {return 0}
        return viewList.firstIndex(of: vc) ?? 0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        
        if let firstVC = viewList.first {
            self.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func setViewControllersFromIndex(index: Int) {
        if index < 0 && index >= viewList.count {return}
        self.setViewControllers([viewList[index]], direction: .forward, animated: true, completion: nil)
        completeHandler?(currentIndex)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            completeHandler?(currentIndex)
        }
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = viewList.firstIndex(of: viewController) else {return nil}
        let previousIndex = index - 1
        if previousIndex < 0 {return nil}
        return viewList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = viewList.firstIndex(of: viewController) else {return nil}
        
        let nextIndex = index + 1
        if nextIndex == viewList.count {return nil}
        return viewList[nextIndex]
    }

}
