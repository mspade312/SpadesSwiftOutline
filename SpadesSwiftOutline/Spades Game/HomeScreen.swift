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
    var avatarNameString: String = " "

    let prefs = UserDefaults.standard

    // MARK: - IBOutlets
    
    @IBOutlet weak var start1: UIButton?
    @IBOutlet weak var start2: UIButton?
    @IBOutlet weak var start3: UIButton?
    @IBOutlet weak var start4: UIButton?
    @IBOutlet weak var start5: UIButton?
    @IBOutlet weak var start6: UIButton?
    @IBOutlet weak var start7: UIButton?
    @IBOutlet weak var startRandom: UIButton?
 
    @IBOutlet weak var coinsTotal: UILabel?
    @IBOutlet weak var energyTotal: UILabel?
    
    @IBOutlet weak var profileView: UIView?
    @IBOutlet weak var profileNameLabel: UILabel?
    @IBOutlet weak var profileLevelLabel: UILabel?
    @IBOutlet weak var profileAvatar: UIImageView?


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
        let nameString = prefs.string(forKey: "profileName")
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
        let levelString = prefs.string(forKey: "currentLevel")
        if levelString == nil
        {
            profileLevelString = "Level 1"
			prefs.set(profileLevelString, forKey: "currentLevel")
        }
        else
        {
            profileLevelString = levelString!
        }
        let levelProgressString = prefs.string(forKey: "currentXP")
        if levelProgressString == nil
        {
            profileLevelProgressString = "0/10"
			prefs.set(profileLevelProgressString, forKey: "currentXP")
        }
        else
        {
            profileLevelProgressString = levelProgressString!
        }
        profileLevelLabel?.text = profileLevelString + " : " + profileLevelProgressString
        
        //Setup Avatar Photo
        let avatarString = prefs.string(forKey: "avatar")
        if avatarString == nil
        {
            avatarNameString = "pic3"
        }
        else
        {
            avatarNameString = avatarString!
        }
        let avatarImage = UIImage(named: avatarNameString)
        profileAvatar?.image = avatarImage
        
        //Setup Coin Amount
        
        let coinAmountString = prefs.string(forKey: "coinAmountString")
        if coinAmountString == nil
        {
            coinAmount = 1000
			let coinAmountString = String(coinAmount)
			prefs.set(coinAmountString, forKey: "coinAmountString")
        }
        else
        {
            let nonDigits = CharacterSet.decimalDigits.inverted
            coinAmount = Int(coinAmountString!.trimmingCharacters(in: nonDigits)) ?? 0
        }
        coinsTotal?.text = String(coinAmount)
		
		//Setup Energy Amount
		let energyAmountString = prefs.string(forKey: "energyAmountString")
		if energyAmountString == nil
		{
			energyAmount = 100
			let energyAmountString = String(energyAmount)
			prefs.set(energyAmountString, forKey: "energyAmountString")
		}
		else
		{
			let nonDigits = CharacterSet.decimalDigits.inverted
			energyAmount = Int(energyAmountString!.trimmingCharacters(in: nonDigits)) ?? 0
		}
		energyTotal?.text = String(energyAmount)
		
        //Setup Energy Refresh
        let startingTimeCheck = prefs.string(forKey: "startingTime")
        if startingTimeCheck == nil
        {
            print("Nil Check")
            //Set First Default Time
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "MM/dd/yyyy HH:mm:ss"
            let firstStartingTime = dateFormat.string(from: Date())
            prefs.set(firstStartingTime, forKey: "startingTime")
        }
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MM/dd/yyyy HH:mm:ss"
        let currentTime = dateFormat.string(from: Date())
        let startingTime = prefs.string(forKey: "startingTime")
        print(startingTime as Any)
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
        prefs.set(currentTime, forKey: "startingTime")

		//Take min passed, get missing energy amount, divide min by refil energy rate, add missing energy up until max allowed
		
		var minPassed = min
		let energyMissing = 100 - energyAmount
		
		if energyAmount < 100
		{
			for var i in 1...energyMissing
			{
				if (minPassed / 2) > 1
				{
					energyAmount = energyAmount + 1
					minPassed = minPassed / 2
				}
				i = i + 1
			}
			prefs.set(Int(energyAmount), forKey: "energyAmountString")
		}
        //Set Energy Amount
        if energyAmount < 100
        {
			
            for i in 1..<100 - energyAmount
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
        
        if playerLevel >= 2 && energyAmount >= 2
        {
            start2?.isEnabled = true
        }
        else if playerLevel >= 5 && energyAmount >= 5
        {
            start3?.isEnabled = true
        }
        else if playerLevel >= 10 && energyAmount >= 10
        {
            start4?.isEnabled = true
        }
        else if playerLevel >= 20 && energyAmount >= 12
        {
            start5?.isEnabled = true
        }
        else if playerLevel >= 35 && energyAmount >= 15
        {
            start6?.isEnabled = true
        }
        else if playerLevel >= 50 && energyAmount >= 20
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
            energyAmount -= 1
			coinAmount -= 10
			prefs.set(1, forKey: "currentGameLevel")
			prefs.set(String(energyAmount), forKey: "energyAmountString")
			prefs.set(String(coinAmount), forKey: "coinAmountString")
            toPartnerScreen()
            
        case start2:
        print("Start 2 Selected")
            if playerLevel >= 2
            {
                energyAmount -= 2
				coinAmount -= 20
				prefs.set(2, forKey: "currentGameLevel")
				prefs.set(String(energyAmount), forKey: "energyAmountString")
				prefs.set(String(coinAmount), forKey: "coinAmountString")
                toPartnerScreen()
            }
            
        case start3:
        print("Start 3 Selected")
            if playerLevel >= 5
            {
                energyAmount -= 5
				coinAmount -= 50
				prefs.set(3, forKey: "currentGameLevel")
				prefs.set(String(energyAmount), forKey: "energyAmountString")
				prefs.set(String(coinAmount), forKey: "coinAmountString")
                toPartnerScreen()
            }
            
        case start4:
        print("Start 4 Selected")
            if playerLevel >= 10
            {
                energyAmount -= 10
				coinAmount -= 100
				prefs.set(4, forKey: "currentGameLevel")
				prefs.set(String(energyAmount), forKey: "energyAmountString")
				prefs.set(String(coinAmount), forKey: "coinAmountString")
                toPartnerScreen()
            }
        
        case start5:
        print("Start 5 Selected")
            if playerLevel >= 20
            {
                energyAmount -= 12
				coinAmount -= 500
				prefs.set(5, forKey: "currentGameLevel")
				prefs.set(String(energyAmount), forKey: "energyAmountString")
				prefs.set(String(coinAmount), forKey: "coinAmountString")
                toPartnerScreen()
            }
            
        case start6:
        print("Start 6 Selected")
            if playerLevel >= 35
            {
                energyAmount -= 15
				coinAmount -= 1000
				prefs.set(6, forKey: "currentGameLevel")
				prefs.set(String(energyAmount), forKey: "energyAmountString")
				prefs.set(String(coinAmount), forKey: "coinAmountString")
                toPartnerScreen()
            }
            
        case start7:
        print("Start 7 Selected")
            if playerLevel >= 50
            {
                energyAmount -= 20
				coinAmount -= 10000
				prefs.set(7, forKey: "currentGameLevel")
				prefs.set(String(energyAmount), forKey: "energyAmountString")
				prefs.set(String(coinAmount), forKey: "coinAmountString")
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
    
    @IBAction func moreCoinsEnergySelected(sender: UIControl)
    {
        print("More Coins / Energry Button Clicked")

    }
    
    
}
