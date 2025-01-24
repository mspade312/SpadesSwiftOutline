//
//  ViewSetup.swift
//  SpadesSwiftOutline
//
//  Created by Michael Spade on 10/4/24.
//

import UIKit


class ViewSetup : UIViewController
{
	// MARK: - Properties
	var prefs: UserDefaults!
	
	
	// MARK: - Methods
	override func viewDidLoad()
	{
		super.viewDidLoad()
	}
	
	
	func setupGameBackground()-> (UIImage?)
	{
		//let gameScreen = GameScreen()
		print("Setup Background")

		//Variables
		prefs = UserDefaults.standard
		let backgroundString = prefs.string(forKey: "background")
		let backgroundImageArray = ["landScape1", "landScape2", "landScape3", "landScape4", "landScape5", "landScape6", "greenFeltiPad", "redFeltiPad", "blueFeltiPad", "aquaFeltiPad", "purpleFeltiPad", "yellowFeltiPad"]
		var background: UIImage?

		// Background Image Setup
		for i in 0..<12 {
			let myBackgroundString = "background\(i+1)"
			if backgroundString == myBackgroundString {
				background = UIImage(named: backgroundImageArray[i])
				break
			}
		}
		
		// Set default background if no match found
		if background == nil {
			background = UIImage(named: "landScape2")
		}
		
		return background
	}
	
	func setupGame()
	{
		//let gameScreen = GameScreen()
		print("Setup Game")

		GameScreen.sharedInstance.score1Label?.text = "Books : 1"
		GameScreen.sharedInstance.score2Label?.text = "Books : 2"
		
		GameScreen.sharedInstance.teamOneBooks = 0
		GameScreen.sharedInstance.teamTwoBooks = 0
		GameScreen.sharedInstance.player1Books = 0
		GameScreen.sharedInstance.player2Books = 0
		GameScreen.sharedInstance.player3Books = 0
		GameScreen.sharedInstance.player4Books = 0
		GameScreen.sharedInstance.inGameBonus = 0
	}
	
}
