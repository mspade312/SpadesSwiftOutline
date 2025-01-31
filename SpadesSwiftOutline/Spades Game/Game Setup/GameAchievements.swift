//
//  GameAchievements.swift
//  SpadesSwiftOutline
//
//  Created by Michael Spade on 1/28/25.
//
import UIKit

class GameAchievements : UIViewController
{
    // MARK: - Methods
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    func checkAcePlayed(aceClubPlayed: Bool, aceDiamondPlayed: Bool, aceHeartPlayed: Bool, startingSuit: String, leftValue: Int, topValue: Int, rightValue: Int, bottomValue: Int) -> (Bool, Bool, Bool)
    {
        var aceClubsPlayed = aceClubPlayed
        var aceDiamondsPlayed = aceDiamondPlayed
        var aceHeartsPlayed = aceHeartPlayed
        
        if startingSuit.hasPrefix("Club")
        {
            if leftValue == 14
            {
                aceClubsPlayed = true
                print("Ace of Clubs Played")
            }
            else
            {
                aceClubsPlayed = false
            }
            if (topValue == 14)
            {
                aceClubsPlayed = true
                print("Ace of Clubs Played")
            }
            else
            {
                aceClubsPlayed = false
            }
            if (rightValue == 14)
            {
                aceClubsPlayed = true
                print("Ace of Clubs Played")
            }
            else
            {
                aceClubsPlayed = false
            }
            if (bottomValue == 14)
            {
                aceClubsPlayed = true
                print("Ace of Clubs Played")
            }
            else
            {
                aceClubsPlayed = false
            }
        }
        else
        {
        }
        if startingSuit.hasPrefix("Diamond")
        {
            if (leftValue == 14)
            {
                aceDiamondsPlayed = true
                print("Ace of Diamonds Played")
            }
            else
            {
                aceDiamondsPlayed = false
            }
            if (topValue == 14)
            {
                aceDiamondsPlayed = true
                print("Ace of Diamonds Played")
            }
            else
            {
                aceDiamondsPlayed = false
            }
            if (rightValue == 14)
            {
                aceDiamondsPlayed = true
                print("Ace of Diamonds Played")
            }
            else
            {
                aceDiamondsPlayed = false
            }
            if (bottomValue == 14)
            {
                aceDiamondsPlayed = true
                print("Ace of Diamonds Played")
            }
            else
            {
                aceDiamondsPlayed = false
            }
        }
        else
        {
        }
        if startingSuit.hasPrefix("Heart")
        {
            if (leftValue == 14)
            {
                aceHeartsPlayed = true
                print("Ace of Heart Played")
            }
            else
            {
                aceHeartsPlayed = false
            }
            if (topValue == 14)
            {
                aceHeartsPlayed = true
                print("Ace of Heart Played")
            }
            else{
                aceHeartsPlayed = false
            }
            if (rightValue == 14)
            {
                aceHeartsPlayed = true
                print("Ace of Heart Played")
            }
            else
            {
                aceHeartsPlayed = false
            }
            if (bottomValue == 14)
            {
                aceHeartsPlayed = true
                print("Ace of Heart Played")
            }
            else
            {
                aceHeartsPlayed = false
            }
        }
        else
        {
        }
        return(aceClubsPlayed, aceDiamondsPlayed, aceHeartsPlayed)
    }
    
    func checkTwosPlayed(twoClubPlayed: Bool, twoDiamondPlayed: Bool, twoHeartPlayed: Bool, startingSuit: String, leftValue: Int, topValue: Int, rightValue: Int, bottomValue: Int) -> (Bool, Bool, Bool)
    {
        var twoClubs = twoClubPlayed
        var twoDiamonds = twoDiamondPlayed
        var twoHearts = twoHeartPlayed
        
        if(leftValue == 39)
        {
            twoHearts = true
            print("Two of Heart Played")
        }
        else
        {
            twoHearts = false
        }
        if topValue == 39
        {
            twoHearts = true
            print("Two of Heart Played")
        }
        else
        {
            twoHearts = false
        }
        if rightValue == 39
        {
            twoHearts = true
            print("Two of Heart Played")
        }
        else
        {
            twoHearts = false
        }
        if bottomValue == 39
        {
            twoHearts = true
            print("Two of Heart Played")
        }
        else
        {
            twoHearts = false
        }
        
        if leftValue == 38
        {
            twoClubs = true
            print("Two of Club Played")
        }
        else
        {
            twoClubs = false
        }
        if topValue == 38
        {
            twoClubs = true
            print("Two of Club Played")
        }
        else
        {
            twoClubs = false
        }
        if rightValue == 38
        {
            twoClubs = true
            print("Two of Club Played")
        }
        else
        {
            twoClubs = false
        }
        if bottomValue == 38
        {
            twoClubs = true
            print("Two of Club Played")
        }
        else
        {
            twoClubs = false
        }
        
        if leftValue == 37
        {
            twoDiamonds = true
            print("Two of Diamond Played")
        }
        else
        {
            twoDiamonds = false
        }
        if topValue == 37
        {
            twoDiamonds = true
            print("Two of Diamond Played")
        }
        else
        {
            twoDiamonds = false
        }
        if rightValue == 37
        {
            twoDiamonds = true
            print("Two of Diamond Played")
        }
        else
        {
            twoDiamonds = false
        }
        if bottomValue == 37
        {
            twoDiamonds = true
            print("Two of Diamond Played")
        }
        else
        {
            twoDiamonds = false
        }
        return(twoClubs, twoDiamonds, twoHearts)
    }
}

