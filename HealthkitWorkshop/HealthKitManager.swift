//
//  HealthKitManager.swift
//  HealthkitWorkshop
//
//  Copyright (c) 2015 HAN. All rights reserved.
//

import Foundation
import HealthKit

public class HealthKitManager {
    
    private let healthStore = HKHealthStore()
    
    func authorize(completionHandler: (success: Bool,  error: NSError?) -> Void) {
        
        // In deze functie moet een authorizationrequest naar de HealthKitStore worden gestuurd.
        // Hierbij moet worden aangegeven welke grootheden je wil gaan lezen en welke je wil gaan schrijven.
        //
        // Voor het bereken van het aantal biertjes dat iemand nog mag drinken hebben we zijn BMR en het aantal ingenomen kcal nodig.
        // De BMR wordt berekend met behulp van het geslacht, de leeftijd, de lengte, en het gewicht van de gebruiker.
        // Wat betreft het schrijven van gegevens willen we de mogelijkheid hebben om een aantal ingenomen kcal weg te schrijven.
        //
        // Je kunt de completion-parameter die deze functie ontvangt doorgeven in je authorizationrequest.
        
    }
    
    func getBiologicalSex() -> HKBiologicalSex? {
        
        // In deze functie willen het geslacht van de gebruiker uit HealthKit halen.
        // Wanneer er in HealthKit geen geslacht bekend is mag je zelf bepalen welk geslacht je als default neemt.
        // 
        // Tip: de reference voor HKHealthStore zal hierbij goed van pas komen. Karakteristieken kunnen namelijk met een directe call opgehaald worden.
        //
        // Let op: return type van deze functie is een HKBiologicalSex en niet het HKBiologicalSexObject zoals je dit van de healthStore zal krijgen.
        
        return nil
    }
    
    func getAge() -> Int? {
        
        // In deze functie willen de leeftijd van de gebruiker berekenen.
        // Uit HealthKit kunnen we de geboortedatum van de gebruiker lezen de we vervolgens kunnen gebruiken om zijn leeftijd te berekenen.
        // Om aan de hand van een geboortedatum een leeftijd te berekenen kan je onderstaande code gebruiken.
        //
        //      let differenceComponents = NSCalendar.currentCalendar().components(.CalendarUnitYear, fromDate: geboortedatum,
        //                                                                          toDate: NSDate(), options: NSCalendarOptions(0))
        //      let age = differenceComponents.year
        //
        // Wanneer er geen geboortedatum bekend is mag je zelf bepalen welke leeftijd je als default neemt.
        //
        // Tip: de reference voor HKHealthStore zal ook hierbij goed van pas komen.
        
        return nil
        
    }
    
    func getMostRecentWeight(completionHandler: (Double?, NSError?) -> ()) {
        
        // In deze functie willen we het laatst bekende gewicht van de gebruiker uit HealthKit lezen.
        //
        // Tips: De HKSampleQuery-reference kan hierbij goed van pas komen.
        //       Omdat je alleen de laatste sample wil hebben kan je het aantal resultaten limiteren tot 1.
        //       Vergeet niet de samples op datum te sorteren.
        //       Zet de laatste sample om naar de juiste eenheid met HKQuantitySample.quantity.doubleValueForUnit()
        
    }
    
    func getMostRecentHeight(completionHandler: (Double?, NSError?) -> ()) {
        
        // In deze functie willen we de laatst bekende lengte van de gebruiker uit HealthKit lezen.
        //
        // Tip: Deze functie is vrijwel identiek aan de functie waarmee we het laatst bekende gewicht van de gebruiker uit HealthKit lezen.
        //      Het enige verschil zit hem in het type sample dat je ophaalt en de eenheid waar je hem naar omzet.
        
    }
    
    func getConsumedCalories(completionHandler: (Int?, NSError?) -> ()) {
        
        // In deze functie willen we uit HealthKit halen hoeveel kcal de gebruiker in de afgelopen dag (24 uur) heeft ingenomen.
        // Hiervoor gaan we gebruik maken van een statistics query. 
        // Deze statistics query kan ons de som van het aantal ingenomen kcal geven over een bepaalde periode.
        //
        // Tip: de reference voor de HKStatisticQuery zal hierbij goed van pas komen
        
    }
    
    func writeCaloriesToHealthKit(calories: Double, completionHandler: (Bool, NSError!) -> ()) {
        
        // In deze functie gaan we het aantal calorieen dat wordt meegegeven in de calories-parameter wegschrijven naar HealthKit.
        //
        // Tip: zoek uit hoe de HealthKitStore.saveObject() methode werkt.

    }
}