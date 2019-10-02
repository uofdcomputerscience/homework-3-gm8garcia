import Foundation
import UIKit
import PlaygroundSupport
// This homework should be fairly simple.
// visit https://github.com/noops-challenge/wordbot to read
// the documentation for wordbot.
//
// Using that documentation, write a playground that does
// the following:
// download 50 words
// decode those 50 words into an array of strings
// print the array of words, but with each word reversed
// print the average number of characters per word



PlaygroundPage.current.needsIndefiniteExecution = true

// This homework should be fairly simple.
// visit https://github.com/noops-challenge/wordbot to read
// the documentation for wordbot.
//
// Using that documentation, write a playground that does
// the following:
// download 50 words --- done
// decode those 50 words into an array of strings --- done
// print the array of words, but with each word reversed --- done
// print the average number of characters per word ---


struct WordList: Decodable {
    var words: [String]
}

var worded = [String]()
var reversed = [String]()
var lengths = [Int]()
var characters = 0
var average = 0

let urlString = "https://api.noopschallenge.com/wordbot?count=50"
if let url = URL(string: urlString) {
    let request = URLRequest(url: url)
    let session = URLSession(configuration: .ephemeral)
    let task = session.dataTask(with: request) { (data, response, error) in
        let wordList = try! JSONDecoder().decode(WordList.self, from: data!)
        for word in wordList.words{
            worded.append(word)
        }
        print(worded)
        for a in 0 ..< worded.count{
            let temp = worded[a]
            let reversedTemp = String(temp.reversed())
            reversed.append(reversedTemp)
        }
        print(reversed)
        for a in 0 ..< worded.count{
            let numberChars = worded[a].count
            lengths.append(numberChars)
        }
        for a in 0 ..< lengths.count{
            characters += lengths[a]
            average = sum/50
        }
        print(average)
    }
    task.resume()
}
