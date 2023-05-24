//
//  ViewController.swift
//  UIKit-shareFlag
//
//  Created by AKSHAY MAHAJAN on 2023-05-24.
//

import UIKit

class ViewController: UITableViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		let fm = FileManager.default
		//The app will always have this path
		let path = Bundle.main.resourcePath!
		let contents = try! fm.contentsOfDirectory(atPath: path)
		var images = [String]()
		for image in contents {
			if image.hasSuffix(".png") {
				images.append(image)
			}
		}
		print(images)
	}


}

