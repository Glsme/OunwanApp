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
        
        selectCollectionView.collectionViewLayout = setupLayout()
    }
}

extension AddExerciseViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectCollectionViewCell.reuseIdentifier, for: indexPath) as? SelectCollectionViewCell else { return UICollectionViewCell () }
        
        cell.layer.cornerRadius = 10
        
        cell.backgroundColor = .oMainColor
        
        return cell
    }
    
    func setupLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 16
        let width = UIScreen.main.bounds.width - (spacing * 4)
        layout.itemSize = CGSize(width: width / 3, height: width / 3)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
        return layout
    }
    
    
}
