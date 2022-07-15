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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        calendarView.delegate = self
        calendarView.dataSource = self
        
        setCalendarViewUI()
        setCalendarEvent()
    }
    
    func setCalendarViewUI() {
        calendarView.scope = .month
        calendarView.scrollEnabled = true
        calendarView.scrollDirection = .vertical
        calendarView.locale = Locale(identifier: "ko_KR")
        calendarView.appearance.headerDateFormat = "YYYY년 M월"
        calendarView.appearance.headerTitleColor = UIColor.black
        calendarView.appearance.headerTitleFont = UIFont.systemFont(ofSize: 20, weight: .bold)
        calendarView.appearance.weekdayTextColor = .black
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
        dateFormatter.dateFormat = "yyyy-MM-dd"
        print(dateFormatter.string(from: date))
    }
    
    //날짜 선택 해제 시 콜백 메서드
    public func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let dateFormmater = DateFormatter()
        dateFormmater.dateFormat = "yyyy-MM-dd"
        print(dateFormmater.string(from: date))
    }
    
    //미래 날짜 Dimmed
    func maximumDate(for calendar: FSCalendar) -> Date {
        return Date()
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        if self.events.contains(date) {
            return 1
        }
        
        return 0
    }
    
    // Event Dot 크기 및 위치 조정
    func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at monthPosition: FSCalendarMonthPosition) {
        let eventScaleFactor: CGFloat = 1.8
        cell.eventIndicator.transform = CGAffineTransform(scaleX: eventScaleFactor, y: eventScaleFactor)
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, eventOffsetFor date: Date) -> CGPoint {
        CGPoint(x: 0, y: 2)
    }
}
