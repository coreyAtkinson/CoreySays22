//
//  TwoViewController.swift
//  CoreySays
//
//  Created by COREY ATKINSON on 12/13/23.
//

import UIKit

class TwoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var tableOutlet: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableOutlet.delegate = self
        tableOutlet.dataSource = self
        AppData.people =    AppData.people.sorted { $0.score > $1.score }
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return AppData.people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableOutlet.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = AppData.people[indexPath.row].name
        cell.detailTextLabel?.text = "\(AppData.people[indexPath.row].score)"
        
        return cell
    }
}
