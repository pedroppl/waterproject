//
//  ViewController.swift
//  TextChanger
//
//  Created by Pedro Pablo Pérez López on 25/11/2019.
//  Copyright © 2019 Pedro Pablo Pérez López. All rights reserved.
//

import UIKit
import HealthKit


class ViewController: UIViewController  {

    

    @IBOutlet weak var theMessage: UILabel!
    @IBOutlet weak var botonRedondo: UIButton!
     @IBOutlet weak var mContainer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //botonRedondo.backgroundColor = .clear
        botonRedondo.layer.cornerRadius = 40
//        botonRedondo.layer.borderWidth = 5
//        botonRedondo.layer.borderColor = UIColor.link.cgColor
        
       
        
        UIView.animate(withDuration: 2, delay: 0, options: [.curveLinear],
                       animations: {
                        self.mContainer.center.y += self.mContainer.bounds.height
                        self.mContainer.layoutIfNeeded()

        },  completion: {(_ completed: Bool) -> Void in
        
            })
        
        //mContainer.bounds(mContainer.bounds.Left, mContainer.Frame.Height - 200, mContainer.Frame.Right, 0)
           
        
        // Do any additional setup after loading the view.
        self.readWater()
    }
    
  
    @IBAction func botonRecogeDatos(_ sender: UIButton) {
        
       
        
    }
    
    @IBAction func textChanger(_ sender: UIButton) {
        thisIsATest(param: "vamos a probar");
        
        //setProperty();
        
        if HKHealthStore.isHealthDataAvailable() {
    // Add code to use HealthKit here.
            let healthStore = HKHealthStore()
            
            let allTypes = Set([HKObjectType.quantityType(forIdentifier: .dietaryWater)!])

            healthStore.requestAuthorization(toShare: allTypes, read: allTypes) { (success, error) in
                if !success {
                    // Handle the error here.
                   
                    print("something went wrong")
                }
                 self.readWater()
            }
            
        }
    }
    
    
    
    private func readWater() {
    guard let waterType = HKSampleType.quantityType(forIdentifier: .dietaryWater) else {
        print("Sample type not available")
        return
    }
    
    let last24hPredicate = HKQuery.predicateForSamples(withStart: Date().oneDayAgo, end: Date(), options: .strictEndDate)
    
    let waterQuery = HKSampleQuery(sampleType: waterType,
                                   predicate: last24hPredicate,
                                   limit: HKObjectQueryNoLimit,
                                   sortDescriptors: nil) {
                                    (query, samples, error) in
                                    
                                    guard
                                        error == nil,
                                        let quantitySamples = samples as? [HKQuantitySample] else {
                                            print("Something went wrong: \(error)")
                                            return
                                    }
                                    
                                    let total = quantitySamples.reduce(0.0) { $0 + $1.quantity.doubleValue(for: HKUnit.literUnit(with: .milli)) }
                                    //self.theMessage.text = String(format: "Water: %.2f", total)
                                    print("total water: \(total)")
                                    
                                    DispatchQueue.main.async {
                                        self.theMessage.text = String(format: "Water: %.2f", total)
                                    }
    }
    HKHealthStore().execute(waterQuery)
}
    
    
    
    func thisIsATest(param : Any){
        
        theMessage.text = param as? String;
        
    }
    var someVar: Int = 1

    func setProperty(someVar:Int = 1) -> () {
        print(self.someVar) // Output: class property
        print(someVar) // Output: method attribute
        
        self.someVar += 1;
        
        print(self.someVar) // Output: class property
        print(someVar)
    }
    
    @IBAction func muestraContainer(_ sender: Any) {
        //mContainer.isHidden = false;
        print("hola")
        
        if(mContainer.isHidden == true){
            mContainer.animShow()
           // mContainer.isHidden = false;
        }else{
             
           mContainer.animHide()
            //mContainer.isHidden = true;
        }
       
    }
    /*
    func setView(view: UIView, hidden: Bool) {
        UIView.transition(with: view, duration: 5, options: .transitionCurlDown , animations: {
            self.view.frame = CGRect(x:0, y:0, width:320, height:460);
        })
 
     }
 */
    @IBAction func botonCancelar(_ sender: Any) {
        
        
        mContainer.animHide()
    }
    
    

    
}


extension UIView {
    
    
    func animShow(){
        
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseIn],
                       animations: {
                        self.center.y -= self.bounds.height
                        self.layoutIfNeeded()
        }, completion: nil)
        self.isHidden = false
    }
    func animHide(){
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveLinear],
                       animations: {
                        self.center.y += self.bounds.height
                        self.layoutIfNeeded()

        },  completion: {(_ completed: Bool) -> Void in
        self.isHidden = true
            })
    }
    
    
    func hideWithAnimation(hidden: Bool) {
        UIView.transition(with: self, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.isHidden = hidden
        })
    }

func fadeIn(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in }) {
    self.alpha = 0.0

    UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
        self.isHidden = false
        self.alpha = 1.0
    }, completion: completion)
}

func fadeOut(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in }) {
    self.alpha = 1.0

    UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
        self.alpha = 0.0
    }) { (completed) in
        self.isHidden = true
        completion(true)
    }
}
}




    extension Date {
    var oneDayAgo: Date {
        return self.addingTimeInterval(-86400)
    }
}
