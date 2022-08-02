//
//  AddExerciseCollectionViewController.swift
//  OunwanApp
//
//  Created by Seokjune Hong on 2022/08/02.
//

import UIKit

class AddExerciseCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
    
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddExerciseCollectionViewCell.identifier, for: indexPath) as? AddExerciseCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
}
