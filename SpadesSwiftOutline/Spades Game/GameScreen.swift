//
//  GameScreen.swift
//  SpadesSwiftOutline
//
//  Created by Michael Spade on 10/2/24.
//

import UIKit

class GameScreen: UIViewController {
	
	// MARK: - Properties
	static let sharedInstance = GameScreen()
	
	var deckArray:[String] = []
	var player1CardsArray:[String] = []
	var player2CardsArray:[String] = []
	var player3CardsArray:[String] = []
	var player4CardsArray:[String] = []
	var randomRowsArray:[String] = []
	
	var cardNameString1: String?
	var cardNameString2: String?
	var cardNameString3: String?
	var cardNameString4: String?
	
	var cardSuitString1: String?
	var cardSuitString2: String?
	var cardSuitString3: String?
	var cardSuitString4: String?
	
	var startingSuit: String?
	//public var row: Int = 0
	
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
	@IBOutlet var cardButtonCollection: [UIButton]!
	
	@IBOutlet weak var startGame: UIButton?
	@IBOutlet weak var partnersButton: UIButton?
	@IBOutlet weak var infoButton: UIButton?
	@IBOutlet weak var menuButton: UIButton?
	@IBOutlet weak var infoButton2: UIButton?
	@IBOutlet weak var menuButton2: UIButton?
	@IBOutlet weak var startNewGameButton: UIButton?
	
	@IBOutlet weak var leftCardPlayed: UIImageView?
	@IBOutlet weak var topCardPlayed: UIImageView?
	@IBOutlet weak var rightCardPlayed: UIImageView?
	@IBOutlet weak var bottomCardPlayed: UIImageView?
	@IBOutlet var cardPlayedCollection: [UIImageView]!
	
	@IBOutlet weak var player1: UIImageView?
	@IBOutlet weak var player2: UIImageView?
	@IBOutlet weak var player3: UIImageView?
	@IBOutlet var backgroundImage: UIImageView?
	
	@IBOutlet weak var score1Label: UILabel?
	@IBOutlet weak var score2Label: UILabel?
	@IBOutlet weak var teamWinnerLabel: UILabel?
	@IBOutlet weak var gameOverLabel: UILabel?
	@IBOutlet weak var titleScoreLabel1: UILabel?
	@IBOutlet weak var titleScoreLabel2: UILabel?
	@IBOutlet weak var statusLabel1: UILabel?
	@IBOutlet weak var statusLabel2: UILabel?
	@IBOutlet weak var achievementLabel1: UILabel?
	@IBOutlet weak var achievementLabel2: UILabel?
	@IBOutlet weak var achievementLabel3: UILabel?
	@IBOutlet weak var achievementStatusLabel1: UILabel?
	@IBOutlet weak var achievementStatusLabel2: UILabel?
	@IBOutlet weak var achievementStatusLabel3: UILabel?
	@IBOutlet weak var playerNameLabel1: UILabel?
	@IBOutlet weak var playerNameLabel2: UILabel?
	@IBOutlet weak var playerNameLabel3: UILabel?
	@IBOutlet weak var copyrightLabel: UILabel?
	@IBOutlet weak var rankLabel: UILabel?
	@IBOutlet weak var rankPointsLabel: UILabel?
	@IBOutlet weak var winScoreLabel: UILabel?
	@IBOutlet weak var booksTakenScoreLabel: UILabel?
	@IBOutlet weak var achievementBonusScoreLabel: UILabel?
	@IBOutlet weak var totalGamePointsScoreLabel: UILabel?
	
	@IBOutlet weak var progressView: UIView?
	@IBOutlet weak var progressBar: UIProgressView?
	
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
		for i in 0...(cardButtonCollection.count - 1)  {
			let myButton : UIButton = cardButtonCollection[i]
			
			//Card Image Setup
			myButton.layer.cornerRadius = 5
			myButton.layer.masksToBounds = false
			myButton.layer.shadowOffset = CGSize(width: 5, height: 5)
			myButton.layer.shadowColor = UIColor.black.cgColor
			myButton.layer.shadowOpacity = 0.35
		}
		for i in 0...(cardPlayedCollection.count - 1)
		{
			let cardsPlayedView : UIImageView = cardPlayedCollection[i]
			
			//Card Played Image Setup
			cardsPlayedView.layer.cornerRadius = 5
			cardsPlayedView.layer.masksToBounds = false
			cardsPlayedView.layer.shadowOffset = CGSize(width: 5, height: 5)
			cardsPlayedView.layer.shadowColor = UIColor.black.cgColor
			cardsPlayedView.layer.shadowOpacity = 0.35
		}
		
