//
//  MemoViewController.swift
//  OunwanApp
//
//  Created by Seokjune Hong on 2022/05/26.
//

import UIKit

class MemoViewController: UIViewController {
    
    @IBOutlet weak var calenderButton: UIButton!
    @IBOutlet weak var exerciseButton: UIButton!
    @IBOutlet weak var mealButton: UIButton!
    
    var buttonList: [UIButton] = []
    
    var currentIndex: Int = 0 {
        didSet {
            changeButtonColor()
            print(currentIndex)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setButtonList()
    }
    
    func setButtonList() {
        calenderButton.tintColor = .systemBlue
        buttonList.append(calenderButton)
        buttonList.append(exerciseButton)
        buttonList.append(mealButton)
    }
    
    func changeButtonColor() {
        for (index, element) in buttonList.enumerated() {
            if index == currentIndex {
                element.tintColor = .systemBlue
            } else {
                element.tintColor = .systemGray
            }
        }
    }
    
    var pageViewController: MemoPageViewController!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PageVC" {
            print("Connected")
            guard let vc = segue.destination as? MemoPageViewController else { return }
            pageViewController = vc
            pageViewController.completeHandler = {(result) in
                self.currentIndex = result
            }
        } else {
            print("Not Connected")
        }
    }
    
    @IBAction func calenderButtonTapped(_ sender: UIButton) {
//        print("1")
        pageViewController.setViewControllersFromIndex(index: 0)
    }
    @IBAction func exerciseButtonTapped(_ sender: UIButton) {
//        print("2")
        pageViewController.setViewControllersFromIndex(index: 1)
    }
    @IBAction func mealButtonTapped(_ sender: UIButton) {
//        print("3")
        pageViewController.setViewControllersFromIndex(index: 2)
    }
    
    
}
