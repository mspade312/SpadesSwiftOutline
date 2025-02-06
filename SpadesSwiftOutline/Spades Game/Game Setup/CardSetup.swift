//
//  CardSetup.swift
//  SpadesSwiftOutline
//
//  Created by Michael Spade on 10/2/24.
//

import UIKit
import AVFoundation

class CardSetup : UIViewController
{
	// MARK: - Properties
	var deckArray = [String]()
	var randomRowsArray = [String]()
	var player1CardsArray = [String]()
	var player2CardsArray = [String]()
	var player3CardsArray = [String]()
	var player4CardsArray = [String]()
	var row: Int = 0

	// MARK: - Methods
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
	}
	
	
	func setupCardDeck(deckArrayPassed: [String],randowRowsArrayPassed: [String])-> ([String], [String])
	{
		print("Setup Card Deck")
		
		//let gameScreen = GameScreen()

		//Setup Deck Arrays
		let deckArrayData = ["Club3", "Club4", "Club5", "Club6", "Club7", "Club8", "Club9", "Club10", "Club11", "Club12", "Club13", "Club14", "Diamond3", "Diamond4", "Diamond5", "Diamond6", "Diamond7", "Diamond8", "Diamond9", "Diamond10", "Diamond11", "Diamond12", "Diamond13", "Diamond14", "Heart3", "Heart4", "Heart5", "Heart6", "Heart7", "Heart8", "Heart9", "Heart10", "Heart11", "Heart12", "Heart13", "Heart14", "Spade23", "Spade24", "Spade25", "Spade26", "Spade27", "Spade28", "Spade29", "Spade31", "Spade32", "Spade33", "Spade34", "Spade35", "SpadeAA36", "SpadeAB37", "SpadeAC38", "SpadeAD39"]
		
		for i in 0..<deckArrayData.count
		{
			deckArray.append(String(deckArrayData[i]))
			print(deckArray[i])
		}
		
		//Random Rows Array Setup
		for i in 0..<52
		{
			randomRowsArray.append(String(i))
			print(randomRowsArray[i])
		}
				
		print(randomRowsArray.count)
		print(deckArray.count)
		
		return(deckArray, randomRowsArray)
	}
	
	func dealTheCards(deckArrayPassed: [String],randowRowsArrayPassed: [String])-> ([String], [String], [String], [String])
	{
		let gameScreen = GameScreen()
		deckArray = deckArrayPassed
		randomRowsArray = randowRowsArrayPassed
		print("deal the cards")
		print(randomRowsArray.count)
		
		gameScreen.spadesBroken = false
		gameScreen.partnerCutClubs = false
		gameScreen.partnerCutDiamonds = false
		gameScreen.partnerCutHearts = false
		gameScreen.againstCutClubs = false
		gameScreen.againstCutDiamonds = false
		gameScreen.againstCutHearts = false
		gameScreen.aceClubsPlayed = false
		gameScreen.aceDiamondsPlayed = false
		gameScreen.aceHeartsPlayed = false
		gameScreen.partnerThrewClubs = false
		gameScreen.partnerThrewDiamonds = false
		gameScreen.partnerThrewHearts = false
		gameScreen.againstThrewClubs = false
		gameScreen.againstThrewDiamonds = false
		gameScreen.againstThrewHearts = false
		gameScreen.twoClubs = false
		gameScreen.twoDiamonds = false
		gameScreen.twoHearts = false
		gameScreen.cardFlicked = false
		
		if randomRowsArray.count == 0
		{
			print("All Cards Delt")

			player1CardsArray.sort { $0.localizedStandardCompare($1) == .orderedAscending }
			player2CardsArray.sort { $0.localizedStandardCompare($1) == .orderedAscending }
			player3CardsArray.sort { $0.localizedStandardCompare($1) == .orderedAscending }
			player4CardsArray.sort { $0.localizedStandardCompare($1) == .orderedAscending }

			//gameScreen.position4Goes()
			
			var prefs: UserDefaults!
			prefs = UserDefaults.standard
			
			let soundString = prefs.string(forKey: "soundSelect")
			
			if ((soundString?.hasPrefix("soundOff")) != nil)
			{
			}
			else
			{
				if let path = Bundle.main.path(forResource: "cardFan1", ofType: "wav") {
					let pathURL = URL(fileURLWithPath: path)
					
					var audioEffect: SystemSoundID = 0
					AudioServicesCreateSystemSoundID(pathURL as CFURL, &audioEffect)
					AudioServicesPlaySystemSound(audioEffect)
					
					DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
						AudioServicesDisposeSystemSoundID(audioEffect)
					}
				}
			}
		}
		else
		{
			print("Dealing Cards")

			var randomCard: Int
			var rowValue: String

			randomCard = Int(arc4random_uniform(UInt32(randomRowsArray.count)))
			rowValue = randomRowsArray[randomCard]
			row = Int(rowValue) ?? 0
			randomRowsArray.remove(at: randomCard)
			player1CardsArray.append(deckArray[row])
			
			randomCard = Int(arc4random_uniform(UInt32(randomRowsArray.count)))
			rowValue = randomRowsArray[randomCard]
			row = Int(rowValue) ?? 0
			randomRowsArray.remove(at: randomCard)
			player2CardsArray.append(deckArray[row])
			
			randomCard = Int(arc4random_uniform(UInt32(randomRowsArray.count)))
			rowValue = randomRowsArray[randomCard]
			row = Int(rowValue) ?? 0
			randomRowsArray.remove(at: randomCard)
			player3CardsArray.append(deckArray[row])
			
			randomCard = Int(arc4random_uniform(UInt32(randomRowsArray.count)))
			rowValue = randomRowsArray[randomCard]
			row = Int(rowValue) ?? 0
			randomRowsArray.remove(at: randomCard)
			player4CardsArray.append(deckArray[row])
			
			dealTheCards(deckArrayPassed: deckArray, randowRowsArrayPassed: randomRowsArray)
		}
		
		return (player1CardsArray, player2CardsArray, player3CardsArray, player4CardsArray)
	}
	
    func positionCompPlayerGoesSetup(cardNameString: String, checkSpadesBroken: Bool) -> (String, String, Bool)
    {
        //Variables
        var cardSuitString = String()
        var startingSuit = String()
        var spadesBroken = checkSpadesBroken
        
        // get card suit
        // set suit = clubs
        if ((cardNameString.hasPrefix("Club")) != nil)
        {
            cardSuitString = "Club"
            startingSuit = "Club"
        }
        else if ((cardNameString.hasPrefix("Diamond")) != nil)
        {
            cardSuitString = "Diamond"
            startingSuit = "Club"
        }
        else if ((cardNameString.hasPrefix("Heart")) != nil)
        {
            cardSuitString = "Heart"
            startingSuit = "Club"
        }
        else
        {
            cardSuitString = "Spade"
            startingSuit = "Club"
            spadesBroken = true
        }
        
        return(cardSuitString, startingSuit, spadesBroken)
    }
    
    func checkSpadesBroken(checkSpadesBroken: Bool, leftValue: Int, topValue: Int, rightValue: Int, bottomValue: Int) -> (Bool)
    {
        var spadesBroken = checkSpadesBroken
        
        if spadesBroken == false
        {
            if leftValue > 14
            {
                spadesBroken = true
                print("Spades Broken")
            }
            else if topValue > 14
            {
                spadesBroken = true
                print("Spades Broken")
            }
            else if rightValue > 14
            {
                spadesBroken = true
                print("Spades Broken")
            }
            else if bottomValue > 14
            {
                spadesBroken = true
                print("Spades Broken")
            }
            else
            {
                spadesBroken = false
            }
        }
        else
        {
            spadesBroken = true
        }
        return(spadesBroken)
    }

}
