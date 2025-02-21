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
        
        let coinAmountString = prefs?.string(forKey: "coinAmountString")
        if coinAmountString == nil
        {
            coinAmount = 100
        }
        else
        {
            let nonDigits = CharacterSet.decimalDigits.inverted
            coinAmount = Int(coinAmountString!.trimmingCharacters(in: nonDigits)) ?? 0
        }
        coinsTotal?.text = String(coinAmount)

        
        //Setup Energy Amount
        
        let energyAmountString = prefs?.string(forKey: "energyAmountString")
        if energyAmountString == nil
        {
            energyAmount = 100
        }
        else
        {
            let nonDigits = CharacterSet.decimalDigits.inverted
            energyAmount = Int(energyAmountString!.trimmingCharacters(in: nonDigits)) ?? 0
        }
        energyTotal?.text = String(energyAmount)
        
        //Setup Energy Refresh
        let startingTimeCheck = prefs?.string(forKey: "startingTime")
        if startingTimeCheck == nil
        {
            print("Nil Check")
            //Set First Default Time
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "MM/dd/yyyy HH:mm:ss"
            let firstStartingTime = dateFormat.string(from: Date())
            UserDefaults.standard.setValue(firstStartingTime, forKey: "startingTime")
        }
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MM/dd/yyyy HH:mm:ss"
        let currentTime = dateFormat.string(from: Date())
        let startingTime = UserDefaults.standard.value(forKey: "startingTime") as? String
        print(startingTime)
        print(currentTime)
        minCalculation_backgroundtime(startingTime, forgroundTime: currentTime)
        
        //Level Button Setup
        levelsEnabled()
    }
    
    func minCalculation_backgroundtime(_ startingTime: String?, forgroundTime currentTime: String?)
    {
        let dateformat = DateFormatter()
        dateformat.dateFormat = "MM/dd/yyyy HH:mm:ss"

        let lastDate = dateformat.date(from: currentTime ?? "")
        let todaysDate = dateformat.date(from: startingTime ?? "")
        let lastDiff = lastDate?.timeIntervalSinceNow ?? 0.0
        let todaysDiff = todaysDate?.timeIntervalSinceNow ?? 0.0
        let dateDiff = lastDiff - todaysDiff
        let min = Int(dateDiff / 60)
        print(String(format: "Good to see you after %i minutes", min))
        
        //Set Energy Amount
        if energyAmount < 60
        {
            for i in 1..<60 - energyAmount
            {
                energyAmount += i
            }
        }
        else
        {
        }
    }
    func toPartnerScreen()
    {
        var partnerSelect = PlayerSelect()
        partnerSelect = storyboard!.instantiateViewController(withIdentifier: "playerSelect") as! PlayerSelect
        partnerSelect.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(partnerSelect, animated: true)
    }
    
    func levelsEnabled()
    {
        let nonDigits = CharacterSet.decimalDigits.inverted
        let playerLevel = Int(profileLevelString.trimmingCharacters(in: nonDigits)) ?? 0
        
        start1?.isEnabled = true
        start2?.isEnabled = false
        start3?.isEnabled = false
        start4?.isEnabled = false
        start5?.isEnabled = false
        start6?.isEnabled = false
        start7?.isEnabled = false
        
        if playerLevel >= 2
        {
            start2?.isEnabled = true
        }
        else if playerLevel >= 5
        {
            start3?.isEnabled = true
        }
        else if playerLevel >= 10
        {
            start4?.isEnabled = true
        }
        else if playerLevel >= 20
        {
            start5?.isEnabled = true
        }
        else if playerLevel >= 35
        {
            start6?.isEnabled = true
        }
        else if playerLevel >= 50
        {
            start7?.isEnabled = true
        }
        else
        {
        }
    }
    
    
    
    
    // MARK: - User Actions
    
    @IBAction func startSelected(sender: UIButton)
    {
        let nonDigits = CharacterSet.decimalDigits.inverted
        let playerLevel = Int(profileLevelString.trimmingCharacters(in: nonDigits)) ?? 0
        
        switch sender
        {
        case start1:
        print("Start 1 Selected")
            toPartnerScreen()
            
        case start2:
        print("Start 2 Selected")
            if playerLevel >= 2
            {
                toPartnerScreen()
            }
            
        case start3:
        print("Start 3 Selected")
            if playerLevel >= 5
            {
                toPartnerScreen()
            }
            
        case start4:
        print("Start 4 Selected")
            if playerLevel >= 10
            {
                toPartnerScreen()
            }
        
        case start5:
        print("Start 5 Selected")
            if playerLevel >= 20
            {
                toPartnerScreen()
            }
            
        case start6:
        print("Start 6 Selected")
            if playerLevel >= 35
            {
                toPartnerScreen()
            }
            
        case start7:
        print("Start 7 Selected")
            if playerLevel >= 50
            {
                toPartnerScreen()
            }
            
        case startRandom:
        print("Start Random Selected")
            toPartnerScreen()

        default:
            break
        }
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
