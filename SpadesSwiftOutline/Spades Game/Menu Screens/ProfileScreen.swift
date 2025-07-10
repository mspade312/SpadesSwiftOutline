//
//  ProfileScreen.swift
//  SpadesSwiftOutline
//
//  Created by Michael Spade on 2/19/25.
//

import UIKit

class ProfileScreen: UITableViewController, UITextFieldDelegate
{
    // MARK: - Properties
    
    let prefs = UserDefaults.standard
    var avatarNameString: String = " "

    // MARK: - IBOutlets
    
    @IBOutlet weak var avatarSelect: UIButton?
	@IBOutlet weak var cancelButton: UIButton?
	@IBOutlet weak var currentLevelLabel: UILabel?
	@IBOutlet weak var currentXPLabel: UILabel?
    @IBOutlet weak var playerNameTextView: UITextField?
	@IBOutlet weak var xpProgressBar: UIProgressView?
	@IBOutlet weak var gamesWonLabel: UILabel?
	@IBOutlet weak var gamesLostLabel: UILabel?
	@IBOutlet weak var gamesTotalLabel: UILabel?
	@IBOutlet weak var myView: UIView?
	@IBOutlet weak var background1: UIButton?
	@IBOutlet weak var background2: UIButton?
	@IBOutlet weak var background3: UIButton?
	@IBOutlet weak var background4: UIButton?
	@IBOutlet weak var background5: UIButton?
	@IBOutlet weak var background6: UIButton?
	@IBOutlet weak var background7: UIButton?
	@IBOutlet weak var background8: UIButton?
	@IBOutlet weak var background9: UIButton?
	@IBOutlet weak var background10: UIButton?
	@IBOutlet weak var background11: UIButton?
	@IBOutlet weak var background12: UIButton?
	@IBOutlet var backgroundButtonCollection: [UIButton]?
	@IBOutlet weak var wildCard1: UIView?
	@IBOutlet weak var wildCard2: UIView?
	@IBOutlet weak var wildCard3: UIView?
	@IBOutlet weak var wildCard4: UIView?
	@IBOutlet weak var wildCard5: UIView?
	@IBOutlet weak var wildCard6: UIView?
	@IBOutlet var wildCardButtonCollection: [UIView]?


    // MARK: - Methods

