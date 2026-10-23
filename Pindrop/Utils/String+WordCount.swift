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

    /// Number of grapheme clusters (visible characters), excluding whitespace
    /// and newline characters.
    ///
    /// Single linear scan — no intermediate array allocations.
    var nonWhitespaceCharacterCount: Int {
        var count = 0
        for character in self {
            if !character.isWhitespace && !character.isNewline {
                count += 1
            }
        }
        return count
    }

    /// Number of sentences, delimited by `.`, `!`, or `?` followed by
    /// whitespace or end of string.
    ///
    /// Single linear scan — no intermediate `split` array.
    /// Empty strings yield 0; strings without sentence-ending punctuation
    /// yield 1 if non-empty (a single implicit sentence).
    var sentenceCount: Int {
        guard !self.isEmpty else { return 0 }
        var count = 1
        for var i = 0; i < self.count; i += 1 {
            let character = self[i]
            if character == "." || character == "!" || character == "?" {
                if i + 1 >= self.count || self[i + 1].isWhitespace || self[i + 1].isNewline {
                    count += 1
                }
            }
        }
        return count
    }
}