		//Setup Card Interaction
		cardOriginalFrameCollection = [cardOriginalFrame1, cardOriginalFrame2, cardOriginalFrame3, cardOriginalFrame4, cardOriginalFrame5, cardOriginalFrame6, cardOriginalFrame7, cardOriginalFrame8, cardOriginalFrame9, cardOriginalFrame10, cardOriginalFrame11, cardOriginalFrame12, cardOriginalFrame13]
		
		for i in 0...(cardButtonCollection.count - 1)  {
			let myButton : UIButton = cardButtonCollection[i]
			
			//Card Frame Setup
			cardOriginalFrameCollection[i] = myButton.center
			
			//Card Interaction Setup
			myButton.addTarget(
				self,
				action: Selector(("wasDragged:withEvent:")),
				for: .touchDragInside)
		}

		//Setup Game Score
		teamOneBooks = 0
		teamTwoBooks = 0
		score1Label?.text = String(format: "Books : %li", Int(teamOneBooks))
		score2Label?.text = String(format: "Books : %li", Int(teamTwoBooks))
		inGameBonus = 0
		
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
		let cardDeckSetup = CardSetup()
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
		let cardDeckSetup = CardSetup()
		
		//Deal The Cards
		let playerArrayValues = cardDeckSetup.dealTheCards(deckArrayPassed: deckArray, randowRowsArrayPassed: randomRowsArray)
		player1CardsArray = playerArrayValues.0
		player2CardsArray = playerArrayValues.1
		player3CardsArray = playerArrayValues.2
		player4CardsArray = playerArrayValues.3
		
