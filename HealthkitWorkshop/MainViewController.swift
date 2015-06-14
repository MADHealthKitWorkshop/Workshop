//
//  ViewController.swift
//  HealthkitWorkshop
//
//  Copyright (c) 2015 HAN. All rights reserved.
//

import UIKit
import HealthKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var bmrLabel: UILabel!
    @IBOutlet weak var caloriesConsumedLabel: UILabel!
    @IBOutlet weak var drinkBeerButton: UIButton!
    
    let healthKitManager = HealthKitManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "appDidBecomeActive:", name: UIApplicationDidBecomeActiveNotification, object: nil)
    }
    
    @objc func appDidBecomeActive(notification: NSNotification) {
        healthKitManager.authorize({ (success: Bool,  error: NSError?) -> Void in
            if error != nil {
                println("HealthKit authorization denied.")
                println("\(error)")
                return
            }
            
            if success {
                println("HealthKit authorization received.")
                self.getHealthKitData()
            }
        })
    }
            
    var biologicalSex: HKBiologicalSex?
    var ageInYears: Int?
    var weightInKg: Double?
    var heightInCm: Double?
    
    var BMR: Int? { // = Basal Metabolic Rate = minimaal aantal calorieen dat een persoon per dag verbruikt
        willSet { bmrLabel.text = (newValue != nil) ? "\(newValue!)" : "???" }
    }
    
    var caloriesConsumed: Int? {
        willSet { caloriesConsumedLabel.text = (newValue != nil) ? "\(newValue!)" : "???" }
    }
    
    var beersLeft: Int? {
        willSet { drinkBeerButton.setTitle((newValue != nil) ? "\(newValue!)" : "?", forState: UIControlState.Normal) }
    }
    
    func getHealthKitData() {
        self.biologicalSex = healthKitManager.getBiologicalSex()
        println("Geslacht van de gebruiker is \(self.biologicalSex!.rawValue) (0=notset, 1=vrouw, 2=man, 3=overig)")
        
        self.ageInYears = healthKitManager.getAge()
        println("Leeftijd van de gebruiker is \(self.ageInYears!) jaar")
        
        healthKitManager.getMostRecentHeight({ (heightInCm, error) -> Void in
            
            // Deze completionHandler wordt aangeropen wanneer de HealthKit query een resultaat heeft
            // self.heightInCm moet hier een waarde krijgen en er moet worden gekeken of we het BMR al kunnen berekenen
            //
            // Let op: healthkit queries worden niet op de main queue uitgevoerd. Je zult hier dus terug moeten "springen" naar de main queue.
            
        })
        
        healthKitManager.getMostRecentWeight({ (weightInKg, error) -> Void in
            
            // Deze completionHandler wordt aangeropen wanneer de HealthKit query een resultaat heeft.
            // self.weightInKg moet hier een waarde krijgen en er moet worden gekeken of we het BMR al kunnen berekenen.
            //
            // Let op: healthkit queries worden niet op de main queue uitgevoerd. Je zult hier dus terug moeten "springen" naar de main queue.
            
        })
        
        healthKitManager.getConsumedCalories({ (caloriesConsumed, error) -> Void in
            
            // Deze completionHandler wordt aangeropen wanneer de HealthKit query een resultaat heeft.
            // self.caloriesConsumed moet hier een waarde krijgen.
            // Zodra we weten hoeveel calorieen er zijn ingenomen kunnen we proberen het aantal bier dat de gebruiker nog mag drinken te berekenen.
            //
            // Let op: healthkit queries worden niet op de main queue uitgevoerd. Je zult hier dus terug moeten "springen" naar de main queue.
        
        })
    }
    
    func tryCalculateBMR() {
        
        // Zodra we de resultaten van alle queries hebben ontvangen kunnen we de BMR berekenen.
        //
        // Formule voor het berekenen van BMR:
        // BMR van een man =    66   +  (13.7 * gewicht in kg)  +  (5.0 * lengte in cm)  -  (6.8 * leeftijd in jaren)
        // BMR van een vrouw =  655  +  (9.60 * gewicht in kg)  +  (1.8 * lengte in cm)  -  (4.7 * leeftijd in jaren)
        //
        // self.BMR moet hier een waarde krijgen
        // Zodra we de BMR berekend hebben kunnen we proberen om het aantal biertjes dat de gebruiker mag drinken te berekenen
    
    }
    
    func tryCalculateBeersLeft() {
        
        // Zodra we de BMR en de ingenomen calorieen weten kunnen we hier berekenen hoeveel biertjes de gebruiker nog mag drinken.
        // Een glas bier bevat ongeveer 110 kcal.
        // self.beersLeft moet hier een waarde krijgen.

    }
    
    @IBAction func drinkBeerButtonClicked(sender: UIButton) {
        
        // Deze functie wordt aangeroepen op het moment dat de gebruiker op het bierglas drukt. 
        // In deze functie willen we de writeCaloriesToHealthKit()-methode uit de HealthKitManager aanroepen.
        // In de completionHandler van die methode willen we alle gegevens opnieuw uitlezen zodat het zojuist toegevoegde biertje wordt opgenomen in de berekening.
        
    }
}