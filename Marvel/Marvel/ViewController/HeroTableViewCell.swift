//
//  HeroTableViewCell.swift
//  Marvel
//
//  Created by iOSLab on 20/07/24.
//

import UIKit

protocol HeroTableViewCellDelegate {
    func setHeroImage(id: Int, image: Data)
}

class HeroTableViewCell: UITableViewCell{
    
    let apiNetwork = APINetwork()
    var delegate: HeroTableViewCellDelegate?
    @IBOutlet weak var imageHero: UIImageView!
    @IBOutlet weak var nameHero: UILabel!
    
    func setup(hero: Hero){
        nameHero.text = hero.name
        apiNetwork.getData(path: hero.imageURL) { imageData in
            DispatchQueue.main.async {
                let image = UIImage(data: imageData)
                self.imageHero.image = image
                self.delegate?.setHeroImage(id: hero.id, image: imageData)
            }
        } onError: { error in
            
        }

    }
}
