//
//  ViewController.swift
//  NetworkingIceAndFireApi
//
//  Created by Александр Засядько on 19.09.2022.
//

import UIKit

enum Link: String {
    case characterURL = "https://anapioficeandfire.com/api/characters/583"
}

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCharacter()
    }
    
}

extension MainViewController {
    private func fetchCharacter() {
        guard let url = URL(string: Link.characterURL.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let character = try jsonDecoder.decode(Character.self, from: data)
                DispatchQueue.main.async {
                    print(character)
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
}
