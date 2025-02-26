//
//  ComputerPlayerProfiles.swift
//  SpadesSwiftOutline
//
//  Created by Michael Spade on 10/2/24.
//

import UIKit

class ComputerPlayerProfiles : UIViewController
{
    // MARK: - Properties
    var prefs: UserDefaults!
    
    var cardNameString: String?
    var cardSuitString: String?
    var startingSuit: String?
    
    var leftCardValue: Int = 0
    var topCardValue: Int = 0
    var rightCardValue: Int = 0
    var bottomCardValue: Int = 0
    var compPlayerGoing: Int = 0

    var playerCardsArray = [String]()
    var tempArrayAcesClub:[String] = []
    var tempArrayAcesDiamond:[String] = []
    var tempArrayAcesHeart:[String] = []
    var tempArrayKingClub:[String] = []
    var tempArrayKingDiamond:[String] = []
    var tempArrayKingHeart:[String] = []
    var tempArraySpades:[String] = []
    
    var tempArrayClub:[String] = []
    var tempArrayDiamond:[String] = []
    var tempArrayHeart:[String] = []
    var tempArraySpade:[String] = []
    var tempArray:[String] = []
    
    // MARK: - Methods
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    // MARK: - ComputerPlayer 1 - Mike

    func compPlayer1Starts(playerArrayPassed: [String], spadesBrokenPassed: Bool, aceClubsPlayedPassed: Bool, aceDiamondsPlayedPassed: Bool, aceHeartsPlayedPassed: Bool, twoHeartsPassed: Bool, twoClubsPassed: Bool, twoDiamondsPassed: Bool)-> (String?, String?, String?)
    {
        print("Comp Player Going: 1")

        //Variables
        playerCardsArray = playerArrayPassed
        
        let spadesBroken = spadesBrokenPassed
        let aceClubsPlayed = aceClubsPlayedPassed
        let aceDiamondsPlayed = aceDiamondsPlayedPassed
        let aceHeartsPlayed = aceHeartsPlayedPassed
        let twoHearts = twoHeartsPassed
        let twoClubs = twoClubsPassed
        let twoDiamonds = twoDiamondsPassed

        //Filter Aces
        tempArrayAcesClub = playerCardsArray.filter(){ $0.contains("Club14") }
        tempArrayAcesDiamond = playerCardsArray.filter(){ $0.contains("Diamond14") }
        tempArrayAcesHeart = playerCardsArray.filter(){ $0.contains("Heart14") }
        //Filter Kings
        tempArrayKingClub = playerCardsArray.filter(){ $0.contains("Club13") }
        tempArrayKingDiamond = playerCardsArray.filter(){ $0.contains("Diamond13") }
        tempArrayKingHeart = playerCardsArray.filter(){ $0.contains("Heart13") }
        //Filter All Spades
        tempArraySpades = playerCardsArray.filter(){ $0.contains("Spade") }
        
        //Check For Aces
        if tempArrayAcesClub.count > 0
        {
            cardNameString = tempArrayAcesClub[0]
        }
        else if tempArrayAcesDiamond.count > 0
        {
            cardNameString = tempArrayAcesDiamond[0]
        }
        else if tempArrayAcesHeart.count > 0
        {
            cardNameString = tempArrayAcesHeart[0]
        }
        //Check For Kings If Aces Has Already Been Played
        else if aceClubsPlayed == true && tempArrayKingClub.count > 0
        {
            cardNameString = tempArrayKingClub[0]
        }
        else if aceDiamondsPlayed == true && tempArrayKingDiamond.count > 0
        {
            cardNameString = tempArrayKingDiamond[0]
        }
        else if aceHeartsPlayed == true && tempArrayKingHeart.count > 0
        {
            cardNameString = tempArrayKingHeart[0]
        }
        else if spadesBroken == true && tempArraySpades.count > 0
        {
            let checkSpadeString = tempArraySpades.last
            let nonDigits = CharacterSet.decimalDigits.inverted
            let tempCardValue = Int(checkSpadeString!.trimmingCharacters(in: nonDigits)) ?? 0
            
            if tempCardValue == 39
            {
                cardNameString = tempArraySpades.last
            }
            else if tempCardValue == 38 && twoHearts == true
            {
                cardNameString = tempArraySpades.last
            }
            else if tempCardValue == 37 && twoHearts == true && twoClubs == true
            {
                cardNameString = tempArraySpades.last
            }
            else if tempCardValue == 36 && twoHearts == true && twoClubs == true && twoDiamonds == true
            {
                cardNameString = tempArraySpades.last
            }
            else //Play Lowest Spade
            {
                cardNameString = tempArraySpades[0]
            }
        }
        //Else Play Lowest Card
        else
        {
            cardNameString = playerCardsArray[0]
        }
        if cardNameString!.contains("Club")
        {
            cardSuitString = "Club"
            startingSuit = "Club"
        }
        else if cardNameString!.contains("Diamond")
        {
            cardSuitString = "Diamond"
            startingSuit = "Diamond"
        }
        else if cardNameString!.contains("Heart")
        {
            cardSuitString = "Heart"
            startingSuit = "Heart"
        }
        else
        {
            cardSuitString = "Spade"
            startingSuit = "Spade"
        }
        
        return(cardNameString, cardSuitString, startingSuit)
    }
    
