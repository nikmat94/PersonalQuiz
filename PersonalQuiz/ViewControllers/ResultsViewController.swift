//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 05.04.2021.
//

import UIKit


class ResultsViewController: UIViewController {
    
    @IBOutlet var animalTypeLabel: UILabel!
    @IBOutlet var animalDescriptionLabel: UILabel!
    
    @IBOutlet var barButtonItems: UINavigationItem!
    
    var answersFinal:[Answer]! = []
    
    private var animalTypes: AnimalType!
    
    private var arrayOfDefinitions: [String: Int] = [:]
    private var countOfTypesKeys:[String] = []
    private var countOfTypes: [String: Int] = [:]

    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результат в соответсвии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов

    override func viewDidLoad() {
        super.viewDidLoad()
        barButtonItems.setHidesBackButton(true, animated: false)
        
        for answer in answersFinal {
            countOfTypes[String(answer.type.rawValue)] = 0 // Заполняем ключи словарей
            arrayOfDefinitions[answer.type.definition] = 0
        }
        
        countOfTypesKeys = [String](countOfTypes.keys)
        
        for answer in answersFinal {
            if countOfTypesKeys.contains(String(answer.type.rawValue)) {
                countOfTypes[String(answer.type.rawValue)]! += 1 // Заполняем значения ключей исходя из количества совпадений
                arrayOfDefinitions[answer.type.definition]! += 1
            }
        }

        animalTypeLabel.text = searchingMaxCountInDictionary(in: countOfTypes)
        animalDescriptionLabel.text = searchingMaxCountInDictionary(in: arrayOfDefinitions)
    }
    
    private func searchingMaxCountInDictionary (in dictionaries:[String:Int]) -> String {
        var maxCount = 0
        var maxCountName = ""
        for (name, count) in dictionaries {
            if count >= maxCount {
                maxCount = count
                maxCountName = name
            }
        }
        return maxCountName
    }
}

