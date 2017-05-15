/*: 79. Word Search
 Given a 2D board and a word, find if the word exists in the grid.
 
 The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once.
 
 For example,
 Given board =
 
 [
 ['A','B','C','E'],
 ['S','F','C','S'],
 ['A','D','E','E']
 ]
 word = "ABCCED", -> returns true,
 word = "SEE", -> returns true,
 word = "ABCB", -> returns false.
 
 //The key is to set a direction and avoid the duplicate back.
*/

import Foundation

class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        guard board.count > 0 && board[0].count > 0 else {
            return false
        }
        
        let m = board.count;
        let n = board[0].count
        
        var visted = Array(repeating: Array(repeating: false, count: n), count: m)
        var wordContent = [Character](word.characters)
        
        for i in 0 ..< m {
            for j in 0 ..< n {
                if board[i][j] == wordContent[0] && dfs(board: board, wordContent: wordContent, m: m, n: n, i: i, j: j, visited: &visted, index: 0) {
                    return true
                }
            }
        }
        
        return false
    }
    
    private func dfs(board: [[Character]], wordContent: [Character], m: Int, n: Int, i: Int, j: Int, visited: inout [[Bool]], index: Int) -> Bool {
        if index == wordContent.count   {
            return true
        }
        
        guard i >= 0 && i < m && j >= 0 && j < n else {
            return false
        }
        
        guard !visited[i][j] && board[i][j] == wordContent[index] else {
            return false
        }
        
        visited[i][j] == true
        
        if dfs(board: board, wordContent: wordContent, m: m, n: n, i: i, j: j, visited: &visited, index: index + 1) ||
            dfs(board: board, wordContent: wordContent, m: m, n: n, i: i - 1, j: j, visited: &visited, index: index + 1) ||
            dfs(board: board, wordContent: wordContent, m: m, n: n, i: i, j: j + 1, visited: &visited, index: index + 1) ||
            dfs(board: board, wordContent: wordContent, m: m, n: n, i: i, j: j - 1, visited: &visited, index: index + 1) {
            
            return true
        }
        
        visited[i][j] == false
        
        return false
    }
}

let board: [[Character]] = [
    ["A","B","C","E"],
    ["S","F","C","S"],
    ["A","D","E","E"]
]

Solution().exist(board, "SEE")
Solution().exist(board, "ABCB")
Solution().exist(board, "ESCFSA")
Solution().exist(board, "ABCCED")

