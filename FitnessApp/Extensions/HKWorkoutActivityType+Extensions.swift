//
//  HKWorkoutActivityType+Extensions.swift
//  FitnessApp
//
//  Created by Dylan on 5/3/2568 BE.
//

import Foundation
import SwiftUI
import HealthKit

extension HKWorkoutActivityType {
    var name: String {
        switch self {
        case .americanFootball:             return "American Football"
        case .archery:                      return "Archery"
        case .australianFootball:           return "Australian Football"
        case .badminton:                    return "Badminton"
        case .baseball:                     return "Baseball"
        case .basketball:                   return "Basketball"
        case .bowling:                      return "Bowling"
        case .boxing:                       return "Boxing"
        case .climbing:                     return "Climbing"
        case .cricket:                      return "Cricket"
        case .crossTraining:                return "Cross Training"
        case .curling:                      return "Curling"
        case .cycling:                      return "Cycling"
        case .dance:                        return "Dance"
        case .danceInspiredTraining:        return "Dance Inspired Training"
        case .elliptical:                   return "Elliptical"
        case .equestrianSports:             return "Equestrian Sports"
        case .fencing:                      return "Fencing"
        case .fishing:                      return "Fishing"
        case .functionalStrengthTraining:   return "Functional Strength Training"
        case .golf:                         return "Golf"
        case .gymnastics:                   return "Gymnastics"
        case .handball:                     return "Handball"
        case .hiking:                       return "Hiking"
        case .hockey:                       return "Hockey"
        case .hunting:                      return "Hunting"
        case .lacrosse:                     return "Lacrosse"
        case .martialArts:                  return "Martial Arts"
        case .mindAndBody:                  return "Mind and Body"
        case .mixedMetabolicCardioTraining: return "Mixed Metabolic Cardio Training"
        case .paddleSports:                 return "Paddle Sports"
        case .play:                         return "Play"
        case .preparationAndRecovery:       return "Preparation and Recovery"
        case .racquetball:                  return "Racquetball"
        case .rowing:                       return "Rowing"
        case .rugby:                        return "Rugby"
        case .running:                      return "Running"
        case .sailing:                      return "Sailing"
        case .skatingSports:                return "Skating Sports"
        case .snowSports:                   return "Snow Sports"
        case .soccer:                       return "Soccer"
        case .softball:                     return "Softball"
        case .squash:                       return "Squash"
        case .stairClimbing:                return "Stair Climbing"
        case .surfingSports:                return "Surfing Sports"
        case .swimming:                     return "Swimming"
        case .tableTennis:                  return "Table Tennis"
        case .tennis:                       return "Tennis"
        case .trackAndField:                return "Track and Field"
        case .traditionalStrengthTraining:  return "Traditional Strength Training"
        case .volleyball:                   return "Volleyball"
        case .walking:                      return "Walking"
        case .waterFitness:                 return "Water Fitness"
        case .waterPolo:                    return "Water Polo"
        case .waterSports:                  return "Water Sports"
        case .wrestling:                    return "Wrestling"
        case .yoga:                         return "Yoga"
        case .barre:                        return "Barre"
        case .coreTraining:                 return "Core Training"
        case .crossCountrySkiing:           return "Cross Country Skiing"
        case .downhillSkiing:               return "Downhill Skiing"
        case .flexibility:                  return "Flexibility"
        case .highIntensityIntervalTraining:return "High Intensity Interval Training"
        case .jumpRope:                     return "Jump Rope"
        case .kickboxing:                   return "Kickboxing"
        case .pilates:                      return "Pilates"
        case .snowboarding:                 return "Snowboarding"
        case .stairs:                       return "Stairs"
        case .stepTraining:                 return "Step Training"
        case .wheelchairWalkPace:           return "Wheelchair Walk Pace"
        case .wheelchairRunPace:            return "Wheelchair Run Pace"
        case .taiChi:                       return "Tai Chi"
        case .mixedCardio:                  return "Mixed Cardio"
        case .handCycling:                  return "Hand Cycling"
        case .discSports:                   return "Disc Sports"
        case .fitnessGaming:                return "Fitness Gaming"
        case .cardioDance:                  return "Cardio Dance"
        case .socialDance:                  return "Social Dance"
        case .pickleball:                   return "Pickleball"
        case .cooldown:                     return "Cooldown"
        case .swimBikeRun:                  return "Swim Bike Run"
        case .transition:                   return "Transition"
        case .underwaterDiving:             return "Underwater Diving"
        case .other:                        return "Other"
        @unknown default:                   return "Other"
        }
    }
    
