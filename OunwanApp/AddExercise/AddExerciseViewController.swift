//
//  AddExerciseCollectionViewController.swift
//  OunwanApp
//
//  Created by Seokjune Hong on 2022/08/02.
//

import UIKit

class AddExerciseViewController: UIViewController {
    
    @IBOutlet weak var selectCollectionView: UICollectionView!
    
    static let identifier = String(describing: AddExerciseViewController.self)

    override func viewDidLoad() {
        selectCollectionView.delegate = self
        selectCollectionView.dataSource = self
        selectCollectionView.register(UINib(nibName: SelectCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: SelectCollectionViewCell.reuseIdentifier)
    }
}

extension AddExerciseViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectCollectionViewCell.reuseIdentifier, for: indexPath) as? SelectCollectionViewCell else { return UICollectionViewCell () }
        
        cell.backgroundColor = .green
        
        return cell
    }
    
    
}
