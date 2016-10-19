//: Playground - noun: a place where people can play

var name: String = "JOSHUAJAMESBERNITT";
var test: String = "character";

class Object {
    init(s: Int) {
        sequence = Array(repeatElement("", count: s));
    }
    
    var length: Int = -1;
    var sequence: Array = [""];
}

/**
 Utility to gather up the subsequence based on the string of indices passed as a param
 
 @param {String} s      The string of comma seperated indices.
 @return {Array: Int}   Returns the array of sorted integer indices that correspond to
                        characters in the string.
 */
func gatherSubsequence (s: String) -> [Int] {
    // convert all this crap to an Int array of the indices
    let chars = s.characters;
    let s = chars.map({String($0)});
    var s2 = Array(repeatElement("", count: s.count));
    var counter = 0;
    for i in s {
        if i == "," {
            counter += 1;
        } else {
            s2[counter] = s2[counter] + i;
        }
    }
    var indices = [Int]();
    for item in s2 {
        if  Int(item) != nil {
            indices.append(Int(item)!);
        }
    }
    return indices.sorted();
}

/**
 Finds the length of the longest palindromic subsequence, and the actual string value of
 it.
 
 @param {Array: String} string  The string to search through for palindromes.
 @return {Object}               Returns an object of class Object with the correct
                                value for the length and the array of characters of the 
                                subsequence.
 */
func lps (string: [String]) -> Object {
    let n: Int = string.count;
    // tracks length of palindrom
    var c: [[Int]] = Array(repeating: Array(repeatElement(0, count: n)), count: n);
    // tracks indices corresponding to the longest subsequence
    var a: [[String]] = Array(repeating: Array(repeatElement("", count: n)), count: n);
    
    // length 1 string is a palindrome in and of itself, so the diagonal is going to 
    // simply be 1's
    var k = 0;
    while k <= n - 1 {
        c[k][k] = 1;
        a[k][k] = "\(k)";
        k += 1;
    }
    
    let lg = Object(s:0);
    var j = 0;
    // skip the first since it's just a 1 already along the diagonal
    var l = 2;
    while l <= n {
        var i = 0;
        while i < n - l + 1 {
            j = i + l - 1;
            // if two characters are the same, then they are a palindrome of length 2
            if string[i] == string[j] && k == 2 {
                c[i][j] = 2;
                if 2 > lg.length {
                    lg.length = 2;
                }
                a[i][j] = "\(a[i][j]),\(i),\(j)";
            } else if string[i] == string[j] {
                // always add two since it is a palindrome of length 2 + k, where k is the
                // previous length from the immediate upper left diagonal matrix entry,
                // essentially the previous longest
                c[i][j] = c[i+1][j-1] + 2;
                if c[i][j] > lg.length {
                    lg.length = c[i][j];
                }
                a[i][j] = "\(a[i+1][j-1]),\(i),\(j)";
            } else {
                // this bubbles up the longest subsequence to be c[0][n-1]
                c[i][j] = (c[i][j-1] > c[i+1][j] ? c[i][j-1] : c[i+1][j]);
                a[i][j] = (c[i][j-1] > c[i+1][j] ? a[i][j-1] : a[i+1][j]);
            }
            i += 1;
        }
        l += 1;
    }
    // gather the index mapping
    let str = a[0][n-1];
    
    let indices = gatherSubsequence(s: str);
    
    // store in return value
    for i in indices {
        lg.sequence.append(string[i]);
    }
    
    return lg;
}

var input = name.characters.map { String($0) };

var r = lps(string: input);

print(r.length, r.sequence);
// Output - 5, ["S", "A", "J", "A", "S"]



