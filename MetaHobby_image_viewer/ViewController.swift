//
//  ViewController.swift
//  MetaHobby_image_viewer
//
//  Created by qst0 on 9/3/17.
//  Copyright © 2017 qst0. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MetaHobby Image Viewer"

        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("metaguy") {
                pictures.append(item)
                //Metaguy!
            }
        }
        
        print(pictures)
        print("🌴")
        print(items)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //load the deatil view controller typecasting it to a be a detailviewcontroller
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // set the selected image property of the vc
            vc.selectedImage = pictures[indexPath.row]
            // now push it onto the naviagtion controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

