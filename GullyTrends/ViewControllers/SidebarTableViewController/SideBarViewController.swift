//
//  SideBarViewController.swift
//  GullyTrends
//
//  Created by Muni on 07/01/20.
//  Copyright © 2020 GullyTrends. All rights reserved.
//

//TODO: Inprogress functionality

import UIKit

class SideBarViewController: UIViewController {
  
  @IBOutlet weak var listTableView: UITableView!
  var menuData = [SideMenuModel]()
  var expandIndexpath = IndexPath(row: -1, section: -1)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  func setupUI() {
    listTableView.tableFooterView = UIView(frame: CGRect.zero)
    listTableView.rowHeight = UITableView.automaticDimension
    listTableView.estimatedRowHeight = 100
    listTableView.backgroundColor = UIColor(red: 80.0 / 255.0, green: 24 / 255.0, blue: 133 / 255.0, alpha: 1.0)
    listTableView.register(UINib(nibName: "HeaderTableViewCell", bundle: nil), forCellReuseIdentifier: HeaderTableViewCell.reuseIdentifier)
    listTableView.register(UINib(nibName: "SubHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: SubHeaderTableViewCell.reuseIdentifier)

    MenuVM.getMenuList(array: ParseManger.shared.settingsArray) { (result) in
      self.menuData = result
      self.listTableView.reloadData()
    }
  }
}

extension SideBarViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return menuData.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if expandIndexpath.section ==  section {
      return (menuData[section].list?.count ?? 0) + 1
    }
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let model = menuData[indexPath.section]
    if expandIndexpath.section ==  indexPath.section && indexPath.row > 0 {
      let subModel = menuData[indexPath.section].list
      let cell  = tableView.dequeueReusableCell(withIdentifier: SubHeaderTableViewCell.reuseIdentifier, for: indexPath) as! SubHeaderTableViewCell
      cell.nameLabel.text = subModel![indexPath.row-1].name
      return cell
    } else {
      let cell  = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.reuseIdentifier, for: indexPath) as! HeaderTableViewCell
      cell.nameLabel.text = model.name
      DispatchQueue.main.async {
        if let icon = model.icon {
          cell.logoIV.isHidden = false
          cell.logoIV.image = UIImage(named: icon)
        } else {
          cell.logoIV.isHidden = true
        }
      }
      return cell
    }
    return UITableViewCell()
  }
  
}

extension SideBarViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    expandIndexpath = IndexPath(row: -1, section: -1)
    if (menuData[indexPath.section].list?.count ?? 0) > 0 && indexPath.row == 0 {
      expandIndexpath = indexPath
    }
    listTableView.reloadData()
  }
  
}
