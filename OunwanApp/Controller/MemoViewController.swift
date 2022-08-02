//
//  MemoViewController.swift
//  OunwanApp
//
//  Created by Seokjune Hong on 2022/05/26.
//

import UIKit
import FSCalendar

class MemoViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    
    @IBOutlet weak var calendarView: FSCalendar!
    @IBOutlet weak var selectDateLabel: UILabel!
    @IBOutlet weak var memoCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .oBackgroundColor
        
        calendarView.delegate = self
        calendarView.dataSource = self
        
        setCalendarViewUI()
        setCalendarEvent()
        setSelectDateLabelUI()
        setCollectionViewUI()
    }
        
    @IBAction func calendarTestButtonClicked(_ sender: UIButton) {
        if calendarView.scope == .week {
            self.calendarView.setScope(.month, animated: true)
        } else {
            self.calendarView.setScope(.week, animated: true)
        }
    }
    
    func setSelectDateLabelUI() {
        selectDateLabel.font = .systemFont(ofSize: 16, weight: .bold)
    }
    
    func setCalendarViewUI() {
        calendarView.backgroundColor = .oMainColor
        calendarView.layer.cornerRadius = 10
        calendarView.scope = .month
        calendarView.scrollEnabled = true
        calendarView.scrollDirection = .vertical
        calendarView.locale = Locale(identifier: "ko_KR")
        calendarView.appearance.headerDateFormat = "YYYY년 M월"
        calendarView.appearance.headerTitleColor = UIColor.black
        calendarView.appearance.headerTitleFont = UIFont.systemFont(ofSize: 20, weight: .medium)
        calendarView.appearance.weekdayTextColor = .black
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 M월 d일"
        selectDateLabel.text = "\(dateFormatter.string(from: Date()))의 운동 기록"
    }
    
    var events: [Date] = []
    
    func setCalendarEvent() {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let firstEvent = dateFormatter.date(from: "2022-07-11")
        let secondEvent = dateFormatter.date(from: "2022-07-12")
        let thirdEvent = dateFormatter.date(from: "2022-07-13")
        
        events = [firstEvent!, secondEvent!, thirdEvent!]
    }
    
    //날짜 선택 시 콜백 메서드
    public func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 M월 d일"
        selectDateLabel.text = "\(dateFormatter.string(from: date))의 운동 기록"
    }
    
    //날짜 선택 해제 시 콜백 메서드
    public func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let dateFormmater = DateFormatter()
        dateFormmater.dateFormat = "yyyy-MM-dd"
//        print(dateFormmater.string(from: date))
    }
    
    //미래 날짜 Dimmed
//    func maximumDate(for calendar: FSCalendar) -> Date {
//        return Date()
//    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        if self.events.contains(date) {
            return 1
        }
        
        return 0
    }
    
    
    
    // Event Dot 크기 및 위치 조정
    func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at monthPosition: FSCalendarMonthPosition) {
        let eventScaleFactor: CGFloat = 1.5
        cell.eventIndicator.transform = CGAffineTransform(scaleX: eventScaleFactor, y: eventScaleFactor)
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, eventOffsetFor date: Date) -> CGPoint {
        CGPoint(x: 0, y: 3.5)
    }
}

//extension MemoViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "exersiceCell")!
//
//        cell.textLabel?.text = "aa"
//
//        return cell
//    }
//
//
//}

extension MemoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setCollectionViewUI() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 20
        let width = UIScreen.main.bounds.width - spacing * 2
        layout.itemSize = CGSize(width: width, height: UIScreen.main.bounds.height * 0.1)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = spacing
        memoCollectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExerciseCollectionViewCell.identifier, for: indexPath) as? ExerciseCollectionViewCell else { return UICollectionViewCell() }
        
        cell.layer.cornerRadius = 10
        cell.backgroundColor = .oMainColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
