//
//  ViewController.swift
//  WeatherAppCombine
//
//  Created by Adriano Ramos on 01/03/21.
//

import UIKit
import Combine

class ViewController: UIViewController {

    private var service: Service = Service()
    private var cancellable: AnyCancellable?

    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var textField: UITextField!


    @IBAction func checkButtonAction(_ sender: Any) {
        print("call action here")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        getTemperature()

        setupPublishers()
        textField.becomeFirstResponder()
    }

    private func setupPublishers() {
        let publisher = NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: textField)

        cancellable = publisher
            .compactMap {
                ($0.object as! UITextField).text?
                    .addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
            }
            .map { $0 }
            .debounce(for: .milliseconds(350), scheduler: RunLoop.main)
            .flatMap {
                self.service
                    .fetchWeather(city: $0)
                    .catch {_ in Empty() }
                    .map { $0 }
            }
            .sink { self.weatherLabel.text = "\($0.temp) 🌡" }
    }

    private func getTemperature() {
//        cancellable = self.service
//            .fetchWeather(city: "Houston")
//            .catch { _ in Just(Weather.placeholder!)}
//            .map { "\($0.temp)℃"}
//            .assign(to: \.text, on: weatherLabel)
    }


}

