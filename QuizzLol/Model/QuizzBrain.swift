//
//  QuizzBrain.swift
//  QuizzLol
//
//  Created by Cristian Costa on 10/08/2021.
//

import Foundation

struct QuizzBrain {
    let quiz = [
        Question(q: "En qué linea suelen estar los asesinos?", a: ["Bot", "Top", "Mid"], ca: "Mid"),
        Question(q: "Cómo se llama la estructura central?", a: ["Nexo", "Torre", "Castillo"], ca: "Nexo"),
        Question(q: "La R de Thresh se llama...", a: ["Despellejar", "La caja", "Sentencia de muerte"], ca: "La caja"),
        Question(q: "Cuál es el nivel máximo de los campeones?", a: ["22", "16", "18"], ca: "18"),
        Question(q: "Cuál es el nivel máximo de una cuenta?", a: ["40", "30", "No tiene"], ca: "No tiene"),
        Question(q: "Annie es un campeón que se caracteriza por ser...", a: ["Mago", "ADCarry", "Tanque"], ca: "Mago"),
        Question(q: "El equipo de SK Telecom T1 son los máximos campeones de League of Legends, ¿Cuántos títulos ganaron?", a: ["5", "3", "4"], ca: "3"),
        Question(q: "¿Cuál de los siguientes es un hechizo de invocador?", a: ["Salto", "Destello", "Vuelo"], ca: "Destello"),
        Question(q: "Twisted Fate es un campeón que:", a: ["Utiliza cartas", "Utiliza armas", "Utiliza flechas"], ca: "Utiliza cartas"),
        Question(q: "El primer campeón diseñado fue:", a: ["Teemo", "Singed", "Rammus"], ca: "Singed"),
        Question(q: "El hermano de Darius es:", a: ["Draven", "Aphelios", "Nasus"], ca: "Draven"),
        Question(q: "Jax utiliza como arma", a: ["Un árbol", "Un farol", "Una flor"], ca: "Un farol"),
        Question(q: "La hermana de Vi es:", a: ["Senna", "Lissandra", "Jinx"], ca: "Jinx"),
        Question(q: "La empresa que creó League of Legends se llama", a: ["Riot", "Blizzard", "Dota"], ca: "Riot"),
        Question(q: "Cuál de los siguientes personajes es un payaso?", a: ["Volibear", "Shaco", "Lee Sin"], ca: "Shaco"),
        Question(q: "Cuál de las siguientes pociones no existe actualmente en el juego?", a: ["Poción de Mana", "Poción de Vida", "Ninguna de las opciones"], ca: "Poción de Mana"),
        Question(q: "Si Braum le da una porogalleta a un Poro, a este le saldrá:", a: ["Un bigote", "Una lengua", "Un ojo"], ca: "Un bigote"),
        Question(q: "Heimerdinger es:", a: ["Un cientifico loco", "Un astronauta experimentado", "Una bestia"], ca: "Un cientifico loco"),
        Question(q: "Cual de los siguientes nombres no corresponde con un nombre de campeón?", a: ["Kha Zix", "Xin Zhao", "Shao Lin"], ca: "Shao Lin"),
        Question(q: "Número preferido de Jhin", a: ["3", "4", "5"], ca: "4")
    ]
    
    var numberOfQuestions: Int = 10
    var questionNumber: Int = Int.random(in: 0..<20)
    var questions: [Int] = []
    var correctAnswer = 0
    
    mutating func checkAnswer(answer userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].correct {
            correctAnswer += 1
            return true
        } else {
            return false
        }
    }
    
    mutating func randomQuestion() {
        questions.append(questionNumber)
        var number: Int
        repeat {
            number = Int.random(in: 0..<20)
        } while questions.contains(number)
        questionNumber = number
    }
    
    func setButton(_ nro: Int) -> String {
        return quiz[questionNumber].answer[nro]
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func getProgress() -> Float {
        return Float(questions.count) / Float(numberOfQuestions)
    }
    
    func getScore() -> String {
        return "Score: \(correctAnswer) / \(numberOfQuestions)"
    }
    
    mutating func reset() {
        questions = []
        questionNumber = Int.random(in: 0..<20)
        correctAnswer = 0
    }
}