    var systemImage: String {
        switch self {
        case .americanFootball:             return "football.fill"
        case .archery:                      return "target"
        case .australianFootball:           return "football.fill"
        case .badminton:                    return "sportscourt"
        case .baseball:                     return "baseball.fill"
        case .basketball:                   return "basketball.fill"
        case .bowling:                      return "figure.bowling"
        case .boxing:                       return "figure.boxing"
        case .climbing:                     return "figure.climbing"
        case .cricket:                      return "sportscourt"
        case .crossTraining:                return "figure.strengthtraining.traditional"
        case .curling:                      return "sportscourt"
        case .cycling:                      return "bicycle"
        case .dance:                        return "figure.dance"
        case .danceInspiredTraining:        return "figure.dance"
        case .elliptical:                   return "figure.elliptical"
        case .equestrianSports:             return "figure.horseback.riding"
        case .fencing:                      return "sportscourt"
        case .fishing:                      return "fish"
        case .functionalStrengthTraining:   return "dumbbell.fill"
        case .golf:                         return "figure.golf"
        case .gymnastics:                   return "figure.gymnastics"
        case .handball:                     return "sportscourt"
        case .hiking:                       return "figure.hiking"
        case .hockey:                       return "hockey.puck"
        case .hunting:                      return "target"
        case .lacrosse:                     return "sportscourt"
        case .martialArts:                  return "figure.martial.arts"
        case .mindAndBody:                  return "brain.head.profile"
        case .mixedMetabolicCardioTraining: return "figure.highintensity.intervaltraining"
        case .paddleSports:                 return "figure.rowing"
        case .play:                         return "figure.play"
        case .preparationAndRecovery:       return "figure.cooldown"
        case .racquetball:                  return "sportscourt"
        case .rowing:                       return "figure.rowing"
        case .rugby:                        return "sportscourt"
        case .running:                      return "figure.run"
        case .sailing:                      return "sailboat.fill"
        case .skatingSports:                return "figure.skating"
        case .snowSports:                   return "snowflake"
        case .soccer:                       return "soccerball"
        case .softball:                     return "baseball"
        case .squash:                       return "sportscourt"
        case .stairClimbing:                return "figure.stair.stepper"
        case .surfingSports:                return "figure.surfing"
        case .swimming:                     return "figure.pool.swim"
        case .tableTennis:                  return "sportscourt"
        case .tennis:                       return "tennis.racket"
        case .trackAndField:                return "figure.track.and.field"
        case .traditionalStrengthTraining:  return "dumbbell.fill"
        case .volleyball:                   return "sportscourt"
        case .walking:                      return "figure.walk"
        case .waterFitness:                 return "drop.fill"
        case .waterPolo:                    return "sportscourt"
        case .waterSports:                  return "drop.fill"
        case .wrestling:                    return "figure.wrestling"
        case .yoga:                         return "figure.yoga"
        case .barre:                        return "figure.barre"
        case .coreTraining:                 return "figure.core.training"
        case .crossCountrySkiing:           return "figure.skiing.crosscountry"
        case .downhillSkiing:               return "figure.skiing.downhill"
        case .flexibility:                  return "figure.cooldown"
        case .highIntensityIntervalTraining: return "figure.highintensity.intervaltraining"
        case .jumpRope:                     return "figure.jumprope"
        case .kickboxing:                   return "figure.kickboxing"
        case .pilates:                      return "figure.pilates"
        case .snowboarding:                 return "figure.snowboarding"
        case .stairs:                       return "figure.stair.stepper"
        case .stepTraining:                 return "figure.step.training"
        case .wheelchairWalkPace:           return "figure.roll"
        case .wheelchairRunPace:            return "figure.roll"
        case .taiChi:                       return "figure.tai.chi"
        case .mixedCardio:                  return "figure.mixed.cardio"
        case .handCycling:                  return "bicycle"
        case .discSports:                   return "sportscourt"
        case .fitnessGaming:                return "gamecontroller.fill"
        case .cardioDance:                  return "figure.dance"
        case .socialDance:                  return "figure.socialdance"
        case .pickleball:                   return "sportscourt"
        case .cooldown:                     return "figure.cooldown"
        case .swimBikeRun:                  return "figure.triathlon"
        case .transition:                   return "arrow.triangle.2.circlepath"
        case .underwaterDiving:             return "figure.scuba.dive"
        case .other:                        return "questionmark.circle"
        @unknown default:                   return "questionmark.circle"
        }
    }
    
