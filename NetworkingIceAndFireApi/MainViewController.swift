//
//  ViewController.swift
//  NetworkingIceAndFireApi
//
//  Created by Александр Засядько on 19.09.2022.
//

import UIKit

enum Link: String {
    case charactersURL = "https://anapioficeandfire.com/api/characters/583"
}

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension MainViewController {
    private func fetchCharacters() {
        guard let url = URL(string: Link.charactersURL.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                _ = try jsonDecoder.decode(Characters.self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
}
