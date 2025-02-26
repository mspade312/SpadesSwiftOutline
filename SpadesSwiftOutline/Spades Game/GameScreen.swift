//
//  GameScreen.swift
//  SpadesSwiftOutline
//
//  Created by Michael Spade on 10/2/24.
//

import UIKit
import AVFoundation

class GameScreen: UIViewController {
	
	// MARK: - Properties
	static let sharedInstance = GameScreen()
	
	var deckArray:[String] = []
	var player1CardsArray:[String] = []
	var player2CardsArray:[String] = []
	var player3CardsArray:[String] = []
	var player4CardsArray:[String] = []
	var randomRowsArray:[String] = []
    var buttonStringCollection:[String] = []

	var cardNameString1: String?
	var cardNameString2: String?
	var cardNameString3: String?
	var cardNameString4: String?
	
	var cardSuitString1: String?
	var cardSuitString2: String?
	var cardSuitString3: String?
	var cardSuitString4: String?
    
    var button1String: String = ""
    var button2String: String = ""
    var button3String: String = ""
    var button4String: String = ""
    var button5String: String = ""
    var button6String: String = ""
    var button7String: String = ""
    var button8String: String = ""
    var button9String: String = ""
    var button10String: String = ""
    var button11String: String = ""
    var button12String: String = ""
    var button13String: String = ""
	
	var startingSuit: String?

	var leftGoingOrder: Int = 0
	var topGoingOrder: Int = 0
	var rightGoingOrder: Int = 0
	var bottomGoingOrder: Int = 0
	
	var leftCardValue: Int = 0
	var topCardValue: Int = 0
	var rightCardValue: Int = 0
	var bottomCardValue: Int = 0
	
	var compPlayerGoing: Int = 0
	var teamOneBooks: Int = 0
	var teamTwoBooks: Int = 0
	var player1Books: Int = 0
	var player2Books: Int = 0
	var player3Books: Int = 0
	var player4Books: Int = 0
	var player4CardPlayed: Int = 0
	
	var inGameBonus: Float = 0.0
	
	var spadesBroken: Bool = false
	var partnerCutClubs: Bool = false
	var partnerCutDiamonds: Bool = false
	var partnerCutHearts: Bool = false
	var againstCutClubs: Bool = false
	var againstCutDiamonds: Bool = false
	var againstCutHearts: Bool = false
	var aceClubsPlayed: Bool = false
	var aceDiamondsPlayed: Bool = false
	var aceHeartsPlayed: Bool = false
	var partnerThrewClubs: Bool = false
	var partnerThrewDiamonds: Bool = false
	var partnerThrewHearts: Bool = false
	var againstThrewClubs: Bool = false
	var againstThrewDiamonds: Bool = false
	var againstThrewHearts: Bool = false
	var twoClubs: Bool = false
	var twoDiamonds: Bool = false
	var twoHearts: Bool = false
	var cardFlicked: Bool = false
	var delt4Twos: Bool = false
	var misdealtClubs: Bool = false
	var misdealtHearts: Bool = false
	var misdealtDiamonds: Bool = false
	var misdealtSpades: Bool = false
	
	var cardOriginalFrame1: CGPoint = .zero
	var cardOriginalFrame2: CGPoint = .zero
	var cardOriginalFrame3: CGPoint = .zero
	var cardOriginalFrame4: CGPoint = .zero
	var cardOriginalFrame5: CGPoint = .zero
	var cardOriginalFrame6: CGPoint = .zero
	var cardOriginalFrame7: CGPoint = .zero
	var cardOriginalFrame8: CGPoint = .zero
	var cardOriginalFrame9: CGPoint = .zero
	var cardOriginalFrame10: CGPoint = .zero
	var cardOriginalFrame11: CGPoint = .zero
	var cardOriginalFrame12: CGPoint = .zero
	var cardOriginalFrame13: CGPoint = .zero
	var cardOriginalFrameCollection : [CGPoint] = []
    
	var prefs: UserDefaults!
	
    let cardDeckSetup = CardSetup()
    let gameAchievementSetup = GameAchievements()

	// MARK: - IBOutlets
	
	@IBOutlet weak var card1: UIButton?
	@IBOutlet weak var card2: UIButton?
	@IBOutlet weak var card3: UIButton?
	@IBOutlet weak var card4: UIButton?
	@IBOutlet weak var card5: UIButton?
	@IBOutlet weak var card6: UIButton?
	@IBOutlet weak var card7: UIButton?
	@IBOutlet weak var card8: UIButton?
	@IBOutlet weak var card9: UIButton?
	@IBOutlet weak var card10: UIButton?
	@IBOutlet weak var card11: UIButton?
	@IBOutlet weak var card12: UIButton?
	@IBOutlet weak var card13: UIButton?
	@IBOutlet var cardButtonCollection: [UIButton]?
	
	@IBOutlet var leftCardPlayed: UIImageView?
	@IBOutlet var topCardPlayed: UIImageView?
	@IBOutlet var rightCardPlayed: UIImageView?
	@IBOutlet var bottomCardPlayed: UIImageView?
	@IBOutlet var cardPlayedCollection: [UIImageView]?
	
	@IBOutlet weak var player1: UIImageView?
	@IBOutlet weak var player2: UIImageView?
	@IBOutlet weak var player3: UIImageView?
	@IBOutlet var backgroundImage: UIImageView?
	
	@IBOutlet weak var score1Label: UILabel?
	@IBOutlet weak var score2Label: UILabel?
	@IBOutlet weak var gameOverLabel: UILabel?
	@IBOutlet weak var titleScoreLabel1: UILabel?
	@IBOutlet weak var titleScoreLabel2: UILabel?
	@IBOutlet weak var statusLabel1: UILabel?
	@IBOutlet weak var statusLabel2: UILabel?
	@IBOutlet weak var playerNameLabel1: UILabel?
	@IBOutlet weak var playerNameLabel2: UILabel?
	@IBOutlet weak var playerNameLabel3: UILabel?
	@IBOutlet weak var winScoreLabel: UILabel?
	@IBOutlet weak var booksTakenScoreLabel: UILabel?
	@IBOutlet weak var achievementBonusScoreLabel: UILabel?
	@IBOutlet weak var totalGamePointsScoreLabel: UILabel?
	    
