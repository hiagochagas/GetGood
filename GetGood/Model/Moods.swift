//
//  Moods.swift
//  GetGood
//
//  Created by Hiago Chagas on 12/08/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import Foundation

struct Mood{
    let moodName: String
    let moodDescription: String
    let waysToFeelBetter: String
}

func getMoods() -> [Mood]{
    let anger = Mood(moodName: "Angry", moodDescription: "When you feel you could break everything", waysToFeelBetter: "Clean your house")
    let loneliness = Mood(moodName: "Lonely", moodDescription: "When you fell alone", waysToFeelBetter: "Talk to someone")
    let frustrated = Mood(moodName: "Frustrated", moodDescription: "When you feel can't do things", waysToFeelBetter: "Stay positive, watch a good Sitcom")
    let sad = Mood(moodName: "Sad", moodDescription: "When you feel like doing nothing", waysToFeelBetter: "Watch a good and fun movie or TV series")
    return [anger, loneliness, frustrated, sad]
}
