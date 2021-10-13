//
//  Entities.swift
//  SwiftSandbox
//
//  Created by r.r.amirova on 13.10.2021.
//

import Foundation

class Dog: Animal {

    let name: String
    let breed: Breed

    init(name: String, breed: Breed) {
        self.name = name
        self.breed = breed
    }

    func die() {}

    func replicate() {}

    func eat() {}
}

enum BreedType {
    case shepherd
    case retriever
    case hunting
    case companion
    case other
}

struct Breed {
    let name: String
    let type: BreedType
}

protocol Animal {
    func die()
    func replicate()
    func eat()
}

class Population<T: Animal> {

    enum NutritionType {
        case predator
        case herbivore
        case omnivorous
    }

    let nutritionType: NutritionType
    let members: [T]

    init(members: [T], nutritionType: NutritionType) {
        self.members = members
        self.nutritionType = nutritionType
    }
}

class EntitiesDemo: Provable {

    func demonstrate() {
        demonstrateValueReferenceTypes()
    }

    func demonstrateValueReferenceTypes() {
        var shepherd: BreedType = .shepherd
        var shepherdCopy = shepherd

        var germanShepherd = Breed(name: "German Shepherd", type: .shepherd)
        var germanShepherdCopy = germanShepherd

        let dog = Dog(name: "Bob", breed: germanShepherd)
        let dogCopy = dog

        print("Value and reference types proof.")
        print("Classes. Two variables referencing to one memory address:")
        print(MemoryAddress(of: dog))
        print(MemoryAddress(of: dogCopy))

        print("Structures. Two variables referencing two different memory addresses:")
        print(MemoryAddress(of: &germanShepherd))
        print(MemoryAddress(of: &germanShepherdCopy))

        print("Enums. Two variables referencing two different memory addresses:")
        print(MemoryAddress(of: &shepherd))
        print(MemoryAddress(of: &shepherdCopy))
    }
}


// Helpers

struct MemoryAddress<T>: CustomStringConvertible {

    let intValue: Int

    var description: String {
        let length = 2 + 2 * MemoryLayout<UnsafeRawPointer>.size
        return String(format: "%0\(length)p", intValue)
    }

    // for structures
    init(of structPointer: UnsafePointer<T>) {
        intValue = Int(bitPattern: structPointer)
    }
}

extension MemoryAddress where T: AnyObject {

    // for classes
    init(of classInstance: T) {
        intValue = unsafeBitCast(classInstance, to: Int.self)
    }
}