    func compPlayer1Reacts(playerArrayPassed: [String], startingSuitPassed: String?, leftCardValuePassed: Int, topCardValuePassed: Int, rightCardValuePassed: Int, bottomCardValuePassed: Int, compPlayerGoingPassed: Int)-> (String?)
    {
        print("Comp Player Going Reacts: 1")

        //Variables
        playerCardsArray = playerArrayPassed
        startingSuit = startingSuitPassed
        leftCardValue = leftCardValuePassed
        topCardValue = topCardValuePassed
        rightCardValue = rightCardValuePassed
        bottomCardValue = bottomCardValuePassed
        compPlayerGoing = compPlayerGoingPassed
        
        //Filter Suits
        tempArrayClub = playerCardsArray.filter(){ $0.contains("Club") }
        tempArrayDiamond = playerCardsArray.filter(){ $0.contains("Diamond") }
        tempArrayHeart = playerCardsArray.filter(){ $0.contains("Heart") }
        tempArraySpade = playerCardsArray.filter(){ $0.contains("Spade") }
        
        //Sort Comp Player Cards By Suit
        tempArrayClub.sort { $0.localizedStandardCompare($1) == .orderedAscending }
        tempArrayDiamond.sort { $0.localizedStandardCompare($1) == .orderedAscending }
        tempArrayHeart.sort { $0.localizedStandardCompare($1) == .orderedAscending }
        tempArraySpade.sort { $0.localizedStandardCompare($1) == .orderedAscending }
        
        if compPlayerGoing == 1
        {
            if startingSuit!.hasPrefix("Club")
            {
                tempArray = tempArrayClub
            }
            else if startingSuit!.hasPrefix("Diamond")
            {
                tempArray = tempArrayDiamond
            }
            else if startingSuit!.hasPrefix("Heart")
            {
                tempArray = tempArrayHeart
            }
            else
            {
                tempArray = tempArraySpade
            }

            if startingSuit!.hasPrefix("Spade")
            {
                if tempArray.count > 0
                {
                    let checkHighCardString = tempArray.last
                    let nonDigits = CharacterSet.decimalDigits.inverted
                    let highCardValue = Int(checkHighCardString!.trimmingCharacters(in: nonDigits)) ?? 0
                    
                    if highCardValue > topCardValue && highCardValue > bottomCardValue && highCardValue > rightCardValue
                    {
                        cardNameString = tempArray.last
                    }
                    else
                    {
                        cardNameString = tempArray[0]
                    }
                }
                else
                {
                    cardNameString = playerCardsArray[0]
                }
            }
            else
            {
                if tempArray.count > 0
                {
                    if rightCardValue > topCardValue && rightCardValue > bottomCardValue
                    {
                        cardNameString = tempArray[0]
                    }
                    else
                    {
                        let checkHighCardString = tempArray.last
                        let nonDigits = CharacterSet.decimalDigits.inverted
                        let highCardValue = Int(checkHighCardString!.trimmingCharacters(in: nonDigits)) ?? 0
                        
                        if highCardValue > topCardValue && highCardValue > bottomCardValue && highCardValue > rightCardValue
                        {
                            cardNameString = tempArray.last
                        }
                        else
                        {
                            cardNameString = tempArray[0]
                        }
                    }
                }
                else
                {
                    if rightCardValue > topCardValue && rightCardValue > bottomCardValue
                    {
                        cardNameString = playerCardsArray[0]
                    }
                    else
                    {
                        if tempArraySpade.count > 0
                        {
                            let checkLowCardString = tempArraySpade[0]
                            let nonDigits = CharacterSet.decimalDigits.inverted
                            let lowCardValue = Int(checkLowCardString.trimmingCharacters(in: nonDigits)) ?? 0
                            
                            if lowCardValue > topCardValue && lowCardValue > bottomCardValue && lowCardValue > rightCardValue
                            {
                                cardNameString = tempArraySpade[0]
                                GameScreen().spadesBrokenDisplay()
                            }
                            else
                            {
                                cardNameString = tempArraySpade.last
                                GameScreen().spadesBrokenDisplay()
                            }
                        }
                        else
                        {
                            cardNameString = playerCardsArray[0]
                        }
                    }
                }
            }
        }

        else if compPlayerGoing == 2
        {
            if startingSuit!.hasPrefix("Club")
            {
                tempArray = tempArrayClub
            }
            else if startingSuit!.hasPrefix("Diamond")
            {
                tempArray = tempArrayDiamond
            }
            else if startingSuit!.hasPrefix("Heart")
            {
                tempArray = tempArrayHeart
            }
            else
            {
                tempArray = tempArraySpade
            }

            if startingSuit!.hasPrefix("Spade")
            {
                if tempArray.count > 0
                {
                    let checkHighCardString = tempArray.last
                    let nonDigits = CharacterSet.decimalDigits.inverted
                    let highCardValue = Int(checkHighCardString!.trimmingCharacters(in: nonDigits)) ?? 0
                    
                    if highCardValue > leftCardValue && highCardValue > bottomCardValue && highCardValue > rightCardValue
                    {
                        cardNameString = tempArray.last
                    }
                    else
                    {
                        cardNameString = tempArray[0]
                    }
                }
                else
                {
                    cardNameString = playerCardsArray[0]
                }
            }
            else
            {
                if tempArray.count > 0
                {
                    if bottomCardValue > leftCardValue && bottomCardValue > rightCardValue
                    {
                        cardNameString = tempArray[0]
                    }
                    else
                    {
                        let checkHighCardString = tempArray.last
                        let nonDigits = CharacterSet.decimalDigits.inverted
                        let highCardValue = Int(checkHighCardString!.trimmingCharacters(in: nonDigits)) ?? 0
                        
                        if highCardValue > leftCardValue && highCardValue > bottomCardValue && highCardValue > rightCardValue
                        {
                            cardNameString = tempArray.last
                        }
                        else
                        {
                            cardNameString = tempArray[0]
                        }
                    }
                }
                else
                {
                    if bottomCardValue > leftCardValue && bottomCardValue > rightCardValue
                    {
                        cardNameString = playerCardsArray[0]
                    }
                    else
                    {
                        if tempArraySpade.count > 0
                        {
                            let checkLowCardString = tempArraySpade[0]
                            let nonDigits = CharacterSet.decimalDigits.inverted
                            let lowCardValue = Int(checkLowCardString.trimmingCharacters(in: nonDigits)) ?? 0
                            
                            if lowCardValue > leftCardValue && lowCardValue > bottomCardValue && lowCardValue > rightCardValue
                            {
                                cardNameString = tempArraySpade[0]
                                GameScreen().spadesBrokenDisplay()
                            }
                            else
                            {
                                cardNameString = tempArraySpade.last
                                GameScreen().spadesBrokenDisplay()
                            }
                        }
                        else
                        {
                            cardNameString = playerCardsArray[0]
                        }
                    }
                }
            }
        }
        else //Going Order 3
        {
            if startingSuit!.hasPrefix("Club")
            {
                tempArray = tempArrayClub
            }
            else if startingSuit!.hasPrefix("Diamond")
            {
                tempArray = tempArrayDiamond
            }
            else if startingSuit!.hasPrefix("Heart")
            {
                tempArray = tempArrayHeart
            }
            else
            {
                tempArray = tempArraySpade
            }

            if startingSuit!.hasPrefix("Spade")
            {
                if tempArray.count > 0
                {
                    let checkHighCardString = tempArray.last
                    let nonDigits = CharacterSet.decimalDigits.inverted
                    let highCardValue = Int(checkHighCardString!.trimmingCharacters(in: nonDigits)) ?? 0
                    
                    if highCardValue > topCardValue && highCardValue > bottomCardValue && highCardValue > leftCardValue
                    {
                        cardNameString = tempArray.last
                    }
                    else
                    {
                        cardNameString = tempArray[0]
                    }
                }
                else
                {
                    cardNameString = playerCardsArray[0]
                }
            }
            else
            {
                if tempArray.count > 0
                {
                    if leftCardValue > topCardValue && leftCardValue > bottomCardValue
                    {
                        cardNameString = tempArray[0]
                    }
                    else
                    {
                        let checkHighCardString = tempArray.last
                        let nonDigits = CharacterSet.decimalDigits.inverted
                        let highCardValue = Int(checkHighCardString!.trimmingCharacters(in: nonDigits)) ?? 0
                        
                        if highCardValue > topCardValue && highCardValue > bottomCardValue && highCardValue > leftCardValue
                        {
                            cardNameString = tempArray.last
                        }
                        else
                        {
                            cardNameString = tempArray[0]
                        }
                    }
                }
                else
                {
                    if leftCardValue > topCardValue && leftCardValue > bottomCardValue
                    {
                        cardNameString = playerCardsArray[0]
                    }
                    else
                    {
                        if tempArraySpade.count > 0
                        {
                            let checkLowCardString = tempArraySpade[0]
                            let nonDigits = CharacterSet.decimalDigits.inverted
                            let lowCardValue = Int(checkLowCardString.trimmingCharacters(in: nonDigits)) ?? 0
                            
                            if lowCardValue > topCardValue && lowCardValue > bottomCardValue && lowCardValue > leftCardValue
                            {
                                cardNameString = tempArraySpade[0]
                                GameScreen().spadesBrokenDisplay()
                            }
                            else
                            {
                                cardNameString = tempArraySpade.last
                                GameScreen().spadesBrokenDisplay()
                            }
                        }
                        else
                        {
                            cardNameString = playerCardsArray[0]
                        }
                    }
                }
            }
        }
        return(cardNameString)
    }
}
