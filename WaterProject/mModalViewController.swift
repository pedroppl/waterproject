//
//  mModalViewController.swift
//  TextChanger
//
//  Created by Pedro Pablo Pérez López on 04/12/2019.
//  Copyright © 2019 Pedro Pablo Pérez López. All rights reserved.
//

import UIKit
import AudioToolbox
import CoreMotion

class mModalViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIPickerViewDelegate, UIPickerViewDataSource {

    
     @IBOutlet weak var mGrupo: UICollectionView!
    
    @IBOutlet weak var pickerCantidad: UIPickerView!
    @IBOutlet weak var botonCierraVentana: UIButton!
    @IBOutlet weak var botonAceptaResultado: UIButton!
    
    var cantidadFinal = "";
    
    override func viewDidLoad() {
        
       super.viewDidLoad()

        isModalInPresentation = true;
        
        botonAceptaResultado?.layer.cornerRadius = 40
           
        pickerCantidad?.delegate = self;
        pickerCantidad?.dataSource = self;
        self.pickerCantidad?.selectRow(2, inComponent: 0 , animated: false)
        pickerCantidad?.delegate?.pickerView?(pickerCantidad, didSelectRow: 3, inComponent: 0);
        
        self.mGrupo?.decelerationRate = UIScrollView.DecelerationRate.normal
       
        // Do any additional setup after loading the view.
    }
    
    func tst(){
        
        
    
        
        
    
    
    }
    
    @IBAction func cierraVentana(_ sender: UIButton)
    {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    /*
    public override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        //self.collectionView.delegate = self

       //Setting view's frame
       // let width = self.view.bounds.size.width
      //  let height = self.view.bounds.height   //(43 * UIScreen.main.bounds.height) / 100 //%43 of the screen
      //  self.view.frame = CGRect(x: 0, y:  340, width: width, height: height)
     
    }
    */
    @IBAction func botonCancelar(_ sender: Any) {
        print("algo")
        
        self.removeFromParent()
       
    }
    
 
    @IBOutlet weak var imageGrande: UIImageView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
   
//    var celdaSeleccionada = MyCollectionViewCell();
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
       var items = ["Cofee", "Tea", "Juice", "Milkshake", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48"]


       // MARK: - UICollectionViewDataSource protocol

       // tell the collection view how many cells to make
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return 45 //self.items.count
       }
    
    
   
   
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      
 
    
    let cellsAcross: CGFloat = 2
    let spaceBetweenCells: CGFloat = 1
            let dim = (collectionView.bounds.width - (cellsAcross - 1) * spaceBetweenCells) / cellsAcross
            let dim2 = (collectionView.bounds.height - (cellsAcross - 1) * spaceBetweenCells) / cellsAcross

    
    
        print(dim,dim2)
    
  
            return CGSize(width: dim, height: dim2)
    
            
     //return CGSize(width: 100, height: 100)
    }
    
       // make a cell for each cell index path
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

           // get a reference to our storyboard cell
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        //
        
       // let cell = collectionView.cellForItem(at: indexPath) as! MyCollectionViewCell
        
//        cell.mVistaPrueba.bounds.size = cell.bounds.size
        
        //cell.contentMode = .center
        
       // cell.mVistaPrueba.centerXAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
       // cell.mVistaPrueba.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
        
        
        var tamanoFinal = cell.mVistaPrueba.bounds.height - cell.myLabel.bounds.height
        
        cell.myImage.image = UIImage(named: "prueba")
//        por cada celda, agregar una imagen correspondiente al mismo nombre.<
        cell.myImage.bounds.size = CGSize(width: cell.myImage.bounds.width, height: tamanoFinal)
    
        cell.myImage.contentMode = .scaleAspectFit
        
    
        
           // Use the outlet in our custom class to get a reference to the UILabel in the cell
            cell.myLabel.text = self.items[indexPath.item]
        cell.myLabel.adjustsFontSizeToFitWidth = true;
        cell.myLabel.minimumScaleFactor = 0.03;
       // cell.backgroundColor = UIColor.tertiarySystemGroupedBackground // make cell more visible in our example project
        cell.myLabel.textColor = UIColor.systemOrange

//        cell.mVistaPrueba.layer.borderColor = UIColor.black.cgColor
//        cell.mVistaPrueba.layer.borderWidth = 1
        cell.mVistaPrueba.layer.cornerRadius = 8
       
            
        //cell.selectedBackgroundView = UIView(frame: cell.frame)
        
       
        //cell.selectedBackgroundView?.backgroundColor = UIColor.secondarySystemBackground
       //cell.mVistaPrueba.bounds.size = collectionView.bounds.size
//       cell.mVistaPrueba.layer.borderColor = UIColor.gray.cgColor
//       cell.mVistaPrueba.layer.borderWidth = 5
//
        
        
           return cell
       }
    


       // MARK: - UICollectionViewDelegate protocol
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt mindexPath: IndexPath) {
            print("wehatevcer")
           // handle tap events
           print("You selected cell //#\(mindexPath.item)!")
            
           
            let lightImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)

            // Prepare shortly before playing
            lightImpactFeedbackGenerator.prepare()

            // Play the haptic signal
            lightImpactFeedbackGenerator.impactOccurred()
            
//            collectionView.performBatchUpdates(nil, completion: nil)
            
            //Nos permite acceder a los elementos de la celda
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: mindexPath as IndexPath) as! MyCollectionViewCell

            //cell.selectedBackgroundView = cell.mVistaPrueba
                 
                
           // cell.selectedBackgroundView?.backgroundColor = UIColor.secondarySystemBackground
            
            let cellx = collectionView.cellForItem(at: mindexPath) as! MyCollectionViewCell
//
//           cell.isHighlighted = true;
            cell.isSelected = true
//           print( cell.myLabel.text)
//
            print(cellx.myLabel.text!)
           
    
    }
    
   func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {

//    let cell = collectionView.cellForItem(at: indexPath ) as! MyCollectionViewCell
//    prueba111.mVistaPrueba.backgroundColor = .clear
//
     let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
//
//    cell.isHighlighted = false;
    cell.isSelected = false;
    
//    cell.selectedBackgroundView = UIView(frame: cell.frame)
//
//
//     cell.selectedBackgroundView?.backgroundColor = UIColor.clear
//
   }
    

   
    
    @IBAction func getSelectedCell(_ sender: Any) {
        
          let miPruebaCollectionView = self.mGrupo
       // self.mGrupo.isPrefetchingEnabled = false;
          let indexPath = miPruebaCollectionView?.indexPathsForSelectedItems?.first
         
        
        
        
        if(indexPath != nil){
            print(self.items[indexPath!.item])
        }
        print(cantidadFinal)
        
        self.dismiss(animated: true, completion: nil)

    }
    
   var pickerData = ["50ml", "100lm", "200ml", "250ml", "330ml", "1L"]

   
    
    func numberOfComponents(in pickerCantidad: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerCantidad: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       
        return pickerData.count
        
        
    }
    
    func pickerView(_ pickerCantidad: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        let cantidades = pickerData[pickerCantidad.selectedRow(inComponent: 0)]
        
//        print(cantidades)
        cantidadFinal = cantidades
            
        
        
            return pickerData[row];
        
       
    }
    
}


