//
//  ViewController.swift
//  WeekdayFinder
//
//  Created by Yuriy on 14.09.2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var dayTF: UITextField!
    @IBOutlet var monthTF: UITextField!
    @IBOutlet var yearTF: UITextField!
    
    @IBOutlet var resultLabel: UILabel!
    
    @IBAction func findDay(_ sender: UIButton) {
        
        guard let day = dayTF.text, let month = monthTF.text, let year = yearTF.text else { return }
        
        if let intDay = Int(day), let intMonth = Int(month), let intYear = Int(year) {
            if intDay < 1 || intDay > 31 {
                showAlert(title: "Wrong data", message: "Input number in text field for day from 1 to 31")
            } else if intMonth < 1 || intMonth > 12 {
                showAlert(title: "Wrong data", message: "Input number in text field for month from 1 to 12")
            } else if intYear < 0 {
                showAlert(title: "Wrong data", message: "Input number in text field for year greater then 0")
            } else if intDay > 28 && intMonth == 2 {
                showAlert(title: "Wrong data", message: "In february 28 days")
            }
        }
        
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_En")
        dateFormatter.dateFormat = "EEEE"
        
        guard let date = calendar.date(from: dateComponents) else { return }
        
        let weekday = dateFormatter.string(from: date)
        let capitalizedWeekday = weekday.capitalized
        
        resultLabel.text = capitalizedWeekday
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension ViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