    @IBOutlet weak var gameOverView: UIView?

	
	// MARK: - Methods
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		print("View Did Load")
	}
	
	override func viewWillAppear(_ animated: Bool)
	{
		super.viewWillAppear(animated)
		print("View Appear")

		// Variables
		//let cardSetupView = CardSetup()
		let viewSetup = ViewSetup()
		
		// Background Image Setup
		let backgroundImageSetup = viewSetup.setupGameBackground()
		backgroundImage?.contentMode = .scaleAspectFill
		backgroundImage?.layer.masksToBounds = true
		backgroundImage?.image = backgroundImageSetup
		
		//Setup Card View
        for i in 0...12
        {
            let myButton : UIButton? = cardButtonCollection?[i]
			
			//Card Image Setup
			myButton?.layer.cornerRadius = 5
			myButton?.layer.masksToBounds = false
			myButton?.layer.shadowOffset = CGSize(width: 5, height: 5)
			myButton?.layer.shadowColor = UIColor.black.cgColor
			myButton?.layer.shadowOpacity = 0.35
            
            myButton?.isHidden = true
            myButton?.isEnabled = false
		}
        for i in 0...3
		{
			let cardsPlayedView : UIImageView? = cardPlayedCollection?[i]
			
			//Card Played Image Setup
			cardsPlayedView?.layer.cornerRadius = 5
			cardsPlayedView?.layer.masksToBounds = false
			cardsPlayedView?.layer.shadowOffset = CGSize(width: 5, height: 5)
			cardsPlayedView?.layer.shadowColor = UIColor.black.cgColor
			cardsPlayedView?.layer.shadowOpacity = 0.35
		}
		/*
		//Setup Card Interaction
		cardOriginalFrameCollection = [cardOriginalFrame1, cardOriginalFrame2, cardOriginalFrame3, cardOriginalFrame4, cardOriginalFrame5, cardOriginalFrame6, cardOriginalFrame7, cardOriginalFrame8, cardOriginalFrame9, cardOriginalFrame10, cardOriginalFrame11, cardOriginalFrame12, cardOriginalFrame13]
		
        for i in 0...12
        {
			let myButton : UIButton? = cardButtonCollection?[i]
			
			//Card Frame Setup
            cardOriginalFrameCollection[i] = myButton!.center
			
			//Card Interaction Setup
            myButton!.addTarget(
				self,
				action: Selector(("wasDragged:withEvent:")),
				for: .touchDragInside)
		}*/

		//Setup Game Score
		teamOneBooks = 0
		teamTwoBooks = 0
		score1Label?.text = String(format: "Books : %li", Int(teamOneBooks))
		score2Label?.text = String(format: "Books : %li", Int(teamTwoBooks))
		inGameBonus = 0
		
        //Hide Game Over Screen
        gameOverView?.isHidden = true
        
		//Start Partner Setup
		partnerSetup()
	}
	
	func partnerSetup()
	{
		// Variables
		let partnerGameSetup = PartnerSetup()
		
		//Setup Partners
		let partners = partnerGameSetup.partnerSetup()
		playerNameLabel2?.text = partners.0
		player2?.image = partners.1
		playerNameLabel1?.text = partners.2
		player1?.image = partners.3
		playerNameLabel3?.text = partners.4
		player3?.image = partners.5
		
		bottomCardPlayed?.layer.borderWidth = 3
		bottomCardPlayed?.layer.borderColor = UIColor(white: 1.0, alpha: 0.75).cgColor

		//Start Game Setup
		startTheGame()
	}
	
	func startTheGame()
	{
		// Variables
		let gameViewSetup = ViewSetup()

		//Setup Card Deck
		let deckValues = cardDeckSetup.setupCardDeck(deckArrayPassed: deckArray, randowRowsArrayPassed: randomRowsArray)
		deckArray = deckValues.0
		randomRowsArray = deckValues.1
		
		//Setup Game View
		gameViewSetup.setupGame()
		
		//Deal The Cards
		dealCards()
	}
	
	func dealCards()
	{
		// Variables
		
		//Deal The Cards
		let playerArrayValues = cardDeckSetup.dealTheCards(deckArrayPassed: deckArray, randowRowsArrayPassed: randomRowsArray)
		player1CardsArray = playerArrayValues.0
		player2CardsArray = playerArrayValues.1
		player3CardsArray = playerArrayValues.2
		player4CardsArray = playerArrayValues.3
		
        for i in 0...12
        {
			let myButton : UIButton? = cardButtonCollection?[i]
			
			//Card Image Setup
			myButton?.isHidden = false
			myButton?.isEnabled = false
		}
		
		print("Player 1 Count : \(player1CardsArray.count)")
		print("Player 2 Count : \(player2CardsArray.count)")
		print("Player 3 Count : \(player3CardsArray.count)")
		print("Player 4 Count : \(player4CardsArray.count)")
		
		selectFirstPlayer()
	}
	
	func selectFirstPlayer()
	{
		statusLabel1?.isHidden = false
		statusLabel2?.isHidden = false
		print("Select First Player")
		
		//Select Random Player To Go First
		let randomIndexPosition = Int(arc4random() % 4)
		print("First Position Is : \(randomIndexPosition)")

		//Set Going Order
		if (randomIndexPosition == 0)
		{
			leftGoingOrder = 1
			topGoingOrder = 2
			rightGoingOrder = 3
			bottomGoingOrder = 4
		}
		else if (randomIndexPosition == 1)
		{
			leftGoingOrder = 4
			topGoingOrder = 1
			rightGoingOrder = 2
			bottomGoingOrder = 3
		}
		else if (randomIndexPosition == 2)
		{
			leftGoingOrder = 3
			topGoingOrder = 4
			rightGoingOrder = 1
			bottomGoingOrder = 2
		}
		else
		{
			leftGoingOrder = 2;
			topGoingOrder = 3;
			rightGoingOrder = 4;
			bottomGoingOrder = 1;
		}
		
		//Player Starts
		statusLabel1?.text = "Player \(randomIndexPosition + 1) Starts"
		statusLabel2?.text = "Start With Lowest Club"
		
		if (randomIndexPosition == 3)
		{
			position4Goes()
			print("Position 4 goes")

		}
		else
		{
			let delayInSeconds = 2.0
			DispatchQueue.main.asyncAfter(deadline: .now() + delayInSeconds) {
				if (randomIndexPosition == 0)
				{
					self.position1Goes()
					print("Position 1 goes")
				}
				else if (randomIndexPosition == 1)
				{
					self.position2Goes()
					print("Position 2 goes")
				}
				else if (randomIndexPosition == 2)
				{
					self.position3Goes()
					print("Position 3 goes")
				}
			}
		}

	}
	
	func position1Goes()
	{
        compPlayerGoing = 1
		if leftGoingOrder == 1
		{
			if player1CardsArray.count == 13
			{
				//select object at index 0, lowest club
				cardNameString1 = player1CardsArray[0]
                                
                let playerGoingSetup = cardDeckSetup.positionCompPlayerGoesSetup(cardNameString: cardNameString1!, checkSpadesBroken: spadesBroken)
                
                cardSuitString1 = playerGoingSetup.0
                startingSuit = playerGoingSetup.1
                spadesBroken = playerGoingSetup.2
				
				player1SelectedCard()
				
				// Remove card from array
				player1CardsArray.remove(at: 0)

				print("Card Suit Is : \(cardSuitString1)")
				print("Starting Suit Is : \(startingSuit)")
				print("Lowest Card Is : \(cardNameString1)")
				print("Player 1 Card Array Count : \(player1CardsArray.count)")

				let delayInSeconds = 1.0
				let popTime = DispatchTime.now() + delayInSeconds
				DispatchQueue.main.asyncAfter(deadline: popTime) { [self] in
					position2Goes()
				}

			}
			else if player1CardsArray.count == 0
			{
				gameOver()
			}
			else
			{
				compPlayerStarts()
			}
		
		}
		else
		{
			if player1CardsArray.count == 13
			{
				//select object at index 0, lowest club
				cardNameString1 = player1CardsArray[0]

                let playerGoingSetup = cardDeckSetup.positionCompPlayerGoesSetup(cardNameString: cardNameString1!, checkSpadesBroken: spadesBroken)
                
                cardSuitString1 = playerGoingSetup.0
                startingSuit = playerGoingSetup.1
                spadesBroken = playerGoingSetup.2
                
				// set position 1 card value
				let nonDigits = CharacterSet.decimalDigits.inverted
				leftCardValue = Int(cardNameString1!.trimmingCharacters(in: nonDigits)) ?? 0

				self.player1SelectedCard()

				// remove card from array
				player1CardsArray.remove(at: 0)
                
                print("Card Suit Is : \(cardSuitString1)")
                print("Starting Suit Is : \(startingSuit)")
                print("Lowest Card Is : \(cardNameString1)")
                print("Player 1 Card Array Count : \(player1CardsArray.count)")

				// set next player to go
				if leftGoingOrder == 4
				{
					let delayInSeconds = 1.0
					let popTime = DispatchTime.now() + delayInSeconds
					DispatchQueue.main.asyncAfter(deadline: popTime) { [self] in
						compareCards()
					}
				}
				else
				{
					let delayInSeconds = 1.0
					let popTime = DispatchTime.now() + delayInSeconds
					DispatchQueue.main.asyncAfter(deadline: popTime) { [self] in
						position2Goes()
					}
				}
			}
			else
			{
				compPlayerReacts()
			}
		}
	}
	
	func position2Goes()
	{
        compPlayerGoing = 2
        
		if topGoingOrder == 1
		{
			if player2CardsArray.count == 13
			{
				//select object at index 0, lowest club
				cardNameString2 = player2CardsArray[0]
				
                let playerGoingSetup = cardDeckSetup.positionCompPlayerGoesSetup(cardNameString: cardNameString2!, checkSpadesBroken: spadesBroken)
                
                cardSuitString2 = playerGoingSetup.0
                startingSuit = playerGoingSetup.1
                spadesBroken = playerGoingSetup.2
				
				player2SelectedCard()
				
				// Remove card from array
				player2CardsArray.remove(at: 0)
				
				print("Card Suit Is : \(cardSuitString2)")
				print("Starting Suit Is : \(startingSuit)")
				print("Lowest Card Is : \(cardNameString2)")
				print("Player 2 Card Array Count : \(player2CardsArray.count)")

				let delayInSeconds = 1.0
				let popTime = DispatchTime.now() + delayInSeconds
				DispatchQueue.main.asyncAfter(deadline: popTime) { [self] in
					position3Goes()
				}
			}
			else if player2CardsArray.count == 0
			{
				gameOver()
			}
			else
			{
				compPlayerStarts()
			}
		
		}
		else
		{
			if player2CardsArray.count == 13
			{
				//select object at index 0, lowest club
				cardNameString2 = player2CardsArray[0]

                let playerGoingSetup = cardDeckSetup.positionCompPlayerGoesSetup(cardNameString: cardNameString2!, checkSpadesBroken: spadesBroken)
                
                cardSuitString2 = playerGoingSetup.0
                startingSuit = playerGoingSetup.1
                spadesBroken = playerGoingSetup.2
                
				// set position 1 card value
				let nonDigits = CharacterSet.decimalDigits.inverted
				topCardValue = Int(cardNameString2!.trimmingCharacters(in: nonDigits)) ?? 0

				self.player2SelectedCard()

				// remove card from array
				player2CardsArray.remove(at: 0)
                
                print("Card Suit Is : \(cardSuitString2)")
                print("Starting Suit Is : \(startingSuit)")
                print("Lowest Card Is : \(cardNameString2)")
                print("Player 2 Card Array Count : \(player2CardsArray.count)")

				// set next player to go
				if topGoingOrder == 4
				{
					let delayInSeconds = 1.0
					let popTime = DispatchTime.now() + delayInSeconds
					DispatchQueue.main.asyncAfter(deadline: popTime) { [self] in
						compareCards()
					}
				}
				else
				{
					let delayInSeconds = 1.0
					let popTime = DispatchTime.now() + delayInSeconds
					DispatchQueue.main.asyncAfter(deadline: popTime) { [self] in
						position3Goes()
					}
				}
			}
			else
			{
				compPlayerReacts()
			}
		}
	}
	
	func position3Goes()
	{
        compPlayerGoing = 3

		if rightGoingOrder == 1
		{
			if player3CardsArray.count == 13
			{
				//select object at index 0, lowest club
				cardNameString3 = player3CardsArray[0]
				
                let playerGoingSetup = cardDeckSetup.positionCompPlayerGoesSetup(cardNameString: cardNameString3!, checkSpadesBroken: spadesBroken)
                
                cardSuitString3 = playerGoingSetup.0
                startingSuit = playerGoingSetup.1
                spadesBroken = playerGoingSetup.2
				
				player3SelectedCard()
				
				// Remove card from array
				player3CardsArray.remove(at: 0)
				
				print("Card Suit Is : \(cardSuitString3)")
				print("Starting Suit Is : \(startingSuit)")
				print("Lowest Card Is : \(cardNameString3)")
				print("Player 3 Card Array Count : \(player3CardsArray.count)")

				let delayInSeconds = 1.0
				let popTime = DispatchTime.now() + delayInSeconds
				DispatchQueue.main.asyncAfter(deadline: popTime) { [self] in
					position4Goes()
				}
			}
			else if player3CardsArray.count == 0
			{
				gameOver()
			}
			else
			{
				compPlayerStarts()
			}
		
		}
		else
		{
			if player3CardsArray.count == 13
			{
				//select object at index 0, lowest club
				cardNameString3 = player3CardsArray[0]

                let playerGoingSetup = cardDeckSetup.positionCompPlayerGoesSetup(cardNameString: cardNameString3!, checkSpadesBroken: spadesBroken)
                
                cardSuitString3 = playerGoingSetup.0
                startingSuit = playerGoingSetup.1
                spadesBroken = playerGoingSetup.2
                
				// set position 1 card value
				let nonDigits = CharacterSet.decimalDigits.inverted
				rightCardValue = Int(cardNameString3!.trimmingCharacters(in: nonDigits)) ?? 0

				self.player3SelectedCard()

				// remove card from array
				player3CardsArray.remove(at: 0)
                
                print("Card Suit Is : \(cardSuitString3)")
                print("Starting Suit Is : \(startingSuit)")
                print("Lowest Card Is : \(cardNameString3)")
                print("Player 2 Card Array Count : \(player3CardsArray.count)")

				// set next player to go
				if rightGoingOrder == 4
				{
					let delayInSeconds = 1.0
					let popTime = DispatchTime.now() + delayInSeconds
					DispatchQueue.main.asyncAfter(deadline: popTime) { [self] in
						compareCards()
					}
				}
				else
				{
					let delayInSeconds = 1.0
					let popTime = DispatchTime.now() + delayInSeconds
					DispatchQueue.main.asyncAfter(deadline: popTime) { [self] in
						position4Goes()
					}
				}
			}
			else
			{
				compPlayerReacts()
			}
		}
	}
	
	func position4Goes()
	{
        //Variables
        let tempArrayClub = player4CardsArray.filter(){ $0.contains("Club") }
        //var tempArraySuit = player4CardsArray.filter(){ $0.contains(startingSuit!) }
        
        buttonStringCollection = [button1String, button2String, button3String, button4String, button5String, button6String, button7String, button8String, button9String, button10String, button11String, button12String, button13String]
        
        let playerCardCount = player4CardsArray.count
        
        //If Card Hand Is Full
        if playerCardCount == 13
		{
            print("Hand Full")

            //Button String Setup
            for i in 0...(buttonStringCollection.count - 1)
            {
                buttonStringCollection[i] = player4CardsArray[i]
            }
            
            //Card Enabled Setup
            
            //Has Starting Clubs Enabled Setup
            if tempArrayClub.count > 0
            {
                //Button 1 Enabled
                cardButtonCollection?[0].isEnabled = true
                
                //Other Buttons Not Enabled
                for i in 1...12
                {
                    let myButton : UIButton? = cardButtonCollection?[i]
        
                    myButton?.isEnabled = false
                }
            }
            
            //Does Not Have Starting Clubs Enabled Setup
            else
            {
                for i in 0...12
                {
                    let myButton : UIButton? = cardButtonCollection?[i]
                    
                    if buttonStringCollection[i].hasPrefix("Spade")
                    {
                        myButton?.isEnabled = false
                    }
                    else
                    {
                        myButton?.isEnabled = true
                    }
                }
            }
            
            //Button Image Setup
            
            for i in 0...12
            {
                let myButton : UIButton? = cardButtonCollection?[i]
                
                let cardImage = UIImage(named: buttonStringCollection[i])!
                myButton?.setImage(cardImage, for: .normal)
            }
            
            //Card Visible Setup
            for i in 0...12
            {
                let myButton : UIButton? = cardButtonCollection?[i]
                
                //Button Shown Setup
                myButton?.isHidden = false
            }
            
		}
        //If Card Hand Is Not Full
		else
		{
            print("Hand Not Full")
            //Start With All Cards Hidden
            for i in 0...12
            {
                let myButton : UIButton? = cardButtonCollection?[i]
                
                //Button Shown Setup
                myButton?.isHidden = true
            }
            
            if playerCardCount == 0
            {
            }
            else
            {
                //Button String Setup
                for i in 0...(playerCardCount - 1)
                {
                    buttonStringCollection[i] = player4CardsArray[i]
                }
                
                //Setup All Cards In Play
                for i in 0...(playerCardCount - 1)
                {
                    let myButton : UIButton? = cardButtonCollection?[i]
                    
                    //Show All Cards In Play
                    myButton?.isHidden = false
                    
                    //Enable All Cards In Play
                    myButton?.isEnabled = true

                    //Setup Card Image In Play
                    let cardImage = UIImage(named: buttonStringCollection[i])
                    myButton?.setImage(cardImage, for: .normal)
                }
            }
		}
	}
	
	func player1SelectedCard()
	{
        let originalFrame = leftCardPlayed?.frame
        var startingFrame: CGRect

        if UIDevice.current.userInterfaceIdiom == .pad
        {
            startingFrame = CGRect(x: 0.0, y: 528.0, width: 87.0, height: 116.0)
        }
        else
        {
            startingFrame = CGRect(x: 0.0, y: 396.0, width: 54.0, height: 72.0)
        }

        leftCardPlayed?.frame = startingFrame
        leftCardPlayed?.transform = CGAffineTransform(rotationAngle: .pi)

        UIView.animate(
            withDuration: 0.3,
            delay: 0.0,
            options: .curveEaseOut,
            animations:
                { [self] in
                leftCardPlayed?.frame = originalFrame!
                leftCardPlayed?.transform = CGAffineTransform(rotationAngle: .pi * 2)
            }
        )

        if let cardImage = UIImage(named: cardNameString1!)
        {
            leftCardPlayed?.image = cardImage
        }
        

        if let path = Bundle.main.path(forResource: "cardPlace4", ofType: "wav")
        {
            let pathURL = URL(fileURLWithPath: path)
            var audioEffect: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(pathURL as CFURL, &audioEffect)
            AudioServicesPlaySystemSound(audioEffect)

            DispatchQueue.main.asyncAfter(deadline: .now() + 2)
            {
                AudioServicesDisposeSystemSoundID(audioEffect)
            }
        }
	}
	func player2SelectedCard()
	{
        let originalFrame = topCardPlayed?.frame
        var startingFrame: CGRect

        if UIDevice.current.userInterfaceIdiom == .pad
        {
            startingFrame = CGRect(x: 347.0, y: 207.0, width: 87.0, height: 116.0)
        }
        else
        {
            startingFrame = CGRect(x: 179.0, y: 185.0, width: 54.0, height: 72.0)
        }

        topCardPlayed?.frame = startingFrame
        topCardPlayed?.transform = CGAffineTransform(rotationAngle: .pi)

        UIView.animate(
            withDuration: 0.3,
            delay: 0.0,
            options: .curveEaseOut,
            animations:
                { [self] in
                    topCardPlayed?.frame = originalFrame!
                    topCardPlayed?.transform = CGAffineTransform(rotationAngle: .pi * 2)
            }
        )

        if let cardImage = UIImage(named: cardNameString2!)
        {
            topCardPlayed?.image = cardImage
        }

        if let path = Bundle.main.path(forResource: "cardPlace3", ofType: "wav")
        {
            let pathURL = URL(fileURLWithPath: path)
            var audioEffect: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(pathURL as CFURL, &audioEffect)
            AudioServicesPlaySystemSound(audioEffect)

            DispatchQueue.main.asyncAfter(deadline: .now() + 2)
            {
                AudioServicesDisposeSystemSoundID(audioEffect)
            }
        }
	}
	func player3SelectedCard()
	{
        let originalFrame = rightCardPlayed?.frame
        var startingFrame: CGRect

        if UIDevice.current.userInterfaceIdiom == .pad
        {
            startingFrame = CGRect(x: 693.0, y: 528.0, width: 87.0, height: 116.0)
        }
        else
        {
            startingFrame = CGRect(x: 430.0, y: 396.0, width: 54.0, height: 72.0)
        }

        rightCardPlayed?.frame = startingFrame
        rightCardPlayed?.transform = CGAffineTransform(rotationAngle: .pi)

        UIView.animate(
            withDuration: 0.3,
            delay: 0.0,
            options: .curveEaseOut,
            animations:
                { [self] in
                    rightCardPlayed?.frame = originalFrame!
                    rightCardPlayed?.transform = CGAffineTransform(rotationAngle: .pi * 2)
            }
        )

        if let cardImage = UIImage(named: cardNameString3!)
        {
            rightCardPlayed?.image = cardImage
        }

        if let path = Bundle.main.path(forResource: "cardPlace4", ofType: "wav")
        {
            let pathURL = URL(fileURLWithPath: path)
            var audioEffect: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(pathURL as CFURL, &audioEffect)
            AudioServicesPlaySystemSound(audioEffect)

            DispatchQueue.main.asyncAfter(deadline: .now() + 2)
            {
                AudioServicesDisposeSystemSoundID(audioEffect)
            }
        }
	}
	func player4SelectedCard()
	{
		if cardFlicked == true
        {
            
        }
        else
        {
            let originalFrame = bottomCardPlayed?.frame
            var startingFrame = CGRect(x: 0.0, y: 0.0, width: 54.0, height: 72.0)
            
            if player4CardPlayed == 1
            {
                if UIDevice.current.userInterfaceIdiom == .pad
                {
                    startingFrame = CGRect(x: 64.0, y: 891.0, width: 87.0, height: 116.0)
                }
                else
                {
                    startingFrame = CGRect(x: 11.0, y: 685.0, width: 54.0, height: 72.0)
                }
            }
            else if player4CardPlayed == 2
            {
                if UIDevice.current.userInterfaceIdiom == .pad
                {
                    startingFrame = CGRect(x: 169.0, y: 891.0, width: 87.0, height: 116.0)
                }
                else
                {
                    startingFrame = CGRect(x: 67.0, y: 685.0, width: 54.0, height: 72.0)
                }
            }
            else if player4CardPlayed == 3
            {
                if UIDevice.current.userInterfaceIdiom == .pad
                {
                    startingFrame = CGRect(x: 272.0, y: 891.0, width: 87.0, height: 116.0)
                }
                else
                {
                    startingFrame = CGRect(x: 123.0, y: 685.0, width: 54.0, height: 72.0)
                }
            }
            else if player4CardPlayed == 4
            {
                if UIDevice.current.userInterfaceIdiom == .pad
                {
                    startingFrame = CGRect(x: 375.0, y: 891.0, width: 87.0, height: 116.0)
                }
                else
                {
                    startingFrame = CGRect(x: 179.0, y: 685.0, width: 54.0, height: 72.0)
                }
            }
            else if player4CardPlayed == 5
            {
                if UIDevice.current.userInterfaceIdiom == .pad
                {
                    startingFrame = CGRect(x: 478.0, y: 891.0, width: 87.0, height: 116.0)
                }
                else
                {
                    startingFrame = CGRect(x: 235.0, y: 685.0, width: 54.0, height: 72.0)
                }
            }
            else if player4CardPlayed == 6
            {
                if UIDevice.current.userInterfaceIdiom == .pad
                {
                    startingFrame = CGRect(x: 581.0, y: 891.0, width: 87.0, height: 116.0)
                }
                else
                {
                    startingFrame = CGRect(x: 291.0, y: 685.0, width: 54.0, height: 72.0)
                }
            }
            else if player4CardPlayed == 7
            {
                if UIDevice.current.userInterfaceIdiom == .pad
                {
                    startingFrame = CGRect(x: 684.0, y: 891.0, width: 87.0, height: 116.0)
                }
                else
                {
                    startingFrame = CGRect(x: 347.0, y: 685.0, width: 54.0, height: 72.0)
                }
            }
            else if player4CardPlayed == 8
            {
                if UIDevice.current.userInterfaceIdiom == .pad
                {
                    startingFrame = CGRect(x: 116.0, y: 1015.0, width: 87.0, height: 116.0)
                }
                else
                {
                    startingFrame = CGRect(x: 38.0, y: 685.0, width: 54.0, height: 72.0)
                }
            }
            else if player4CardPlayed == 9
            {
                if UIDevice.current.userInterfaceIdiom == .pad
                {
                    startingFrame = CGRect(x: 219.0, y: 1015.0, width: 87.0, height: 116.0)
                }
                else
                {
                    startingFrame = CGRect(x: 94.0, y: 685.0, width: 54.0, height: 72.0)
                }
            }
            else if player4CardPlayed == 10
            {
                if UIDevice.current.userInterfaceIdiom == .pad
                {
                    startingFrame = CGRect(x: 322.0, y: 1015.0, width: 87.0, height: 116.0)
                }
                else
                {
                    startingFrame = CGRect(x: 150.0, y: 685.0, width: 54.0, height: 72.0)
                }
            }
            else if player4CardPlayed == 11
            {
                if UIDevice.current.userInterfaceIdiom == .pad
                {
                    startingFrame = CGRect(x: 425.0, y: 1015.0, width: 87.0, height: 116.0)
                }
                else
                {
                    startingFrame = CGRect(x: 206.0, y: 685.0, width: 54.0, height: 72.0)
                }
            }
            else if player4CardPlayed == 12
            {
                if UIDevice.current.userInterfaceIdiom == .pad
                {
                    startingFrame = CGRect(x: 528.0, y: 1015.0, width: 87.0, height: 116.0)
                }
                else
                {
                    startingFrame = CGRect(x: 262.0, y: 685.0, width: 54.0, height: 72.0)
                }
            }
            else if player4CardPlayed == 13
            {
                if UIDevice.current.userInterfaceIdiom == .pad
                {
                    startingFrame = CGRect(x: 631.0, y: 1015.0, width: 87.0, height: 116.0)
                }
                else
                {
                    startingFrame = CGRect(x: 318.0, y: 685.0, width: 54.0, height: 72.0)
                }
            }
            else
            {
            }

            bottomCardPlayed?.frame = startingFrame
            bottomCardPlayed?.transform = CGAffineTransform(rotationAngle: .pi)

            UIView.animate(
                withDuration: 0.3,
                delay: 0.0,
                options: .curveEaseOut,
                animations:
                    { [self] in
                        bottomCardPlayed?.frame = originalFrame!
                        bottomCardPlayed?.transform = CGAffineTransform(rotationAngle: .pi * 2)
                }
            )

            if let cardImage = UIImage(named: cardNameString4!)
            {
                bottomCardPlayed?.image = cardImage
            }

            if let path = Bundle.main.path(forResource: "cardPlace3", ofType: "wav")
            {
                let pathURL = URL(fileURLWithPath: path)
                var audioEffect: SystemSoundID = 0
                AudioServicesCreateSystemSoundID(pathURL as CFURL, &audioEffect)
                AudioServicesPlaySystemSound(audioEffect)

                DispatchQueue.main.asyncAfter(deadline: .now() + 2)
                {
                    AudioServicesDisposeSystemSoundID(audioEffect)
                }
            }
        }
	}
	
	func compareCards()
	{
        statusLabel1?.isHidden = true
        statusLabel2?.isHidden = true
        cardFlicked = false
        
        //Check If Spades Is Broken
        let checkSpadesBroken = cardDeckSetup.checkSpadesBroken(checkSpadesBroken: spadesBroken, leftValue: leftCardValue, topValue: topCardValue, rightValue: rightCardValue, bottomValue: bottomCardValue)
        
        spadesBroken = checkSpadesBroken
        
        //Check If Aces Played
        let checkAcePlayed = gameAchievementSetup.checkAcePlayed(aceClubPlayed: aceClubsPlayed, aceDiamondPlayed: aceDiamondsPlayed, aceHeartPlayed: aceHeartsPlayed, startingSuit: startingSuit!, leftValue: leftCardValue, topValue: topCardValue, rightValue: rightCardValue, bottomValue: bottomCardValue)
        
        aceClubsPlayed = checkAcePlayed.0
        aceDiamondsPlayed = checkAcePlayed.1
        aceHeartsPlayed = checkAcePlayed.2
        
        //Check If Twos Played
        let checkTwoPlayed = gameAchievementSetup.checkTwosPlayed(twoClubPlayed: twoClubs, twoDiamondPlayed: twoDiamonds, twoHeartPlayed: twoHearts,  startingSuit: startingSuit!, leftValue: leftCardValue, topValue: topCardValue, rightValue: rightCardValue, bottomValue: bottomCardValue)
        
        twoClubs = checkTwoPlayed.0
        twoDiamonds = checkTwoPlayed.1
        twoHearts = checkTwoPlayed.2
        
        //Compare Cards Played
        if startingSuit!.hasPrefix("Club")
        {
            if cardNameString1!.hasPrefix("Club") || cardNameString1!.hasPrefix("Spade")
            {
            }
            else
            {
                leftCardValue = 0;
            }
            if cardNameString2!.hasPrefix("Club") || cardNameString2!.hasPrefix("Spade")
            {
            }
            else
            {
                topCardValue = 0;
            }
            if cardNameString3!.hasPrefix("Club") || cardNameString3!.hasPrefix("Spade")
            {
            }
            else
            {
                rightCardValue = 0;
            }
            if cardNameString4!.hasPrefix("Club") || cardNameString4!.hasPrefix("Spade")
            {
            }
            else
            {
                bottomCardValue = 0;
            }
        }
        else if startingSuit!.hasPrefix("Diamond")
        {
            if cardNameString1!.hasPrefix("Diamond") || cardNameString1!.hasPrefix("Spade")
            {
            }
            else
            {
                leftCardValue = 0;
            }
            if cardNameString2!.hasPrefix("Diamond") || cardNameString2!.hasPrefix("Spade")
            {
            }
            else
            {
                topCardValue = 0;
            }
            if cardNameString3!.hasPrefix("Diamond") || cardNameString3!.hasPrefix("Spade")
            {
            }
            else
            {
                rightCardValue = 0;
            }
            if cardNameString4!.hasPrefix("Diamond") || cardNameString4!.hasPrefix("Spade")
            {
            }
            else
            {
                bottomCardValue = 0;
            }
        }
        else if startingSuit!.hasPrefix("Heart")
        {
            if cardNameString1!.hasPrefix("Heart") || cardNameString1!.hasPrefix("Spade")
            {
            }
            else
            {
                leftCardValue = 0;
            }
            if cardNameString2!.hasPrefix("Heart") || cardNameString2!.hasPrefix("Spade")
            {
            }
            else
            {
                topCardValue = 0;
            }
            if cardNameString3!.hasPrefix("Heart") || cardNameString3!.hasPrefix("Spade")
            {
            }
            else
            {
                rightCardValue = 0;
            }
            if cardNameString4!.hasPrefix("Heart") || cardNameString4!.hasPrefix("Spade")
            {
            }
            else
            {
                bottomCardValue = 0;
            }
        }
        else
        {
            if cardNameString1!.hasPrefix("Spade")
            {
            }
            else
            {
                leftCardValue = 0;
            }
            if cardNameString2!.hasPrefix("Spade")
            {
            }
            else
            {
                topCardValue = 0;
            }
            if cardNameString3!.hasPrefix("Spade")
            {
            }
            else
            {
                rightCardValue = 0;
            }
            if cardNameString4!.hasPrefix("Spade")
            {
            }
            else
            {
                bottomCardValue = 0;
            }
        }
        print("leftcard value =  %d", leftCardValue)
        print("rightcard value =  %d", rightCardValue)
        print("topcard value =  %d", topCardValue)
        print("bottomcard value =  %d", bottomCardValue)
        
        print("Player 1 Count : \(player1CardsArray.count)")
        print("Player 2 Count : \(player2CardsArray.count)")
        print("Player 3 Count : \(player3CardsArray.count)")
        print("Player 4 Count : \(player4CardsArray.count)")
        
        if leftCardValue > topCardValue && leftCardValue > rightCardValue && leftCardValue > bottomCardValue
        {
            //Set New Score
            teamOneBooks = teamOneBooks + 1
            player1Books = player1Books + 1
            print("TeamOne Books =  %d", teamOneBooks)

            //Reset Going Order
            leftGoingOrder = 1;
            topGoingOrder = 2;
            rightGoingOrder = 3;
            bottomGoingOrder = 4;
           
            //Clear Card Image Played
            leftCardPlayed?.image = nil
            topCardPlayed?.image = nil
            rightCardPlayed?.image = nil
            bottomCardPlayed?.image = nil

            bottomCardPlayed?.layer.borderWidth = 3

            print("Player 1 Wins")
            
            score1Label?.text = String(format: "Books : %li", Int(teamOneBooks))
            score2Label?.text = String(format: "Books : %li", Int(teamTwoBooks))
            statusLabel1?.text = "Player 1 Starts"
            
            //Reset Card Values
            leftCardValue = 0;
            topCardValue = 0;
            rightCardValue = 0;
            bottomCardValue = 0;
            
            if player1CardsArray.count == 0
            {
                print("game over 0")
                gameOver()
            }
            else if teamOneBooks == 7 || teamTwoBooks == 7
            {
                print("game over 7")
                gameOver()
            }
            else
            {
                print("Pos 1 Goes")
                position1Goes()
            }
        }
        
        else if topCardValue > leftCardValue && topCardValue > rightCardValue && topCardValue > bottomCardValue
        {
            //Set New Score
            teamTwoBooks = teamTwoBooks + 1
            player2Books = player2Books + 1
            print("TeamTwo Books =  %d", teamTwoBooks)

            //Reset Going Order
            leftGoingOrder = 4
            topGoingOrder = 1
            rightGoingOrder = 2
            bottomGoingOrder = 3
            
            //Clear Card Image Played
            leftCardPlayed?.image = nil
            topCardPlayed?.image = nil
            rightCardPlayed?.image = nil
            bottomCardPlayed?.image = nil
            bottomCardPlayed?.layer.borderWidth = 3
            
            print("Player 2 Wins")
            
            score1Label?.text = String(format: "Books : %li", Int(teamOneBooks))
            score2Label?.text = String(format: "Books : %li", Int(teamTwoBooks))
            statusLabel1?.text = "Player 2 Starts"
            
            //Reset Card Values
            leftCardValue = 0
            topCardValue = 0
            rightCardValue = 0
            bottomCardValue = 0
            
            if player2CardsArray.count == 0
            {
                print("game over 0")
                gameOver()
            }
            else if teamOneBooks == 7 || teamTwoBooks == 7
            {
                print("game over 7")
                gameOver()
            }
            else
            {
                print("Pos 2 Goes")
                position2Goes()
            }
        }
        else if rightCardValue > topCardValue && rightCardValue > leftCardValue && rightCardValue > bottomCardValue
        {
            //Set New Score
            teamOneBooks = teamOneBooks + 1
            player3Books = player3Books + 1
            print("TeamOne Books =  %d", teamOneBooks)

            //Reset Going Order
            leftGoingOrder = 3
            topGoingOrder = 4
            rightGoingOrder = 1
            bottomGoingOrder = 2
            
            //Clear Card Image Played
            leftCardPlayed?.image = nil
            topCardPlayed?.image = nil
            rightCardPlayed?.image = nil
            bottomCardPlayed?.image = nil
            bottomCardPlayed?.layer.borderWidth = 3
            
            print("Player 3 Wins")
            
            score1Label?.text = String(format: "Books : %li", Int(teamOneBooks))
            score2Label?.text = String(format: "Books : %li", Int(teamTwoBooks))
            statusLabel1?.text = "Player 3 Starts"
            
            //Reset Card Values
            leftCardValue = 0
            topCardValue = 0
            rightCardValue = 0
            bottomCardValue = 0
            
            if player3CardsArray.count == 0
            {
                print("game over 0")
                gameOver()
            }
            else if teamOneBooks == 7 || teamTwoBooks == 7
            {
                print("game over 7")
                gameOver()
            }
            else
            {
                print("Pos 3 Goes")
                position3Goes()
            }
        }
        else
        {
            //Set New Score
            teamTwoBooks = teamTwoBooks + 1
            player4Books = player4Books + 1
            print("TeamTwo Books =  %d", teamTwoBooks)

            //Reset Going Order
            leftGoingOrder = 2
            topGoingOrder = 3
            rightGoingOrder = 4
            bottomGoingOrder = 1
            
            //Clear Card Image Played
            leftCardPlayed?.image = nil
            topCardPlayed?.image = nil
            rightCardPlayed?.image = nil
            bottomCardPlayed?.image = nil
            bottomCardPlayed?.layer.borderWidth = 3
            
            print("Player 4 Wins")
            
            score1Label?.text = String(format: "Books : %li", Int(teamOneBooks))
            score2Label?.text = String(format: "Books : %li", Int(teamTwoBooks))
            statusLabel1?.text = "Player 4 Starts"
            
            //Reset Card Values
            leftCardValue = 0
            topCardValue = 0
            rightCardValue = 0
            bottomCardValue = 0
            
            if player4CardsArray.count == 0
            {
                print("game over 0")
                gameOver()
            }
            else if teamOneBooks == 7 || teamTwoBooks == 7
            {
                print("game over 7")
                gameOver()
                
            }
            else
            {
                print("Pos 4 Goes")
                position4Goes()
            }
        }
	}
	
	func gameOver()
	{
		print("Game Over")
        if teamOneBooks == 7
        {
            print("Team One Wins!")
        }
        else
        {
            print("Team Two Wins!")
        }
        //Show Game Over Screen
        gameOverView?.isHidden = false
	}
    
    //User Card Selected Functions
    func userCardSelectedFirst()
    {
        if cardNameString4!.hasPrefix("Club")
        {
            startingSuit = "Club"
            cardSuitString4 = "Club"
        }
        else if cardNameString4!.hasPrefix("Diamond")
        {
            startingSuit = "Diamond"
            cardSuitString4 = "Diamond"
        }
        else if cardNameString4!.hasPrefix("Heart")
        {
            startingSuit = "Heart"
            cardSuitString4 = "Heart"
        }
        else
        {
            startingSuit = "Spade"
            cardSuitString4 = "Spade"
        }
    }
    func userCardSelectedAfter()
    {
        if cardNameString4!.hasPrefix("Club")
        {
            cardSuitString4 = "Club"
        }
        else if cardNameString4!.hasPrefix("Diamond")
        {
            cardSuitString4 = "Diamond"
        }
        else if cardNameString4!.hasPrefix("Heart")
        {
            cardSuitString4 = "Heart"
        }
        else
        {
            cardSuitString4 = "Spade"
            spadesBrokenDisplay()
        }
    }
    func spadesBrokenDisplay()
    {
        if spadesBroken == false
        {
            spadesBroken = true
            statusLabel1?.isHidden = false
            statusLabel1?.text = "Spades Broken"
            statusLabel1?.alpha = 0.0
            UIView.animate(withDuration: 2.0, animations: { [self] in
                statusLabel1?.alpha = 1.0
            }) { [self] finished in
                UIView.animate(withDuration: 2.0, animations: { [self] in
                    statusLabel1?.alpha = 0.0
                })
            }
        }
        else
        {
        }
    }
    
    func afterUserCardSelected()
    {
        //Disable All Cards
        for i in 0...12
        {
            let myButton : UIButton? = cardButtonCollection?[i]
            
            myButton?.isEnabled = false
        }
        
        if bottomGoingOrder == 4
        {
            let delayInSeconds = 1.0
            let popTime = DispatchTime.now() + delayInSeconds
            DispatchQueue.main.asyncAfter(deadline: popTime)
            {
                self.compareCards()
            }
        }
        else
        {
            let delayInSeconds = 1.0
            let popTime = DispatchTime.now() + delayInSeconds
            DispatchQueue.main.asyncAfter(deadline: popTime)
            {
                self.position1Goes()
                print("Player 1 Goes After 4")

            }
        }
        
    }
	
	// MARK: - Computer Players

	func compPlayerStarts()
	{
        //Variables
        let compPlayerSetup = ComputerPlayerProfiles()
        
        //Setup Computer Players
        if compPlayerGoing == 1
        {
            let compPlayerValues = compPlayerSetup.compPlayer1Starts(playerArrayPassed: player1CardsArray, spadesBrokenPassed: spadesBroken, aceClubsPlayedPassed: aceClubsPlayed, aceDiamondsPlayedPassed: aceDiamondsPlayed, aceHeartsPlayedPassed: aceHeartsPlayed, twoHeartsPassed: twoHearts, twoClubsPassed: twoClubs, twoDiamondsPassed: twoDiamonds)
            cardNameString1 = compPlayerValues.0
            cardSuitString1 = compPlayerValues.1
            startingSuit = compPlayerValues.2
            
            let nonDigits = CharacterSet.decimalDigits.inverted
            leftCardValue = Int(cardNameString1!.trimmingCharacters(in: nonDigits)) ?? 0
            
            player1SelectedCard()
            
            // Remove card from array
            player1CardsArray.removeAll { $0 as AnyObject === cardNameString1 as AnyObject }
        }
        else if compPlayerGoing == 2
        {
            let compPlayerValues = compPlayerSetup.compPlayer1Starts(playerArrayPassed: player2CardsArray, spadesBrokenPassed: spadesBroken, aceClubsPlayedPassed: aceClubsPlayed, aceDiamondsPlayedPassed: aceDiamondsPlayed, aceHeartsPlayedPassed: aceHeartsPlayed, twoHeartsPassed: twoHearts, twoClubsPassed: twoClubs, twoDiamondsPassed: twoDiamonds)
            cardNameString2 = compPlayerValues.0
            cardSuitString2 = compPlayerValues.1
            startingSuit = compPlayerValues.2
            
            let nonDigits = CharacterSet.decimalDigits.inverted
            topCardValue = Int(cardNameString2!.trimmingCharacters(in: nonDigits)) ?? 0
            
            player2SelectedCard()
            
            // Remove card from array
            player2CardsArray.removeAll { $0 as AnyObject === cardNameString2 as AnyObject }
        }
        else
        {
            let compPlayerValues = compPlayerSetup.compPlayer1Starts(playerArrayPassed: player3CardsArray, spadesBrokenPassed: spadesBroken, aceClubsPlayedPassed: aceClubsPlayed, aceDiamondsPlayedPassed: aceDiamondsPlayed, aceHeartsPlayedPassed: aceHeartsPlayed, twoHeartsPassed: twoHearts, twoClubsPassed: twoClubs, twoDiamondsPassed: twoDiamonds)
            cardNameString3 = compPlayerValues.0
            cardSuitString3 = compPlayerValues.1
            startingSuit = compPlayerValues.2
            
            let nonDigits = CharacterSet.decimalDigits.inverted
            rightCardValue = Int(cardNameString3!.trimmingCharacters(in: nonDigits)) ?? 0
            
            player3SelectedCard()
            
            // Remove card from array
            player3CardsArray.removeAll { $0 as AnyObject === cardNameString3 as AnyObject }
        }
        
        let delayInSeconds = 1.0
        let popTime = DispatchTime.now() + delayInSeconds
        DispatchQueue.main.asyncAfter(deadline: popTime) { [self] in
            if compPlayerGoing == 1
            {
                position2Goes()
            }
            else if compPlayerGoing == 2
            {
                position3Goes()
            }
            else
            {
                position4Goes()
            }
        }
	}
	func compPlayerReacts()
	{
        //Variables
        let compPlayerSetup = ComputerPlayerProfiles()
        
        //Setup Computer Players
        if compPlayerGoing == 1
        {
            let compPlayerValues = compPlayerSetup.compPlayer1Reacts(playerArrayPassed: player1CardsArray, startingSuitPassed: startingSuit, leftCardValuePassed: leftCardValue, topCardValuePassed: topCardValue, rightCardValuePassed: rightCardValue, bottomCardValuePassed: bottomCardValue, compPlayerGoingPassed: compPlayerGoing)
            cardNameString1 = compPlayerValues
            
            let nonDigits = CharacterSet.decimalDigits.inverted
            leftCardValue = Int(cardNameString1!.trimmingCharacters(in: nonDigits)) ?? 0
            
            player1SelectedCard()
            
            // Remove card from array
            player1CardsArray.removeAll { $0 as AnyObject === cardNameString1 as AnyObject }
        }
        else if compPlayerGoing == 2
        {
            let compPlayerValues = compPlayerSetup.compPlayer1Reacts(playerArrayPassed: player2CardsArray, startingSuitPassed: startingSuit, leftCardValuePassed: leftCardValue, topCardValuePassed: topCardValue, rightCardValuePassed: rightCardValue, bottomCardValuePassed: bottomCardValue, compPlayerGoingPassed: compPlayerGoing)
            cardNameString2 = compPlayerValues
            
            let nonDigits = CharacterSet.decimalDigits.inverted
            topCardValue = Int(cardNameString2!.trimmingCharacters(in: nonDigits)) ?? 0
            
            player2SelectedCard()
            
            // Remove card from array
            player2CardsArray.removeAll { $0 as AnyObject === cardNameString2 as AnyObject }
        }
        else
        {
            let compPlayerValues = compPlayerSetup.compPlayer1Reacts(playerArrayPassed: player3CardsArray, startingSuitPassed: startingSuit, leftCardValuePassed: leftCardValue, topCardValuePassed: topCardValue, rightCardValuePassed: rightCardValue, bottomCardValuePassed: bottomCardValue, compPlayerGoingPassed: compPlayerGoing)
            cardNameString3 = compPlayerValues
            
            let nonDigits = CharacterSet.decimalDigits.inverted
            rightCardValue = Int(cardNameString3!.trimmingCharacters(in: nonDigits)) ?? 0
            
            player3SelectedCard()
            
            // Remove card from array
            player3CardsArray.removeAll { $0 as AnyObject === cardNameString3 as AnyObject }
        }
        
        let delayInSeconds = 1.0
        let popTime = DispatchTime.now() + delayInSeconds
        DispatchQueue.main.asyncAfter(deadline: popTime) { [self] in
            if compPlayerGoing == 1
            {
                if leftGoingOrder == 4
                {
                    compareCards()
                }
                else
                {
                    position2Goes()
                }
            }
            else if compPlayerGoing == 2
            {
                if topGoingOrder == 4
                {
                    compareCards()
                }
                else
                {
                    position3Goes()
                }
            }
            else
            {
                if rightGoingOrder == 4
                {
                    compareCards()
                }
                else
                {
                    position4Goes()
                }
            }
        }
	}
    
    // MARK: - User Actions
    
    @IBAction func cardSelected(sender: UIButton)
    {
        //Variables
        var cardIndex: Int = 0
        let nonDigits = CharacterSet.decimalDigits.inverted

        switch sender
        {
        case card1:
            
            print ("Card 1 Selected")
            cardNameString4 = player4CardsArray[0]
            cardIndex = 0
            
        case card2:
            
            print ("Card 2 Selected")
            
            //Card String Setup
            cardNameString4 = player4CardsArray[1]
            cardIndex = 1

        case card3:
            
            print ("Card 3 Selected")
            
            //Card String Setup
            cardNameString4 = player4CardsArray[2]
            cardIndex = 2

        case card4:
            
            print ("Card 4 Selected")
            cardNameString4 = player4CardsArray[3]
            cardIndex = 3

        case card5:
            
            print ("Card 5 Selected")
            cardNameString4 = player4CardsArray[4]
            cardIndex = 4

        case card6:
            
            print ("Card 6 Selected")
            cardNameString4 = player4CardsArray[5]
            cardIndex = 5

        case card7:
            
            print ("Card 7 Selected")
            cardNameString4 = player4CardsArray[6]
            cardIndex = 6

        case card8:
            
            print ("Card 8 Selected")
            cardNameString4 = player4CardsArray[7]
            cardIndex = 7

        case card9:
            
            print ("Card 9 Selected")
            cardNameString4 = player4CardsArray[8]
            cardIndex = 8

        case card10:
            
            print ("Card 10 Selected")
            cardNameString4 = player4CardsArray[9]
            cardIndex = 9

        case card11:
            
            print ("Card 11 Selected")
            cardNameString4 = player4CardsArray[10]
            cardIndex = 10

        case card12:
            
            print ("Card 12 Selected")
            cardNameString4 = player4CardsArray[11]
            cardIndex = 11

        case card13:
            
            print ("Card 13 Selected")
            cardNameString4 = player4CardsArray[12]
            cardIndex = 12

        default:
            break

        }
        
        //Card Played Setup
        if bottomGoingOrder == 1
        {
            userCardSelectedFirst()
            if spadesBroken == true
            {
                bottomCardValue = Int(cardNameString4!.trimmingCharacters(in: nonDigits)) ?? 0
                
                player4CardPlayed = cardIndex + 1;
                player4SelectedCard()
                
                // remove card from array
                player4CardsArray.remove(at: cardIndex)
                
                position4Goes()
                
                afterUserCardSelected()
            }
            else
            {
                //If Spades Has Not Been Broken
                if cardNameString4!.hasPrefix("Spade")
                {
                    self.cardButtonCollection?[cardIndex].transform = CGAffineTransform(translationX: 20, y: 0)
                    UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
                        self.cardButtonCollection?[cardIndex].transform = CGAffineTransform.identity
                    }, completion: nil)
                    
                    statusLabel1?.isHidden = false
                    statusLabel1?.text = "Spades Not Broken"
                    statusLabel1?.alpha = 0.0
                    UIView.animate(withDuration: 2.0, animations: { [self] in
                        statusLabel1?.alpha = 1.0
                    }) { [self] finished in
                        UIView.animate(withDuration: 2.0, animations: { [self] in
                            statusLabel1?.alpha = 0.0
                        })
                    }
                }
                else
                {
                    bottomCardValue = Int(cardNameString4!.trimmingCharacters(in: nonDigits)) ?? 0
                    
                    player4CardPlayed = cardIndex + 1;
                    player4SelectedCard()
                    
                    // remove card from array
                    player4CardsArray.remove(at: cardIndex)
                    
                    position4Goes()
                    
                    afterUserCardSelected()
                }
            }
        }
        else
        {
            userCardSelectedAfter()
            
            //Variables
            let tempArrayClub = player4CardsArray.filter(){ $0.contains("Club") }
            let tempArrayDiamond = player4CardsArray.filter(){ $0.contains("Diamond") }
            let tempArrayHeart = player4CardsArray.filter(){ $0.contains("Heart") }
            let tempArraySpade = player4CardsArray.filter(){ $0.contains("Spade") }
            var tempArraySuit:[String] = []
            
            //Setup Temp Array
            if startingSuit!.hasPrefix("Club")
            {
                tempArraySuit = tempArrayClub
            }
            else if startingSuit!.hasPrefix("Diamond")
            {
                tempArraySuit = tempArrayDiamond
            }
            else if startingSuit!.hasPrefix("Heart")
            {
                tempArraySuit = tempArrayHeart
            }
            else
            {
                tempArraySuit = tempArraySpade
            }
            
            if cardNameString4!.hasPrefix(startingSuit!)
            {
                bottomCardValue = Int(cardNameString4!.trimmingCharacters(in: nonDigits)) ?? 0
                
                player4CardPlayed = cardIndex + 1;
                player4SelectedCard()
                
                // remove card from array
                player4CardsArray.remove(at: cardIndex)
                
                position4Goes()
                
                afterUserCardSelected()
            }
            else if tempArraySuit.count > 0
            {
                self.cardButtonCollection?[cardIndex].transform = CGAffineTransform(translationX: 20, y: 0)
                UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
                    self.cardButtonCollection?[cardIndex].transform = CGAffineTransform.identity
                }, completion: nil)
                
                statusLabel1?.isHidden = false
                statusLabel1?.text  = String(format: "Starting Suit is %@", startingSuit!)
                statusLabel1?.alpha = 0.0
                UIView.animate(withDuration: 2.0, animations: { [self] in
                    statusLabel1?.alpha = 1.0
                }) { [self] finished in
                    UIView.animate(withDuration: 2.0, animations: { [self] in
                        statusLabel1?.alpha = 0.0
                    })
                }
            }
            else
            {
                bottomCardValue = Int(cardNameString4!.trimmingCharacters(in: nonDigits)) ?? 0
                
                player4CardPlayed = cardIndex + 1;
                player4SelectedCard()
                
                // remove card from array
                player4CardsArray.remove(at: cardIndex)
                
                position4Goes()
                
                afterUserCardSelected()
            }
        }
    }
    
    @IBAction func toHomeScreen(_ sender: UIButton)
    {
        print("Home Button Clicked")
        view.window?.rootViewController?.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func quitButton(_ sender: UIButton)
    {
        print("Quit Button Clicked")
        view.window?.rootViewController?.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func infoButton(_ sender: UIButton)
    {
        print("Info Button Clicked")
        
        let alertVC = UIAlertController(title: "", message: "", preferredStyle: .alert)

            // Title String
            let titleString = NSMutableAttributedString(string: "Game Rules")
            titleString.addAttribute(.font, value: UIFont(name: "AvenirNext-Bold", size: 14.0)!, range: NSRange(location: 0, length: titleString.length))
            titleString.addAttribute(.foregroundColor, value: UIColor.gray, range: NSRange(location: 0, length: titleString.length))
            alertVC.setValue(titleString, forKey: "attributedTitle")

            // Message String
            let messageString = NSMutableAttributedString(string: """
            Begin:

            All players begin with their lowest club. If you have no clubs you can throw any card other than spades.

            Game:

            Your partner is the player across from you. The winner of the book begins the next hand. When the first card is played all remaining players must follow with the same suit. If you have no remaining cards of that suit you can break spades or throw off. The first team to 7 books wins the game.

            Breaking Spades:

            Spades can be broken if you have no remaining other suits or if you don't have the suit of the first card played. Spades can't be broken on the first hand.
            """)
            messageString.addAttribute(.font, value: UIFont(name: "AvenirNext-Regular", size: 14.0)!, range: NSRange(location: 0, length: messageString.length))
            messageString.addAttribute(.foregroundColor, value: UIColor.black, range: NSRange(location: 0, length: messageString.length))
            alertVC.setValue(messageString, forKey: "attributedMessage")

            let okAction = UIAlertAction(title: NSLocalizedString("Done", comment: "OK action"), style: .default, handler: { _ in })
            alertVC.addAction(okAction)
            present(alertVC, animated: true, completion: nil)
    }

}

