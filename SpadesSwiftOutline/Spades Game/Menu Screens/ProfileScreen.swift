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
}
