//
//  FilterViewController.swift
//  SampleSwift
//
//  Created by Lakshmi Vajrapu on 28/12/19.
//  Copyright © 2019 Lakshmi Vajrapu. All rights reserved.
//

import UIKit
import Parse

class FilterViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    @IBOutlet var leftTableView: UITableView!
    @IBOutlet var rightTableview: UITableView!
    
    var leftdataArray:Array<String> = [];
    var rightdataArray:Array<PFObject> = [];
    var selectedrighttindexs:NSMutableArray = []
    var preselectedrighttindexs:NSMutableArray = []
    var selectedindexs = [NSInteger:Any]()
    var selectedleftindex:NSInteger = 0
    var filtermodelObjects:FliterModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
           //Initial call request Settings pull the all records
           MenuVM.getSettingsLists { (settingsArray, errorMsg) in
             guard errorMsg == nil else {
               AlertUtilities.showAlert(message: errorMsg!) { _ in }
               return
             }
             
             //Filter menu type list from Settings
            FliterVM.getFliterList(array: settingsArray) { (filterarray) in
                print(filterarray)
                self.filtermodelObjects = filterarray
                self.leftdataArray = Array(filterarray.dictionary!.keys)
                self.rightdataArray = filterarray.dictionary![self.leftdataArray[0]]!
                self.leftTableView.reloadData()
                self.rightTableview.reloadData()
                
            }
            
            }
               
           }
           
    override func viewWillAppear(_ animated: Bool) {
        
        leftTableView.register(UINib(nibName: "LeftTableViewCell", bundle: nil), forCellReuseIdentifier: "LeftTableViewCell")
        rightTableview.register(UINib(nibName: "RightTableViewCell", bundle: nil), forCellReuseIdentifier: "RightTableViewCell")
        
        leftTableView.delegate = self
        rightTableview.delegate = self
        
        rightTableview.setEditing(true, animated: true)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == leftTableView {
            return self.leftdataArray.count
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
                let tableviewcell = tableView.dequeueReusableCell(withIdentifier: "LeftTableViewCell") as! LeftTableViewCell
                tableviewcell.textLabel?.text = leftdataArray[indexPath.row] as? String
                return tableviewcell
            }
            else {
                
                let tableviewcell = tableView.dequeueReusableCell(withIdentifier: "RightTableViewCell") as! RightTableViewCell
                tableviewcell.textLabel?.text = rightdataArray[indexPath.row]["name"] as? String
                tableviewcell.tintColor = UIColor.purple
                return tableviewcell
            }
        
        }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (preselectedrighttindexs.contains(indexPath.row) && preselectedrighttindexs.count>0){
                           cell.setSelected(true, animated: true)
                       } else
                       {
                           cell.setSelected(false, animated:false)
                       }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.init(rawValue: 3)!
    }
        
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == leftTableView {
            
            selectedleftindex = indexPath.row
            rightdataArray = filtermodelObjects.dictionary![leftdataArray[selectedleftindex]]!
            selectedrighttindexs = NSMutableArray()
            preselectedrighttindexs = NSMutableArray()
            if selectedindexs[selectedleftindex] != nil {
                preselectedrighttindexs = selectedindexs[selectedleftindex] as! NSMutableArray
            }
            rightTableview.reloadData()
        }
        if tableView == rightTableview{
        if !(selectedrighttindexs.contains(indexPath.row)){
            selectedrighttindexs.add(indexPath.row)
            selectedindexs[selectedleftindex] = selectedrighttindexs
            
            print(" selectedleftindex:  ",selectedleftindex )
            print(" selectedrighttindexs:  ",selectedrighttindexs )
            print(" selectedindexs:  ",selectedindexs )
            }
           
    }
    }
    func tableView(_ tableView: UITableView,didDeselectRowAt  indexPath: IndexPath) {
        if tableView == rightTableview {
            selectedrighttindexs.remove(indexPath.row)
            print(" selectedrighttindexs:  ",selectedrighttindexs )
        }
    }
        
}
