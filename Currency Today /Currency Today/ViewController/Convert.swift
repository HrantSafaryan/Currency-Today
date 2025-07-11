//
//  Convert.swift
//  Currency Today
//
//  Created by Student on 02.07.25.
//

import UIKit

class ConvertOption {
    
    var name: String
    var BgI: UIImage
    var BgC: UIColor
    var api: String
    
    init(name: String, BgI: UIImage, BgC: UIColor, api: String) {
        self.name = name
        self.BgI = BgI
        self.BgC = BgC
        self.api = api
    }
}

class Convert: UIViewController {
    
    var models = [ConvertOption]()
    @IBOutlet weak var ConvertViewTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ConvertViewTable.delegate = self
        ConvertViewTable.dataSource = self
        ConvertViewTable.register(ConvertViewCell.self, forCellReuseIdentifier: ConvertViewCell.id)
        
        configure()

    }
    
    func configure(){
        
        models.append(contentsOf: [
            
            ConvertOption(name: "AMD", BgI: UIImage(named: "arm")!, BgC: .systemGray, api: "https://open.er-api.com/v6/latest/AMD"),
            ConvertOption(name: "RUB", BgI: UIImage(named: "rus")!, BgC: .systemGray, api: "https://open.er-api.com/v6/latest/RUB"),
            ConvertOption(name: "USD", BgI: UIImage(named: "usa")!, BgC: .systemGray, api: "https://open.er-api.com/v6/latest/USD"),
            ConvertOption(name: "EUR", BgI: UIImage(named: "eur")!, BgC: .systemGray, api: "https://open.er-api.com/v6/latest/EUR"),
            ConvertOption(name: "JPY", BgI: UIImage(named: "jap")!, BgC: .systemGray, api: "https://open.er-api.com/v6/latest/JPY"),
            ConvertOption(name: "CNY", BgI: UIImage(named: "chi")!, BgC: .systemGray, api: "https://open.er-api.com/v6/latest/CNY"),
            ConvertOption(name: "KZT", BgI: UIImage(named: "kaz")!, BgC: .systemGray, api: "https://open.er-api.com/v6/latest/KZT"),
            ConvertOption(name: "GBP", BgI: UIImage(named: "eng")!, BgC: .systemGray, api: "https://open.er-api.com/v6/latest/GBP"),
            ConvertOption(name: "CAD", BgI: UIImage(named: "can")!, BgC: .systemGray, api: "https://open.er-api.com/v6/latest/CAD"),
            ConvertOption(name: "AUD", BgI: UIImage(named: "aus")!, BgC: .systemGray, api: "https://open.er-api.com/v6/latest/AUD"),
            ConvertOption(name: "CHF", BgI: UIImage(named: "swi")!, BgC: .systemGray, api: "https://open.er-api.com/v6/latest/CHF"),
            ConvertOption(name: "IRR", BgI: UIImage(named: "irn")!, BgC: .systemGray, api: "https://open.er-api.com/v6/latest/IRR"),
            ConvertOption(name: "EGP", BgI: UIImage(named: "egy")!, BgC: .systemGray, api: "https://open.er-api.com/v6/latest/EGP"),
            ConvertOption(name: "AED", BgI: UIImage(named: "uae")!, BgC: .systemGray, api: "https://open.er-api.com/v6/latest/AED"),
            
        ])
        
    }
    

    
    @IBAction func ChangeButton(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Change") as? Change
        vc?.modalTransitionStyle = .crossDissolve
        vc?.modalPresentationStyle = .fullScreen
        self.present(vc!, animated: true)
        
    }
    
   
        @IBAction func SettingsButton(_ sender: Any) {
            
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Settings") as? Settings
        vc?.modalTransitionStyle = .crossDissolve
        vc?.modalPresentationStyle = .fullScreen
        self.present(vc!, animated: true)
            
    }

}

extension Convert: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ConvertViewCell.id, for: indexPath) as? ConvertViewCell
        else{
            return UITableViewCell()
        }
        cell.configure(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.ConvertViewTable.deselectRow(at: indexPath, animated: true)
        
        if models[indexPath.item].name != "" {
            let vc = storyboard?.instantiateViewController(withIdentifier: "ChangeViewController") as!
            ChangeViewController
            vc.ap = models[indexPath.item].api
            vc.text = models[indexPath.item].name
            self.present(vc, animated: true)
        }
    }
}
