//
//  MasterViewController.swift
//  Demo
//
//  Created by Walter Fettich on 04/04/2019.
//  Copyright © 2019 Walter Fettich. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    
    var model:MasterViewModelProtocol = MasterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = editButtonItem

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        navigationItem.rightBarButtonItem = addButton
//        if let split = splitViewController {
//            let controllers = split.viewControllers
//            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
//        }
        
        tableView.register(UINib(nibName: String(describing: MasterTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MasterTableViewCell.self))
    }

    override func viewWillAppear(_ animated: Bool) {        
        super.viewWillAppear(animated)
    }

    @objc
    func insertNewObject(_ sender: Any)
    {
        let newObject = ModelObject.dummy()
        
        model.addObject(newObject)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = model.objects[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.modelObject = object
//                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.objects.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        // pass any object as parameter, i.e. the tapped row
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MasterTableViewCell.self), for: indexPath) as! MasterTableViewCell

        let object = model.objects[indexPath.row]
        
        tableView.beginUpdates()
        cell.modelObject = object
        tableView.endUpdates()
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            model.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

