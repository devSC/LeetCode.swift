//: 524. Longest Word in Dictionary through Deleting
/*:
 Given a string and a string dictionary, find the longest string in the dictionary that can be formed by deleting some characters of the given string. If there are more than one possible results, return the longest word with the smallest lexicographical order. If there is no possible result, return the empty string.
 
 Example 1:
 Input:
 s = "abpcplea", d = ["ale","apple","monkey","plea"]
 
 Output:
 "apple"
 Example 2:
 Input:
 s = "abpcplea", d = ["a","b","c"]
 
 Output:
 "a"
 Note:
    All the strings in the input will only contain lower-case letters.
    The size of the dictionary won't exceed 1,000.
    The length of all the strings in the input won't exceed 1,000.
*/

import Foundation

class Solution {
    func findLongestWord(_ s: String, _ d: [String]) -> String {
        
        //1. Sort
        let sortedArray = d.sorted { (str1, str2) -> Bool in
            //1.1 find the equal length strings and sort by charact value
            if str1.characters.count == str2.characters.count {
                return str1 < str2
            }
            else {
                //1.2 sort the dic by the cout of characters
                return str1.characters.count > str2.characters.count
            }
        }
        sortedArray
        
        //2. find the longest word
        let sCharacters: [Character] = Array(s.characters)
        
        for string in sortedArray {
            
            let stringCharactes: [Character] = Array(string.characters)
            
            //match
            var index: Int = 0
            
            for char in sCharacters {
                //find the char witch equal to the dic
                if index < stringCharactes.count && stringCharactes[index] == char {
                    index += 1
                }
            }
            
            if index == string.characters.count {
                return string
            }
        }
        
        return ""
    }
}

Solution().findLongestWord("abpcplea", ["ale","apple","monkey","plea", "aac"])