    override func viewDidLoad()
    {
        super.viewDidLoad()
		
		//Set Progress Bar View
		xpProgressBar?.progress = 0.0
		xpProgressBar?.layer.cornerRadius = 10
		xpProgressBar?.clipsToBounds = true
		xpProgressBar?.layer.sublayers![1].cornerRadius = 10
		xpProgressBar?.subviews[1].clipsToBounds = true
		xpProgressBar?.transform = (xpProgressBar?.transform.scaledBy(x: 1, y: 8))!
		xpProgressBar?.progressTintColor = UIColor.blue
		xpProgressBar?.layer.borderWidth = 0.2
		xpProgressBar?.layer.borderColor = UIColor.gray.cgColor
		
		//Blue Gradient
		let colorTopBlue =  UIColor(red: 60.0/255.0, green: 165.0/255.0, blue: 255.0/255.0, alpha: 0.15).cgColor
		let colorBottomBlue = UIColor(red: 60.0/255.0, green: 165.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
		
		//Cell View Setup
		myView?.layer.cornerRadius = 8
		myView?.layer.masksToBounds = true
		myView?.layer.shadowOffset = CGSize(width: 0, height: 1)
		myView?.layer.shadowColor = UIColor.black.cgColor
		myView?.layer.shadowOpacity = 0.55
		myView?.layer.borderColor = UIColor.black.cgColor
		myView?.layer.borderWidth = 0.35
		
		//Setup Cell Gradient
		let gradientLayer = CAGradientLayer()
		
		gradientLayer.colors = [colorTopBlue, colorBottomBlue]
		gradientLayer.locations = [0.0, 0.50]
		gradientLayer.frame = self.view.bounds
		
		myView?.layer.insertSublayer(gradientLayer, at:0)
		
		//Background Selected View Setup
		let backgroundInt = prefs.integer(forKey: "backgroundNumber")

		//Set Background Boarder View
		for i in 0...11
		{
			if backgroundInt - 1  == i
			{
				let myButton : UIButton? = backgroundButtonCollection?[i]
				
				//Background Button Setup
				myButton?.layer.cornerRadius = 5
				myButton?.layer.masksToBounds = false
				myButton?.layer.borderColor = UIColor.blue.cgColor
				myButton?.layer.borderWidth = 2.0
			}
		}
		//Wild Card Selected View Setup
		let wildInt = prefs.integer(forKey: "wildNumber")

		//Set Wild Card Boarder View
		for i in 0...5
		{
			if wildInt - 1  == i
			{
				let myButton : UIView? = wildCardButtonCollection?[i]
				
				//Wild Card Button Setup
				myButton?.layer.cornerRadius = 5
				myButton?.layer.masksToBounds = false
				myButton?.layer.borderColor = UIColor.blue.cgColor
				myButton?.layer.borderWidth = 2.0
			}
		}
    }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
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
        avatarSelect?.setImage(avatarImage, for: .normal)
        
        //Setup Player Name
		
		playerNameTextView?.delegate = self
		let nameString = prefs.string(forKey: "profileName")
		if nameString == nil
		{
			playerNameTextView?.text = "New Player"
		}
		else
		{
			playerNameTextView?.text = nameString!
		}
		
        //Get Current Level
		let levelString = prefs.string(forKey: "currentLevel")
		if levelString == nil
		{
			currentLevelLabel?.text = "Level 1"
			prefs.set(currentLevelLabel?.text, forKey: "currentLevel")
		}
		else
		{
			currentLevelLabel?.text = "Level " + levelString!
		}
		
		//Set Max XP String
		let nonDigits = CharacterSet.decimalDigits.inverted
		let currentLevelInt = Float(levelString!.trimmingCharacters(in: nonDigits)) ?? 0
		let maxLevelInt = currentLevelInt * currentLevelInt * 10
		
        //Get Current XP
		let currentXPString = prefs.string(forKey: "currentXP")
		if currentXPString == nil
		{
			currentXPLabel?.text = "0/10"
			prefs.set(currentXPLabel?.text, forKey: "currentXP")
			
			xpProgressBar?.progress = 0.0
		}
		else
		{
			currentXPLabel?.text = currentXPString! + "/" + String(Int(maxLevelInt))
			let currentXPInt = Float(currentXPString!.trimmingCharacters(in: nonDigits)) ?? 0
			xpProgressBar?.progress = currentXPInt / maxLevelInt
		}
		
		//Get Current Level
		var gameWonString = prefs.string(forKey: "gamesWon")
		if gameWonString == nil
		{
			gamesWonLabel?.text = "Games Won : 0"
			gameWonString = "0"
			prefs.set(gameWonString, forKey: "gamesWon")
		}
		else
		{
			gamesWonLabel?.text = "Games Won : " + gameWonString!
		}
        //Get Total Losses
		var gameLostString = prefs.string(forKey: "gamesLost")
		if gameLostString == nil
		{
			gamesLostLabel?.text = "Games Lost : 0"
			gameLostString = "0"
			prefs.set(gameLostString, forKey: "gamesLost")
		}
		else
		{
			gamesLostLabel?.text = "Games Lost : " + gameLostString!
		}
		//Get Total Wins
		if gameWonString == nil || gameLostString == nil
		{
			gamesTotalLabel?.text = "Games Played : 0"
		}
		else
		{
			let gamesWonInt = Int(gameWonString!.trimmingCharacters(in: nonDigits)) ?? 0
			let gamesLostInt = Int(gameLostString!.trimmingCharacters(in: nonDigits)) ?? 0
			let gameTotalString = gamesWonInt + gamesLostInt
			gamesTotalLabel?.text = "Games Played : " + String(gameTotalString)
		}
		gamesTotalLabel?.layer.cornerRadius = 5
		gamesTotalLabel?.layer.masksToBounds = true
		
		//Avatar Icon View
		avatarSelect?.layer.masksToBounds = true
		avatarSelect?.layer.borderWidth = 3.0
		avatarSelect?.layer.borderColor = UIColor.gray.cgColor
		avatarSelect?.layer.cornerRadius = (avatarSelect?.frame.width)! / 2
		
		//Close Button
		cancelButton?.layer.cornerRadius = (cancelButton?.frame.width)! / 2
		cancelButton?.layer.masksToBounds = true
		cancelButton?.layer.borderWidth = 1.0
		cancelButton?.layer.borderColor = UIColor.gray.cgColor
    }
	
