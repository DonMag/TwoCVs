//
//  ViewController.swift
//  TwoCVs
//
//  Created by Don Mag on 6/10/22.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}


}

class FirstCollectionViewCell: UICollectionViewCell {
	@IBOutlet var buttonOne: UIButton!

	override func awakeFromNib() {
		super.awakeFromNib()
		commonInit()
	}
	func commonInit() {
		guard buttonOne != nil else { return }
		buttonOne.titleLabel!.font = UIFont(name: "Marker Felt", size: 20)
		buttonOne.layer.cornerRadius = 10
		buttonOne.clipsToBounds = true
		buttonOne.layer.borderWidth = 1.0
		buttonOne.layer.borderColor = UIColor.white.cgColor
	}
}
class SecondCollectionViewCell: UICollectionViewCell {
	@IBOutlet var buttonTwo: UIButton!

	override func awakeFromNib() {
		super.awakeFromNib()
		commonInit()
	}
	func commonInit() {
		guard buttonTwo != nil else { return }
		buttonTwo.titleLabel!.font = UIFont(name: "Marker Felt", size: 20)
		buttonTwo.layer.cornerRadius = 10
		buttonTwo.clipsToBounds = true
		buttonTwo.layer.borderWidth = 1.0
		buttonTwo.layer.borderColor = UIColor.white.cgColor
	}
}

class TwoCollectionsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
	
	@IBOutlet var firstCV: UICollectionView!
	@IBOutlet var secondCV: UICollectionView!
	
	let firstData: [String] = [
		"Btn 1", "Btn 2", "Btn 3", "Btn 4", "Btn 5",
	]
	let secondData: [String] = [
		"Second 1", "Second 2", "Second 3", "Second 4"
	]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		firstCV.dataSource = self
		firstCV.delegate = self
		
		secondCV.dataSource = self
		secondCV.delegate = self
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		// if it's the First Collection View
		if collectionView == firstCV {
			return firstData.count
		}
		
		// it's not the First Collection View, so it's the Second one
		return secondData.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		// if it's the First Collection View
		if collectionView == firstCV {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "firstCell", for: indexPath) as! FirstCollectionViewCell
			cell.buttonOne.setTitle(firstData[indexPath.item], for: [])
			return cell
		}
		
		// it's not the First Collection View, so it's the Second one
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "secondCell", for: indexPath) as! SecondCollectionViewCell
		cell.buttonTwo.setTitle(secondData[indexPath.item], for: [])
		return cell
		
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
		// if it's the First Collection View
		if collectionView == firstCV {
			print("Selected Item: \(indexPath.item) in First CV")
			// do what you want because a cell in the First Collection View was selected
			return
		}
		
		// it's not the First Collection View, so it's the Second one
		print("Selected Item: \(indexPath.item) in Second CV")
		// do what you want because a cell in the Second Collection View was selected
		
	}
	
}
