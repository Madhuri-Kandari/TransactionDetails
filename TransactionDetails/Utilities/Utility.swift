//
//  Utility.swift
//  TransactionDetails
//
//  Created by Chandana Sudha Madhuri Kandari on 04/04/24.
//

import Foundation

struct Utility {
    static func formattedDateFromString(dateString: String, withFormat format: String) -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "dd/MM/yyyy"
        if let date = inputFormatter.date(from: dateString) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = format
            return outputFormatter.string(from: date)
        }
        return nil
    }
    static func daysBetween(start: Date, end: Date) -> Int {
            return Calendar.current.dateComponents([.day], from: start, to: end).day!
    }
    
}

extension String {

    func toDate(withFormat format: String = "dd/MM/yyyy")-> Date? {

        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tehran")
        dateFormatter.locale = Locale(identifier: "fa-IR")
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)

        return date

    }
}

extension Date {

    func offsetFrom(date: Date) -> String {

        let dayHourMinuteSecond: Set<Calendar.Component> = [.day, .hour, .minute, .second]
        let difference = NSCalendar.current.dateComponents(dayHourMinuteSecond, from: date, to: self)

        //let years = "\(difference.year ?? 0) Years Ago"
        let days = "\(difference.day ?? 0) Days Ago"

        //if let year = difference.year, year > 0 { return years }
        if let day = difference.day, day > 0 { return days }
        return ""
    }

}
