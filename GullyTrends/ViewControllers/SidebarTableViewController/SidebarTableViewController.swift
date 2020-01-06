//
//  SidebarTableViewController.swift
//  GullyTrends
//
//  Created by karna on 01/01/20.
//  Copyright © 2020 GullyTrends. All rights reserved.
//

import UIKit

private let kHeaderSectionTag = 6900

class SidebarTableViewController: UIViewController {
    private var expandedSectionHeaderNumber = 0
    private var expandedSectionHeader: UITableViewHeaderFooterView?
    private var sectionItems: [[String]]?
    private var sectionNames: [String]?
    //private var onlySectionmenuitems: [String]?
    private var sectionimages: [String]?
    private var pluisMinusLbl: UILabel?
    @IBOutlet private var sideMenuTableView: UITableView!
    private var menuItems: [String]?
    var dataArray = [String: [MenuModel]]()
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height)
        label.text = "Retrieving data.\nPlease wait."
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica Neue", size: 20)
        label.sizeToFit()
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArray = SideMenuVM().getMenuData()
        sectionNames = [
        "Men's",
        "Women's",
        "Kids",
        "Designer Studios",
        "Home Shopping",
        "Sell On Gully",
        "Buy Wholesale",
        "Customer Care",
        "Return Policy",
        "FAQS",
        "About & Policies"
        ]

        sectionimages = [
        "mens-icon",
        "womens-icon",
        "kids-icon",
        "designer-icon",
        "menu_home-shopping",
        "menu_sell-on-gully-icon",
        "menu_buy-wholesale-icon"
        ]

        sectionItems = [
            ["Shirts", "T-Shirts", "Jeans", "Kurta"],
            ["Jeans", "Kurta"],
            ["T Shirts", "Jeans"],
            ["Kurta"]
        ]
        
       /* onlySectionmenuitems = [
            "Home Shopping",
            "Sell On Gully",
            "Buy Wholesale",
            "Customer Care",
            "Return Policy",
            "FAQS",
            "About & Policies"
        ]*/
        // configure the tableview
        sideMenuTableView.tableFooterView = UIView(frame: CGRect.zero)
        sideMenuTableView.rowHeight = UITableView.automaticDimension
        sideMenuTableView.estimatedRowHeight = 100
        expandedSectionHeaderNumber = -1
        sideMenuTableView.backgroundColor = UIColor(red: 80.0 / 255.0, green: 24 / 255.0, blue: 133 / 255.0, alpha: 1.0)
        sideMenuTableView.register(SideMenuViewCell.self, forCellReuseIdentifier: SideMenuViewCell.reuseIdentifier)
        menuItems = ["title", "comments", "wishlist", "tag"]
        // [self applyGradientEffect];
        // Do any additional setup after loading the view.
    }
    //    func applyGradientEffect() {
    //        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height))
    //        let gradient = CAGradientLayer()
    //        gradient.frame = view.bounds
    //        gradient.startPoint = CGPoint.zero
    //        gradient.endPoint = CGPoint(x: 0, y: 1)
    //        gradient.colors = [(UIColor(red: 80 / 255.0, green: 24 / 255.0, blue: 133 / 255.0, alpha: 1.0)).cgColor, (UIColor(red: 14.0 / 255.0, green: 27.0 / 255.0, blue: 96 / 255.0, alpha: 1.0)).cgColor].compactMap { $0 }
    //        self.view.layer.insertSublayer(gradient, at: 0)
    //    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension SidebarTableViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections.
        if sectionNames?.count ?? 0 > 0 {
            self.sideMenuTableView.backgroundView = nil
            return sectionNames?.count ?? 0
        } else {
          
            self.sideMenuTableView.backgroundView = messageLabel

            return 0
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        if expandedSectionHeaderNumber == section {
            let arrayOfItems = sectionItems?[section]
            return arrayOfItems?.count ?? 0
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // NSString str=[NSString stringWithFormat:@"   %@",[self.sectionNames objectAtIndex:section]];
        if ((sectionNames?.count) != nil) {
            return "\(sectionNames?[section] ?? "")"
        }
        return ""
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as? UITableViewHeaderFooterView
        header?.contentView.backgroundColor = UIColor(red: 80.0 / 255.0, green: 24 / 255.0, blue: 133 / 255.0, alpha: 1.0)

        header?.textLabel?.textColor = UIColor.white
        if section <= 6 {
            let viewWithTag = self.view.viewWithTag(kHeaderSectionTag + section) as? UIImageView

            if viewWithTag != nil {
                viewWithTag?.removeFromSuperview()
            }
            let theImageView = UIImageView(frame: CGRect(x: 20, y: 13, width: 15, height: 16))
            theImageView.image = UIImage(named: sectionimages?[section] ?? "")
            theImageView.tag = kHeaderSectionTag + section
            theImageView.contentMode = .scaleAspectFit
            header?.addSubview(theImageView)
        }

        //let searchstring = header?.textLabel?.text?.replacingOccurrences(of: "         ", with: "")
        //if !(onlySectionmenuitems?.contains(searchstring ?? "") ?? false) {
         //   pluisMinusLbl = UILabel(frame: CGRect(x: 220, y: 8, width: 25, height: 25))
         //   pluisMinusLbl?.text = "+"
         //   pluisMinusLbl?.textColor = UIColor.white
         //   header?.addSubview(pluisMinusLbl ?? UILabel())
       // }
        header?.tag = section
        let headerTapGesture = UITapGestureRecognizer(target: self, action: #selector(sectionHeaderWasTouched(_:)))
        header?.addGestureRecognizer(headerTapGesture)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "title", for: indexPath) as! SideMenuViewCell
        let section = sectionItems?[indexPath.section]
        cell.configure(text: section?[indexPath.row] ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        selectedrow = sectionNames[indexPath.row]
//        performSegue(withIdentifier: "segueID", sender: self)
    }
    
    @objc func sectionHeaderWasTouched(_ sender: UITapGestureRecognizer?) {
        let headerView = sender?.view as? UITableViewHeaderFooterView
        let section = headerView?.tag ?? 0

//        let searchstring = headerView?.textLabel?.text?.replacingOccurrences(of: "         ", with: "")
//        if onlySectionmenuitems?.contains(searchstring ?? "") ?? false {
////            performSegue(withIdentifier: "segueID", sender: self)
//            return
//        }
        let eImageView = headerView?.viewWithTag(kHeaderSectionTag + section) as? UIImageView
        expandedSectionHeader = headerView


        if expandedSectionHeaderNumber == -1 {
            expandedSectionHeaderNumber = section
            tableViewExpandSection(section, withImage: eImageView)
        } else {
            if expandedSectionHeaderNumber == section {
                tableViewCollapeSection(section, withImage: eImageView)
                expandedSectionHeader = nil
            } else {
                let cImageView = view.viewWithTag(kHeaderSectionTag + expandedSectionHeaderNumber) as? UIImageView
                tableViewCollapeSection(expandedSectionHeaderNumber, withImage: cImageView)
                tableViewExpandSection(section, withImage: eImageView)
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        // Set the title of navigation bar by using the menu items
        let indexPath = sideMenuTableView.indexPathForSelectedRow
        let destViewController = segue.destination as? UINavigationController
        destViewController?.title = (sectionNames?[indexPath?.row ?? 0])?.capitalized

        // Set the photo if it navigates to the PhotoView
//        if (segue.identifier == "segueID") {
//            let searchVC = SearchProductViewController()
//            navigationController?.pushViewController(searchVC, animated: true)
//        }
    }
    func tableViewCollapeSection(_ section: Int, withImage imageView: UIImageView?) {
        let sectionData = sectionItems?[section]

        expandedSectionHeaderNumber = -1
        if sectionData?.count == 0 {
            return
        } else {
            UIView.animate(withDuration: 0.4, animations: {
                imageView?.transform = CGAffineTransform(rotationAngle: (0.0 * .pi) / 180.0)
            })
            var arrayOfIndexPaths: [AnyHashable] = []
            for i in 0..<(sectionData?.count ?? 0) {
                let index = IndexPath(row: i, section: section)
                arrayOfIndexPaths.append(index)
            }
            sideMenuTableView.beginUpdates()
            if let arrayOfIndexPaths = arrayOfIndexPaths as? [IndexPath] {
                sideMenuTableView.deleteRows(at: arrayOfIndexPaths, with: .fade)
            }
            sideMenuTableView.endUpdates()
        }
    }

    func tableViewExpandSection(_ section: Int, withImage imageView: UIImageView?) {
        let sectionData = sectionItems?[section]

        if sectionData?.count == 0 {
            expandedSectionHeaderNumber = -1
            return
        } else {
            UIView.animate(withDuration: 0.4, animations: {
                imageView?.transform = CGAffineTransform(rotationAngle: (180.0 * .pi) / 180.0)
            })
            var arrayOfIndexPaths: [AnyHashable] = []
            for i in 0..<(sectionData?.count ?? 0) {
                let index = IndexPath(row: i, section: section)
                arrayOfIndexPaths.append(index)
            }
            expandedSectionHeaderNumber = section
            sideMenuTableView.beginUpdates()
            if let arrayOfIndexPaths = arrayOfIndexPaths as? [IndexPath] {
                sideMenuTableView.insertRows(at: arrayOfIndexPaths, with: .fade)
            }
            sideMenuTableView.endUpdates()
        }
    }

}
