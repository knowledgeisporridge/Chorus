//
//  Lyrics.swift
//  Chorus
//
//  Created by Dan Wartnaby on 01/10/2019.
//  Copyright © 2019 Dan Wartnaby. All rights reserved.
//

import UIKit
import NaturalLanguage

class Lyrics: Decodable {
    var rawValue: String?
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.rawValue = try container.decode(String.self)
    }
    
    func chorus() -> String? {
        return "Test"
    }
    
    func sentenceCount() -> Int {
        return find(unit: .sentence).count
    }
    
    func wordCount() -> Int {
        return find(unit: .word).count
    }
}

/*
 let schemes: [NLTagScheme] = [.language, .lemma, .lexicalClass, .nameType]
 let tagger = NLTagger(tagSchemes: schemes)
 let options: NLTagger.Options = [.joinNames, .omitWhitespace]
 */

extension Lyrics {
    func find(unit: NLTokenUnit = .word) -> [String] {
        guard let rawValue = rawValue else {
            return []
        }
        
        var results: [String] = []
        
        let tokenizer = NLTokenizer(unit: unit)
        tokenizer.string = rawValue
        let tokens = tokenizer.tokens(for: rawValue.startIndex..<rawValue.endIndex)
        
        for token in tokens {
            results.append(String(rawValue[token]))
        }
        
        return results
    }
}
