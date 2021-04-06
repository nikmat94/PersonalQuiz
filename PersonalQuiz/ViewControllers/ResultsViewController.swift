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
    
    var animalTypes: AnimalType!
    var animalDescription = ""
    
    var maxCount = 0
    var maxCountName = ""
    
    var maxDefinitionCount = 0
    var maxDefinitionName = ""
    
    var arrayOfDefinitions: [String: Int] = [:]
    
    
    
    
    private var catCount = 0
    private var dogCount = 0
    private var turtleCount = 0
    private var rabbitCount = 0
    
  
    var answersFinal:[Answer]! = []
    
    var countOfTypes: [String: Int] = [:]

    
    
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результат в соответсвии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов

    override func viewDidLoad() {
        super.viewDidLoad()
        for answer in answersFinal {
            countOfTypes[String(answer.type.rawValue)] = 0
            arrayOfDefinitions[answer.type.definition] = 0
        }
        let countOfTypesKeys = [String](countOfTypes.keys)
        for answer in answersFinal {
            if countOfTypesKeys.contains(String(answer.type.rawValue)) {
                countOfTypes[String(answer.type.rawValue)]! += 1
                arrayOfDefinitions[answer.type.definition]! += 1
            }
        }

        for (animalName, animalCount) in countOfTypes {
            if animalCount >= maxCount {
                maxCount = animalCount
                maxCountName = animalName
            }
        }
        
        for (definitioneName, definitionCount) in arrayOfDefinitions {
            if definitionCount >= maxDefinitionCount {
                maxDefinitionCount = definitionCount
                maxDefinitionName = definitioneName
            }
        }

        animalTypeLabel.text = maxCountName
        animalDescriptionLabel.text = maxDefinitionName
        

        
    }
    



}

