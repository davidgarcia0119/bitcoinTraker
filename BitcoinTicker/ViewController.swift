//
//  ViewController.swift
//  BitcoinTicker
//


import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    var finalURL = ""

    //Pre-setup IBOutlets
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.currencyPicker.delegate = self
        self.currencyPicker.dataSource = self
    }

    
    //TODO: Place your 3 UIPickerView delegate methods here
    
    //Number of columns of data
    func numberOfComponents(in pickView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count
    }

    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // self.conection(url: baseURL + currencyArray[component])
        return currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.conection(url: baseURL + currencyArray[row])
    }
   
    func conection(url: String ){
        
        if let url = URL(string: url){
            
            
            let task = URLSession.shared.dataTask(with: url) {
                data, response, error in
                
                
                
                
                
                
                
                DispatchQueue.main.async {
                    if let data2 = data {
                       // label.text = String(decoding: data, as: UTF8.self)
                        print(String(decoding: data2, as: UTF8.self))
                        do {
                            if let todoJSON = try JSONSerialization.jsonObject(with: data2, options: []) as? [String: Any],
                                let todo = todoJSON["bid"] {
                                self.bitcoinPriceLabel.text = String(describing: todo)
                                
                            }
                        } catch {
                            // error trying to convert the data to JSON using JSONSerialization.jsonObject
                           print("error al pasar el json")
                            return
                        }
                    } else {
                       // label.text = error?.localizedDescription
                    }
                }
                
                
                

                
                
            }
            
            task.resume()
        }
        
        
        
        
        
        

    }
    
 


    // parse the result as JSON
    // then create a Todo
    
    
    
    
//    
//    //MARK: - Networking URLSesion
//    /***************************************************************/
//    
//    func getWeatherData(url: String, parameters: [String : String]) {
//
//
//    }
//
  
//    
//    //MARK: - JSON Parsing without SwiftyJSON
//    /***************************************************************/
//    
//    func updateWeatherData(json : JSON) {
//
//
//        updateUIWithWeatherData()
//    }
//
//
//    //MARK: - Update UI
//    /***************************************************************/
//
//    func updateUIWithWeatherData() {
//
//    }



}

