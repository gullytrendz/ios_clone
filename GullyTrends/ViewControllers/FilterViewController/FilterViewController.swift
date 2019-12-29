//
//  FilterViewController.swift
//  SampleSwift
//
//  Created by Lakshmi Vajrapu on 28/12/19.
//  Copyright © 2019 Lakshmi Vajrapu. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{

    @IBOutlet var leftTableView: UITableView!
    @IBOutlet var rightTableview: UITableView!
    
    var leftdataArray:NSMutableArray = ["Color","Material","Size","Sorting","Pattern","Type","Brand"];
    var rightdataArray:NSMutableArray = ["Color","Material","Size","Sorting","Pattern","Type","Brand"];
    var selectedrighttindexs:NSMutableArray = []
    var selectedleftindex:NSInteger = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        leftTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellForleftTableView")
        rightTableview.register(UITableViewCell.self, forCellReuseIdentifier: "cellForrightTableview")

        leftTableView.delegate = self
        rightTableview.delegate = self
        
        rightTableview.setEditing(true, animated: true)


    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == leftTableView {
              return leftdataArray.count
        }
      else {
            return rightdataArray.count
        }
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if tableView == leftTableView {
                let cellidentifier:String = "cellForleftTableView"
                let tableviewcell = tableView.dequeueReusableCell(withIdentifier: cellidentifier, for: indexPath) as UITableViewCell
                tableviewcell.textLabel?.text = leftdataArray[indexPath.row] as? String
                
                return tableviewcell
            }
            else {
                let cellidentifier:String = "cellForrightTableview"
                let tableviewcell = tableView.dequeueReusableCell(withIdentifier: cellidentifier, for: indexPath) as UITableViewCell
                tableviewcell.textLabel?.text = rightdataArray[selectedleftindex] as? String
                tableviewcell.tintColor = UIColor.purple
                
                return tableviewcell
            }
        
        }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.init(rawValue: 3)!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == leftTableView {
            
            selectedleftindex = indexPath.row
            selectedrighttindexs.removeAllObjects()
            rightTableview.reloadData()
        }
        if tableView == rightTableview{
        if !(selectedrighttindexs.contains(indexPath.row)){
            selectedrighttindexs.add(indexPath.row)
            print(" selectedrighttindexs:  ",selectedrighttindexs )
            }}
    }

    func tableView(_ tableView: UITableView,didDeselectRowAt  indexPath: IndexPath) {
        if tableView == rightTableview {
            selectedrighttindexs.remove(indexPath.row)
            print(" selectedrighttindexs:  ",selectedrighttindexs )

        }
    }
        
}
