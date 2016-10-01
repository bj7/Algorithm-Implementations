//: Playground - noun: a place where people can play

var name: String = "JOSHUAJAMESBERNITT";
var test: String = "character";

class Object {
    var length: Int = -1;
    var sequence: Array = [""];
}

var str: Array = Array("abc".characters);

func lps (string: [String]) -> [[Int]] {
    let l: Int = string.count;
    var c: [[Int]] = Array(repeating: Array(repeatElement(0, count: l)), count: l);
    
    // length 1 string is a palindrome in and of itself, so the diagonal is going to 
    // simply be 1's
    var k: Int = 0;
    while k <= l - 1 {
        c[k][k] = 1;
        k += 1;
    }
    
    var j = 0;
    // skip the first since it's just a 1 already along the diagonal
    k = 2;
    while k <= l {
        var i = 0;
        while i < l - k + 1 {
            j = i + k - 1;
            if string[i] == string[j] && k == 2 {
                c[i][j] = 2;
            } else if string[i] == string[j] {
                
            }
            i += 1;
        }
        k += 1;
    }
    
    return c;
}

//test = "aba";
var input = test.characters.map { String($0) };

lps(string: input);