		for i in 0...(cardButtonCollection.count - 1)  {
			let myButton : UIButton = cardButtonCollection[i]
			
			//Card Image Setup
			myButton.isHidden = false
			myButton.isEnabled = false
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
		if leftGoingOrder == 1
		{
			if player1CardsArray.count == 13
			{
				//select object at index 0, lowest club
				cardNameString1 = player1CardsArray[0]
				
				// get card suit
				// set suit = clubs
				if ((cardNameString1?.hasPrefix("Club")) != nil)
				{
					cardSuitString1 = "Club"
					startingSuit = "Club"
				}
				else if ((cardNameString1?.hasPrefix("Diamond")) != nil)
				{
					cardSuitString1 = "Diamond"
					startingSuit = "Club"
				}
				else if ((cardNameString1?.hasPrefix("Heart")) != nil)
				{
					cardSuitString1 = "Heart"
					startingSuit = "Club"
				}
				else
				{
					cardSuitString1 = "Spade"
					startingSuit = "Club"
					spadesBroken = true
				}
				
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

				// get card suit
				// set suit = clubs
				if ((cardNameString1?.hasPrefix("Club")) != nil)
				{
					cardSuitString1 = "Club";
					startingSuit = "Club";
				}
				else if ((cardNameString1?.hasPrefix("Diamond")) != nil)
				{
					cardSuitString1 = "Diamond";
					startingSuit = "Club";
				}
				else if ((cardNameString1?.hasPrefix("Heart")) != nil)
				{
					cardSuitString1 = "Heart";
					startingSuit = "Club";
				}
				else
				{
					cardSuitString1 = "Spade";
					startingSuit = "Club";
					spadesBroken = true
				}
				// set position 1 card value
				let nonDigits = CharacterSet.decimalDigits.inverted
				leftCardValue = Int(cardNameString1!.trimmingCharacters(in: nonDigits)) ?? 0

				self.player1SelectedCard()

				// remove card from array
				player1CardsArray.remove(at: 0)

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
		if topGoingOrder == 1
		{
			if player2CardsArray.count == 13
			{
				//select object at index 0, lowest club
				cardNameString2 = player2CardsArray[0]
				
				// get card suit
				// set suit = clubs
				if ((cardNameString2?.hasPrefix("Club")) != nil)
				{
					cardSuitString2 = "Club"
					startingSuit = "Club"
				}
				else if ((cardNameString2?.hasPrefix("Diamond")) != nil)
				{
					cardSuitString2 = "Diamond"
					startingSuit = "Club"
				}
				else if ((cardNameString2?.hasPrefix("Heart")) != nil)
				{
					cardSuitString2 = "Heart"
					startingSuit = "Club"
				}
				else
				{
					cardSuitString2 = "Spade"
					startingSuit = "Club"
					spadesBroken = true
				}
				
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

				// get card suit
				// set suit = clubs
				if ((cardNameString2?.hasPrefix("Club")) != nil)
				{
					cardSuitString2 = "Club";
					startingSuit = "Club";
				}
				else if ((cardNameString2?.hasPrefix("Diamond")) != nil)
				{
					cardSuitString2 = "Diamond";
					startingSuit = "Club";
				}
				else if ((cardNameString2?.hasPrefix("Heart")) != nil)
				{
					cardSuitString2 = "Heart";
					startingSuit = "Club";
				}
				else
				{
					cardSuitString2 = "Spade";
					startingSuit = "Club";
					spadesBroken = true
				}
				// set position 1 card value
				let nonDigits = CharacterSet.decimalDigits.inverted
				topCardValue = Int(cardNameString2!.trimmingCharacters(in: nonDigits)) ?? 0

				self.player2SelectedCard()

				// remove card from array
				player2CardsArray.remove(at: 0)

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
		if rightGoingOrder == 1
		{
			if player3CardsArray.count == 13
			{
				//select object at index 0, lowest club
				cardNameString3 = player3CardsArray[0]
				
				// get card suit
				// set suit = clubs
				if ((cardNameString3?.hasPrefix("Club")) != nil)
				{
					cardSuitString3 = "Club"
					startingSuit = "Club"
				}
				else if ((cardNameString3?.hasPrefix("Diamond")) != nil)
				{
					cardSuitString3 = "Diamond"
					startingSuit = "Club"
				}
				else if ((cardNameString3?.hasPrefix("Heart")) != nil)
				{
					cardSuitString3 = "Heart"
					startingSuit = "Club"
				}
				else
				{
					cardSuitString3 = "Spade"
					startingSuit = "Club"
					spadesBroken = true
				}
				
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

				// get card suit
				// set suit = clubs
				if ((cardNameString3?.hasPrefix("Club")) != nil)
				{
					cardSuitString3 = "Club";
					startingSuit = "Club";
				}
				else if ((cardNameString3?.hasPrefix("Diamond")) != nil)
				{
					cardSuitString3 = "Diamond";
					startingSuit = "Club";
				}
				else if ((cardNameString3?.hasPrefix("Heart")) != nil)
				{
					cardSuitString3 = "Heart";
					startingSuit = "Club";
				}
				else
				{
					cardSuitString3 = "Spade";
					startingSuit = "Club";
					spadesBroken = true
				}
				// set position 1 card value
				let nonDigits = CharacterSet.decimalDigits.inverted
				rightCardValue = Int(cardNameString3!.trimmingCharacters(in: nonDigits)) ?? 0

				self.player3SelectedCard()

				// remove card from array
				player3CardsArray.remove(at: 0)

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
		if player4CardsArray.count == 13
		{
			
		}
		else if player4CardsArray.count == 12
		{
			
		}
		else if player4CardsArray.count == 11
		{
			
		}
		else if player4CardsArray.count == 10
		{
			
		}
		else if player4CardsArray.count == 9
		{
			
		}
		else if player4CardsArray.count == 8
		{
			
		}
		else if player4CardsArray.count == 7
		{
			
		}
		else if player4CardsArray.count == 6
		{
			
		}
		else if player4CardsArray.count == 5
		{
			
		}
		else if player4CardsArray.count == 4
		{
			
		}
		else if player4CardsArray.count == 3
		{
			
		}
		else if player4CardsArray.count == 2
		{
			
		}
		else if player4CardsArray.count == 1
		{
			
		}
		else
		{
			//No Cards Left
			for i in 0...(cardButtonCollection.count - 1)  {
				let myButton : UIButton = cardButtonCollection[i]
				
				//Card Views Hidden
				myButton.isHidden = true
			}
		}
	}
	
	func player1SelectedCard()
	{
		
	}
	func player2SelectedCard()
	{
		
	}
	func player3SelectedCard()
	{
		
	}
	func player4SelectedCard()
	{
		
	}
	
	func compareCards()
	{
		// Implementation here
	}
	
	func gameOver()
	{
		
	}
	
	// MARK: - Computer Players

	func compPlayerStarts()
	{
		
	}
	func compPlayerReacts()
	{
		
	}
	
	// MARK: - User Player Views
	
	func userCardViewSetup()
	{
		
	}
	
	func userCardEnabledSetup()
	{
		
	}
	
}

