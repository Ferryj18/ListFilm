

import Foundation

class DateConverter {
    static func convertDateString(_ inputDate: String, defaultValue: String = "Invalid Date") -> String {
        let inputFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        let outputFormat = "dd MMM yyyy"
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = inputFormat
        
        if let date = dateFormatter.date(from: inputDate) {
            dateFormatter.dateFormat = outputFormat
            return dateFormatter.string(from: date)
        } else {
            return defaultValue
        }
    }
}

class DateToString {

    static let shared = DateToString()

    private let dateFormatter: DateFormatter

    private init() {
        dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current // Set the locale as needed
    }

    func formatTodayDateToString(date: Date) -> String {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
}

class DateManipulator {
    static let shared = DateManipulator()

    static func decreaseDateByOneMonth(from date: Date) -> Date? {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone.current // Set the time zone if needed

        // Get the current date components
        var dateComponents = calendar.dateComponents([.year, .month, .day], from: date)

        // Decrease the month by 1
        dateComponents.month = (dateComponents.month ?? 0) - 1

        // Create a new date using the modified date components
        return calendar.date(from: dateComponents)
    }
}
