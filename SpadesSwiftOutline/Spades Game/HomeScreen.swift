//
//  HomeScreen.swift
//  SpadesSwiftOutline
//
//  Created by Michael Spade on 10/2/24.
//

import UIKit

class HomeScreen: UITableViewController
{
    // MARK: - Properties
    
    var coinAmount: Int = 0
    var energyAmount: Int = 0

    var profileNameString: String = " "
    var profileLevelString: String = " "
    var profileLevelProgressString: String = " "

    var prefs: UserDefaults?

    // MARK: - IBOutlets
    
    @IBOutlet weak var start1: UIButton?
    @IBOutlet weak var start2: UIButton?
    @IBOutlet weak var start3: UIButton?
    @IBOutlet weak var start4: UIButton?
    @IBOutlet weak var start5: UIButton?
    @IBOutlet weak var start6: UIButton?
    @IBOutlet weak var start7: UIButton?
    @IBOutlet weak var startRandom: UIButton?
    //@IBOutlet var startButtonCollection: [UIButton]?
 
    @IBOutlet weak var coinsTotal: UILabel?
    @IBOutlet weak var energyTotal: UILabel?
    
    @IBOutlet weak var profileView: UIView?
    @IBOutlet weak var profileNameLabel: UILabel?
    @IBOutlet weak var profileLevelLabel: UILabel?


    // MARK: - Methods
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        profileView?.isUserInteractionEnabled = true
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
    
        //Setup Profile Name
        let nameString = prefs?.string(forKey: "profileName")
        if nameString == nil
        {
            profileNameString = "New Player"
        }
        else
        {
            profileNameString = nameString!
        }
        profileNameLabel?.text = profileNameString
        
        //Setup Profile Level
        let levelString = prefs?.string(forKey: "profileLevel")
        if levelString == nil
        {
            profileLevelString = "Level 1 :"
        }
        else
        {
            profileLevelString = levelString!
        }
        let levelProgressString = prefs?.string(forKey: "profileLevelProgress")
        if levelProgressString == nil
        {
            profileLevelProgressString = " 0%"
        }
        else
        {
            profileLevelProgressString = levelProgressString!
        }
        profileLevelLabel?.text = profileLevelString + profileLevelProgressString
        
        //Setup Coin Amount
        
        //Setup Energy Amount
    }
    
    
    
    // MARK: - User Actions
    
    @IBAction func startSelected(sender: UIButton)
    {
        switch sender
        {
        case start1:
        print("Start 1 Selected")
            
        case start2:
        print("Start 2 Selected")
            
        case start3:
        print("Start 3 Selected")
            
        case start4:
        print("Start 4 Selected")
        
        case start5:
        print("Start 5 Selected")
            
        case start6:
        print("Start 6 Selected")
            
        case start7:
        print("Start 7 Selected")
            
        case startRandom:
        print("Start Random Selected")
        
        default:
            break
        }
        
        var partnerSelect = PlayerSelect()
        partnerSelect = storyboard!.instantiateViewController(withIdentifier: "playerSelect") as! PlayerSelect
        partnerSelect.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(partnerSelect, animated: true)
    }
    
    @IBAction func settingsSelected(sender: UIButton)
    {
        print("Settings Button Clicked")
        
        var settingSelected = SettingScreen()
        settingSelected = storyboard!.instantiateViewController(withIdentifier: "settingScreen") as! SettingScreen
        settingSelected.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(settingSelected, animated: true)
    }
    
    @IBAction func profileSelected(sender: UIControl)
    {
        print("Profile Button Clicked")
        
        var profileSelected = ProfileScreen()
        profileSelected = storyboard!.instantiateViewController(withIdentifier: "profileScreen") as! ProfileScreen
        profileSelected.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(profileSelected, animated: true)
    }
    
    
    
}