    var color: Color {
        switch self {
        case .americanFootball:             return Color.green
        case .archery:                      return Color.red
        case .australianFootball:           return Color.green
        case .badminton:                    return Color.orange
        case .baseball:                     return Color.red
        case .basketball:                   return Color.orange
        case .bowling:                      return Color.gray
        case .boxing:                       return Color.black
        case .climbing:                     return Color.brown
        case .cricket:                      return Color.green
        case .crossTraining:                return Color.purple
        case .curling:                      return Color.cyan
        case .cycling:                      return Color.blue
        case .dance:                        return Color.pink
        case .danceInspiredTraining:        return Color.pink
        case .elliptical:                   return Color.blue
        case .equestrianSports:             return Color.brown
        case .fencing:                      return Color.green
        case .fishing:                      return Color.blue
        case .functionalStrengthTraining:   return Color.orange
        case .golf:                         return Color.green
        case .gymnastics:                   return Color.pink
        case .handball:                     return Color.orange
        case .hiking:                       return Color.green
        case .hockey:                       return Color.blue
        case .hunting:                      return Color.brown
        case .lacrosse:                     return Color.green
        case .martialArts:                  return Color.red
        case .mindAndBody:                  return Color.blue
        case .mixedMetabolicCardioTraining: return Color.purple
        case .paddleSports:                 return Color.blue
        case .play:                         return Color.yellow
        case .preparationAndRecovery:       return Color.purple
        case .racquetball:                  return Color.green
        case .rowing:                       return Color.blue
        case .rugby:                        return Color.green
        case .running:                      return Color.blue
        case .sailing:                      return Color.blue
        case .skatingSports:                return Color.blue
        case .snowSports:                   return Color.white
        case .soccer:                       return Color.green
        case .softball:                     return Color.red
        case .squash:                       return Color.green
        case .stairClimbing:                return Color.orange
        case .surfingSports:                return Color.blue
        case .swimming:                     return Color.blue
        case .tableTennis:                  return Color.green
        case .tennis:                       return Color.green
        case .trackAndField:                return Color.red
        case .traditionalStrengthTraining:  return Color.purple
        case .volleyball:                   return Color.orange
        case .walking:                      return Color.blue
        case .waterFitness:                 return Color.blue
        case .waterPolo:                    return Color.green
        case .waterSports:                  return Color.blue
        case .wrestling:                    return Color.red
        case .yoga:                         return Color.purple
        case .barre:                        return Color.pink
        case .coreTraining:                 return Color.blue
        case .crossCountrySkiing:           return Color.white
        case .downhillSkiing:               return Color.white
        case .flexibility:                  return Color.purple
        case .highIntensityIntervalTraining: return Color.red
        case .jumpRope:                     return Color.green
        case .kickboxing:                   return Color.red
        case .pilates:                      return Color.pink
        case .snowboarding:                 return Color.white
        case .stairs:                       return Color.gray
        case .stepTraining:                 return Color.orange
        case .wheelchairWalkPace:           return Color.blue
        case .wheelchairRunPace:            return Color.blue
        case .taiChi:                       return Color.green
        case .mixedCardio:                  return Color.purple
        case .handCycling:                  return Color.blue
        case .discSports:                   return Color.orange
        case .fitnessGaming:                return Color.pink
        case .cardioDance:                  return Color.pink
        case .socialDance:                  return Color.pink
        case .pickleball:                   return Color.green
        case .cooldown:                     return Color.gray
        case .swimBikeRun:                  return Color.blue
        case .transition:                   return Color.yellow
        case .underwaterDiving:             return Color.blue
        case .other:                        return Color.gray
        @unknown default:                   return Color.gray
        }
    }

}
