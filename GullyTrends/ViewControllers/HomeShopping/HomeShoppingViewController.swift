//
//  HomeShoppingViewController.swift
//  GullyTrends
//
//  Created by Lakshmi Vajrapu on 06/01/20.
//  Copyright © 2020 GullyTrends. All rights reserved.
//

import UIKit

class HomeShoppingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
        
        let arr: NSMutableArray = [false,false,false,false,false,false,false,false,false,false,]
        
        let str : String! = "nil"
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            tableView.register(UINib(nibName: "FirstTableViewCell", bundle: nil), forCellReuseIdentifier: "FirstTableViewCell")
            tableView.register(UINib(nibName: "SecondTableViewCell", bundle: nil), forCellReuseIdentifier: "SecondTableViewCell")
            tableView.dataSource = self
            tableView.delegate = self
        }


        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return arr.count
        }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if arr.object(at: indexPath.row) as! Bool {
                
            let tvC = tableView.dequeueReusableCell(withIdentifier: "FirstTableViewCell") as? FirstTableViewCell
            tvC?.Btn.tag = indexPath.row;
            tvC?.Btn.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
                
               // tvC?.lblTitle.text = "\(indexPath.row)"
                return tvC!
            }
            else
            {
                
                let tvC = tableView.dequeueReusableCell(withIdentifier: "SecondTableViewCell") as! SecondTableViewCell
                tvC.secBtn.tag = indexPath.row;
                tvC.secBtn.addTarget(self, action: #selector(btnAction(btn:)) , for: .touchUpInside)

                return tvC
            }
        
        }
        
        @objc func btnAction(btn : UIButton) {
            let changebool : Bool = arr.object(at: btn.tag) as! Bool
            for i in 0..<arr.count {
                if i == btn.tag {
                    arr.replaceObject(at: btn.tag, with: !changebool)
                }
                else {
                    arr.replaceObject(at: i, with: false)
                }
            }
            tableView.reloadData()
        }
        
    @objc func goToNextScreen() {
            let mainVC = FilterViewController(nibName:"FilterViewController", bundle:nil)
            self.navigationController?.pushViewController(mainVC, animated: true);
        }
        
    }