	func clearBackgroundBoarders()
	{
		//Clear Background Boarder View
		for i in 0...11
		{
			let myButton : UIButton? = backgroundButtonCollection?[i]
			
			//Background Button Setup
			myButton?.layer.cornerRadius = 5
			myButton?.layer.masksToBounds = false
			myButton?.layer.borderColor = UIColor.clear.cgColor
			myButton?.layer.borderWidth = 2.0
		}
	}
	
	func clearWildCardBoarders()
	{
		//Clear Wild Card Boarder View
		for i in 0...5
		{
			let myButton : UIView? = wildCardButtonCollection?[i]
			
			//Wild Card Button Setup
			myButton?.layer.cornerRadius = 5
			myButton?.layer.masksToBounds = false
			myButton?.layer.borderColor = UIColor.clear.cgColor
			myButton?.layer.borderWidth = 2.0
		}
	}
	
	func saveTextName()
	{
		prefs.set(playerNameTextView?.text, forKey: "profileName")
	}
    
    // MARK: - User Actions
    
    @IBAction func cancel(_ sender: UIButton)
    {
		saveTextName()
        presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func selectAvatar(_ sender: UIButton)
    {
        print("Avatar Button Clicked")
		saveTextName()
		
        var avatarSelected = AvatarScreen()
        avatarSelected = storyboard!.instantiateViewController(withIdentifier: "avatarScreen") as! AvatarScreen
        avatarSelected.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(avatarSelected, animated: true)
    }
	
	@IBAction func backgroundSelected(sender: UIButton)
	{
		clearBackgroundBoarders()
		
		switch sender
		{
		case background1:
		print("Background 1 Selected")
			prefs.set("landScape1", forKey: "background")
			prefs.set(1, forKey: "backgroundNumber")
			background1?.layer.borderColor = UIColor.blue.cgColor
			background1?.layer.borderWidth = 2.0
		case background2:
		print("Background 2 Selected")
			prefs.set("landScape2", forKey: "background")
			prefs.set(2, forKey: "backgroundNumber")
			background2?.layer.borderColor = UIColor.blue.cgColor
			background2?.layer.borderWidth = 2.0
		case background3:
		print("Background 3 Selected")
			prefs.set("landScape3", forKey: "background")
			prefs.set(3, forKey: "backgroundNumber")
			background3?.layer.borderColor = UIColor.blue.cgColor
			background3?.layer.borderWidth = 2.0
		case background4:
		print("Background 4 Selected")
			prefs.set("landScape4", forKey: "background")
			prefs.set(4, forKey: "backgroundNumber")
			background4?.layer.borderColor = UIColor.blue.cgColor
			background4?.layer.borderWidth = 2.0
		case background5:
		print("Background 5 Selected")
			prefs.set("landScape5", forKey: "background")
			prefs.set(5, forKey: "backgroundNumber")
			background5?.layer.borderColor = UIColor.blue.cgColor
			background5?.layer.borderWidth = 2.0
		case background6:
		print("Background 6 Selected")
			prefs.set("landScape6", forKey: "background")
			prefs.set(6, forKey: "backgroundNumber")
			background6?.layer.borderColor = UIColor.blue.cgColor
			background6?.layer.borderWidth = 2.0
		case background7:
		print("Background 7 Selected")
			prefs.set("greenFeltiPad", forKey: "background")
			prefs.set(7, forKey: "backgroundNumber")
			background7?.layer.borderColor = UIColor.blue.cgColor
			background7?.layer.borderWidth = 2.0
		case background8:
		print("Background 8 Selected")
			prefs.set("redFeltiPad", forKey: "background")
			prefs.set(8, forKey: "backgroundNumber")
			background8?.layer.borderColor = UIColor.blue.cgColor
			background8?.layer.borderWidth = 2.0
		case background9:
		print("Background 9 Selected")
			prefs.set("blueFeltiPad", forKey: "background")
			prefs.set(9, forKey: "backgroundNumber")
			background9?.layer.borderColor = UIColor.blue.cgColor
			background9?.layer.borderWidth = 2.0
		case background10:
		print("Background 10 Selected")
			prefs.set("aquaFeltiPad", forKey: "background")
			prefs.set(10, forKey: "backgroundNumber")
			background10?.layer.borderColor = UIColor.blue.cgColor
			background10?.layer.borderWidth = 2.0
		case background11:
		print("Background 11 Selected")
			prefs.set("purpleFeltiPad", forKey: "background")
			prefs.set(11, forKey: "backgroundNumber")
			background11?.layer.borderColor = UIColor.blue.cgColor
			background11?.layer.borderWidth = 2.0
		case background12:
		print("Background 12 Selected")
			prefs.set("yellowFeltiPad", forKey: "background")
			prefs.set(12, forKey: "backgroundNumber")
			background12?.layer.borderColor = UIColor.blue.cgColor
			background12?.layer.borderWidth = 2.0

		default:
			break
		}
	}
	
	@IBAction func wildCardSelected(sender: UIButton)
	{
		clearWildCardBoarders()
		
		switch sender
		{
		case wildCard1:
		print("Wild Card 1 Selected")
			prefs.set("wildCard1", forKey: "wildCard")
			prefs.set(1, forKey: "wildNumber")
			wildCard1?.layer.borderColor = UIColor.blue.cgColor
			wildCard1?.layer.borderWidth = 2.0
		case wildCard2:
		print("Wild Card 2 Selected")
			prefs.set("wildCard2", forKey: "wildCard")
			prefs.set(2, forKey: "wildNumber")
			wildCard2?.layer.borderColor = UIColor.blue.cgColor
			wildCard2?.layer.borderWidth = 2.0
		case wildCard3:
		print("Wild Card 3 Selected")
			prefs.set("wildCard3", forKey: "wildCard")
			prefs.set(3, forKey: "wildNumber")
			wildCard3?.layer.borderColor = UIColor.blue.cgColor
			wildCard3?.layer.borderWidth = 2.0
		case wildCard4:
		print("Wild Card 4 Selected")
			prefs.set("wildCard4", forKey: "wildCard")
			prefs.set(4, forKey: "wildNumber")
			wildCard4?.layer.borderColor = UIColor.blue.cgColor
			wildCard4?.layer.borderWidth = 2.0
		case wildCard5:
		print("Wild Card 5 Selected")
			prefs.set("wildCard5", forKey: "wildCard")
			prefs.set(5, forKey: "wildNumber")
			wildCard5?.layer.borderColor = UIColor.blue.cgColor
			wildCard5?.layer.borderWidth = 2.0
		case wildCard6:
		print("Wild Card 6 Selected")
			prefs.set("wildCard6", forKey: "wildCard")
			prefs.set(6, forKey: "wildNumber")
			wildCard6?.layer.borderColor = UIColor.blue.cgColor
			wildCard6?.layer.borderWidth = 2.0
			
		default:
			break
		}
	}
}
