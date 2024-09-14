//
//  ViewController+HeroTableViewCellDelegate.swift
//  Marvel
//
//  Created by iOSLab on 24/08/24.
//

import Foundation

extension ViewController: HeroTableViewCellDelegate {
    func setHeroImage(id: Int, image: Data) {
        var heroIndex: Int?{
            for (index, hero) in self.heroes.enumerated(){
                if hero.id == id {
                    return index
                }
            }
                  return nil
        }
        guard let heroIndex else{
            return
        }
        heroes[heroIndex].imageData = image
    }
}
