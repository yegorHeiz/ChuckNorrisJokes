//
//  ViewController.swift
//  ChuckNorrisJokes
//
//  Created by Yegor Heiz on 07.08.2020.
//  Copyright © 2020 Yegor Heiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var jokeCategories: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getJokeCategories()
    }
    
    // TODO: Move this functionality somewhere
    // TODO: Handle error
    func getJokeCategories(){
        let url = URL(string: "https://api.chucknorris.io/jokes/categories")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            let jsonDecoder = JSONDecoder()
            
            if let data = data {
                self.jokeCategories = try! jsonDecoder.decode([String].self, from: data)
            }
        }
        
        task.resume()
    }


}

