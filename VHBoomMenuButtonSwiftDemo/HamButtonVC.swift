//
//  HamButtonVC.swift
//  VHBoomMenuButtonSwiftDemo
//
//  Created by Nightonke on 2017/5/4.
//  Copyright © 2017 Nightonke. All rights reserved.
//

import UIKit
import BoomMenuButton

class HamButtonVC: BoomMenuButtonVC, UITableViewDelegate, UITableViewDataSource {

    static let identifier = "HamVCIdentifier"
    
    var datas: [String] = [String]()
    var piecesAndButtons: [(PiecePlaceEnum, ButtonPlaceEnum)] = [(PiecePlaceEnum, ButtonPlaceEnum)]()
    
    @IBOutlet weak var bmb: BoomMenuButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bmb.buttonEnum = .ham
        
        initializeDatas()
        tableView(tableView, didSelectRowAt: IndexPath.init(row: 0, section: 0))
    }

    func initializeDatas() {
        BuilderManager.initializeDatasForHamButton(datas: &datas, piecesAndButtons: &piecesAndButtons)
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        bmb.piecePlaceEnum = piecesAndButtons[indexPath.row].0
        bmb.buttonPlaceEnum = piecesAndButtons[indexPath.row].1
        bmb.clearBuilders()
        for _ in 0..<bmb.piecePlaceEnum.pieceNumber() {
            bmb.addBuilder(BuilderManager.hamButtonBuilder())
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: HamButtonVC.identifier)
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: HamButtonVC.identifier)
        }
        cell!.textLabel?.text = datas[indexPath.row]
        return cell!
    }

}
