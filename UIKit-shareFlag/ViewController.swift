//
//  ViewController.swift
//  UIKit-shareFlag
//
//  Created by AKSHAY MAHAJAN on 2023-05-24.
//

import UIKit

class ViewController: UITableViewController {
	var images = [String]()
	override func viewDidLoad() {
		super.viewDidLoad()
		let fm = FileManager.default
		//The app will always have this path
		let path = Bundle.main.resourcePath!
		let contents = try! fm.contentsOfDirectory(atPath: path)
		
		for image in contents {
			if image.hasSuffix("2x.png") {
				images.append(image)
			}
		}
		title = "Flags of Countries"
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return images.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Flag", for: indexPath)
		//get rid of the extension and @size
		let label = images[indexPath.row].split(separator: "@")[0]
		cell.textLabel?.text = String(label).uppercased()
		cell.imageView?.image = UIImage(named: images[indexPath.row])
		return cell
	}
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
			vc.selectedImage = images[indexPath.row]
			navigationController?.pushViewController(vc, animated: true)
		}
	}

}

