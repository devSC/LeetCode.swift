/*:
 383. Ransom Note
 
 Given an arbitrary ransom note string and another string containing letters from all the magazines, write a function that will return true if the ransom note can be constructed from the magazines ; otherwise, it will return false.

Each letter in the magazine string can only be used once in your ransom note.

Note:
You may assume that both strings contain only lowercase letters.
 
 
 canConstruct("a", "b") -> false
 canConstruct("aa", "ab") -> false
 canConstruct("aa", "aab") -> true
 */

import Foundation

class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        guard magazine.characters.count >= ransomNote.characters.count else {
            return false
        }
        
        var magazineCharacters: [Character] = Array(magazine.characters);
        let ransomNoteCharacters: [Character] = Array(ransomNote.characters);
        
        //enum
        var index = 0
        var find = true
        for item in ransomNoteCharacters {
            guard magazineCharacters.contains(item) else {
                find = false;
                break;
            }
            let index = magazineCharacters.index(of: item)!
            magazineCharacters.remove(at: index)
        }

        return find;
    }
}

Solution().canConstruct("aa", "aab")
//Solution().canConstruct("aa", "aba")
//Solution().canConstruct("a", "b")


