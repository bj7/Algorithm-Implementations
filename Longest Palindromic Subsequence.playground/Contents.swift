//: Playground - noun: a place where people can play

var name: String = "JOSHUAJAMESBERNITT";
var test: String = "character";

class Object {
    var length: Int = -1;
    var sequence: Array = [""];
}

func lps (string: [String]) -> Object {
    let n: Int = string.count;
    var c: [[Int]] = Array(repeating: Array(repeatElement(0, count: n)), count: n);
    
    // length 1 string is a palindrome in and of itself, so the diagonal is going to 
    // simply be 1's
    var k = 0;
    while k <= n - 1 {
        c[k][k] = 1;
        k += 1;
    }
    
    let lg = Object();
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
                lg.sequence.append(string[i]);
            } else if string[i] == string[j] {
                // always add two since it is a palindrome of length 2 + k, where k is the
                // previous length from the immediate upper left diagonal matrix entry,
                // essentially the previous longest
                c[i][j] = c[i+1][j-1] + 2;
                if c[i][j] > lg.length {
                    lg.length = c[i][j];
                }
                lg.sequence.append(string[i]);
            } else {
                // this bubbles up the longest subsequence to be c[0][n-1]
                c[i][j] = (c[i][j-1] > c[i+1][j] ? c[i][j-1] : c[i+1][j]);
            }
            i += 1;
        }
        l += 1;
    }
    
    c;
    return lg;
}

//test = "hannah";
var input = test.characters.map { String($0) };

lps(string: input);




