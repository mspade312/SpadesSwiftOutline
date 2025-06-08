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
	@IBOutlet var startButtonCollection: [UIButton]?
	
	@IBOutlet weak var view1: UIView?
	@IBOutlet weak var view2: UIView?
	@IBOutlet weak var view3: UIView?
	@IBOutlet weak var view4: UIView?
	@IBOutlet weak var view5: UIView?
	@IBOutlet weak var view6: UIView?
	@IBOutlet weak var view7: UIView?
	@IBOutlet var cellViewCollection: [UIView]?
	
	@IBOutlet weak var label1: UILabel?
	@IBOutlet weak var label2: UILabel?
	@IBOutlet weak var label3: UILabel?
	@IBOutlet weak var label4: UILabel?
	@IBOutlet weak var label5: UILabel?
	@IBOutlet weak var label6: UILabel?
	@IBOutlet weak var label7: UILabel?
	@IBOutlet var titleLabelCollection: [UILabel]?
	
	@IBOutlet weak var image1: UIImageView?
	@IBOutlet weak var image2: UIImageView?
	@IBOutlet weak var image3: UIImageView?
	@IBOutlet weak var image4: UIImageView?
	@IBOutlet weak var image5: UIImageView?
	@IBOutlet weak var image6: UIImageView?
	@IBOutlet weak var image7: UIImageView?
	@IBOutlet var imageViewCollection: [UIImageView]?

    @IBOutlet weak var coinsTotal: UILabel?
	@IBOutlet weak var coinsView: UIView?
    @IBOutlet weak var energyTotal: UILabel?
	@IBOutlet weak var energyView: UIView?

    @IBOutlet weak var profileView: UIView?
    @IBOutlet weak var profileNameLabel: UILabel?
    @IBOutlet weak var profileLevelLabel: UILabel?
    @IBOutlet weak var profileAvatar: UIImageView?
	@IBOutlet weak var settingsButton: UIButton?


    // MARK: - Methods
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        profileView?.isUserInteractionEnabled = true
        
		//Setup Cell View
		for i in 0...6
		{
			let myView : UIView? = cellViewCollection?[i]
			
			//Cell View Setup
			myView?.layer.cornerRadius = 8
			myView?.layer.masksToBounds = true
			myView?.layer.shadowOffset = CGSize(width: 0, height: 1)
			myView?.layer.shadowColor = UIColor.black.cgColor
			myView?.layer.shadowOpacity = 0.55
			myView?.layer.borderColor = UIColor.black.cgColor
			myView?.layer.borderWidth = 0.35
			
			//Setup Cell Gradient
			let colorTop =  UIColor(red: 60.0/255.0, green: 165.0/255.0, blue: 255.0/255.0, alpha: 0.15).cgColor
			let colorBottom = UIColor(red: 60.0/255.0, green: 165.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
			let gradientLayer = CAGradientLayer()
			
			gradientLayer.colors = [colorTop, colorBottom]
			gradientLayer.locations = [0.0, 0.50]
			gradientLayer.frame = self.view.bounds
			
			myView?.layer.insertSublayer(gradientLayer, at:0)
		}
		
		//Setup Image View
		for i in 0...6
		{
			let myImageView : UIImageView? = imageViewCollection?[i]
			
			//Image View Setup
			myImageView?.layer.masksToBounds = true
			
			myImageView?.layer.borderWidth = 3.0
			myImageView?.layer.borderColor = UIColor.gray.cgColor
			myImageView?.layer.cornerRadius = (myImageView?.frame.width)! / 2
			
			/*let borderLayer = CALayer()
			borderLayer.frame = myImageView!.bounds
			borderLayer.borderColor = UIColor.black.cgColor
			borderLayer.borderWidth = 3.5
			borderLayer.cornerRadius = borderLayer.frame.width / 2
			myImageView?.layer.insertSublayer(borderLayer, above: myImageView?.layer)*/
		}
		
		//Setup Title Label View
		for i in 0...6
		{
			let myLabelView : UILabel? = titleLabelCollection?[i]
			
			//Title Label Setup
			myLabelView?.layer.cornerRadius = 5
			myLabelView?.layer.masksToBounds = true
			//myLabelView?.layer.shadowOffset = CGSize(width: 2, height: 2)
			//myLabelView?.layer.shadowColor = UIColor.black.cgColor
			//myLabelView?.layer.shadowOpacity = 0.45
			//myLabelView?.layer.borderWidth = 1.5
			//myLabelView?.layer.borderColor = UIColor.lightGray.cgColor
		}
		
		//Setup Card View
		for i in 0...7
		{
			let myButton : UIButton? = startButtonCollection?[i]
			
			//Start Button Setup
			myButton?.layer.cornerRadius = 5
			myButton?.layer.masksToBounds = false
			myButton?.layer.shadowOffset = CGSize(width: 1, height: 3)
			myButton?.layer.shadowColor = UIColor.black.cgColor
			myButton?.layer.shadowOpacity = 0.55
			myButton?.layer.borderColor = UIColor.black.cgColor
			myButton?.layer.borderWidth = 0.35
		}
		//Setup Profile View
		profileView?.layer.cornerRadius = 8
		profileView?.layer.masksToBounds = true
		
		profileAvatar?.layer.cornerRadius = (profileAvatar?.frame.width)! / 2
		profileAvatar?.layer.masksToBounds = true
		profileAvatar?.layer.borderWidth = 1.5
		profileAvatar?.layer.borderColor = UIColor.gray.cgColor
		
		//Setup Settings Button View
		settingsButton?.layer.cornerRadius = (settingsButton?.frame.width)! / 2
		settingsButton?.layer.masksToBounds = true
		settingsButton?.layer.borderWidth = 3.0
		settingsButton?.layer.borderColor = UIColor.gray.cgColor
		
		//Setup Coins and Energy Views
		coinsView?.layer.cornerRadius = 8
		coinsView?.layer.masksToBounds = true
		energyView?.layer.cornerRadius = 8
		energyView?.layer.masksToBounds = true
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
            profileLevelString = "1"
			prefs.set(profileLevelString, forKey: "currentLevel")
        }
        else
        {
            profileLevelString = levelString!
        }
        let levelProgressString = prefs.string(forKey: "currentXP")
        if levelProgressString == nil
        {
            profileLevelProgressString = "0"
			prefs.set(profileLevelProgressString, forKey: "currentXP")
        }
        else
        {
            profileLevelProgressString = levelProgressString!
        }
		//Max Level String
		let nonDigits = CharacterSet.decimalDigits.inverted
		let currentLevelInt = Float(profileLevelString.trimmingCharacters(in: nonDigits)) ?? 0
		let maxLevelInt = currentLevelInt * currentLevelInt * 10
		
        profileLevelLabel?.text = "Level " + profileLevelString + " : " + profileLevelProgressString + "/" + String(Int(maxLevelInt))
        
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
		print("Energy Missing: " + String(energyMissing))
		
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
	
	// Cell View Setup
	func gradient(frame:CGRect) -> CAGradientLayer
	{
		let layer = CAGradientLayer()
		layer.frame = frame
		layer.startPoint = CGPoint(x: 0, y: 0.5)
		layer.endPoint = CGPoint(x: 1, y: 0.5)
		layer.colors = [UIColor.gray.cgColor,UIColor.cyan.cgColor]
		
		return layer
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
