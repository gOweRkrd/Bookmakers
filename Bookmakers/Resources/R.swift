import SwiftUI

enum StringResources {
    
    enum BettingView {
        static let averageСoefficients = "Cредние коэффициенты"
        static let winningСoefficient = "Выйгрыш"
        static let losingСoefficient = "Пройгрыш"
        static let returnСoefficient = "Возврат"

    }
    
    enum Colors {
        static let gray = UIColor(hexString: "#9B9B9B")
        static let lightGray = UIColor(hexString: "#EBEBEB")
        static let green = UIColor(hexString: "#51B07A")
        static let red = UIColor(hexString: "#B63930")
        static let black = UIColor(hexString: "#0A0A0A")
    }
}

typealias R = StringResources
