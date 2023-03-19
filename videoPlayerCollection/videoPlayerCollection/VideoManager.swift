//
//  VideoManager.swift
//  videoPlayerCollection
//
//  Created by Ziutzel grajales on 16/03/23.
//

import Foundation
import UIKit

struct  VideoManager {
    
    func findVideos (topic : String) async {
        do {
            guard let url = URL(string: "https://api.pexels.com/videos/search?query=\(topic)&locale=es-ES&per_page=80&orientation=portrait")  else {
                print("Error al cargar URL")
                return }
            
            var urlRequest = URLRequest(url: url)
            urlRequest.setValue("QLsxGjEuBv4ffwtitAnql3D3BDPYDRboc0XPgrjDBpJTBZIFYwE29Zig", forHTTPHeaderField: "Authorization")
            
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                fatalError("Error Fetching Data")
                //Delegado.mostrar error
            }
            let decoder = JSONDecoder()
            
            let decodeData = try decoder.decode(VideosBodyModel.self,from : data)
            
            print ("Videos : \(decodeData.videos)")
        } catch {
            print("Debug : error\(error.localizedDescription)")
            
            let myViewController = await UIViewController()
            
            showAlert(on: myViewController, withTitle: "My Alert", message: "This is my alert message.")
            
        }
    }
        
        func showAlert(on viewController: UIViewController, withTitle title: String, message: String) {
            
                let alertController = UIAlertController(title: "Error", message: "Error al obtener la url", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "OK", style: .default)
                alertController.addAction(okAction)
                
                viewController.present(alertController, animated: true, completion: nil)
            }
         }
      
    

