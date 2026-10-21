//
//  String+WordCount.swift
//  Pindrop
//
//  Created on 2026-07-09.
//

import Foundation

extension String {
    /// Number of whitespace/newline-delimited tokens, ignoring empty segments.
    ///
    /// Single linear scan — no intermediate `split`/`filter` arrays.
    var wordCount: Int {
        var count = 0
        var inWord = false
        for character in self {
            if character.isWhitespace || character.isNewline {
                inWord = false
            } else if !inWord {
                count += 1
                inWord = true
            }
        }
        return count
    }

    /// Number of newline-delimited lines.
    ///
    /// Single linear scan — no intermediate `split` array.
    /// Empty strings yield 0; strings without newlines yield 1.
    var lineCount: Int {
        guard !self.isEmpty else { return 0 }
        var count = 1
        for character in self {
            if character.isNewline {
                count += 1
            }
        }
        return count
    }
}
