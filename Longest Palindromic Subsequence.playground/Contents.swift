//: Playground - noun: a place where people can play

let name: String = "JOSHUAJAMESBERNITT";
let test: String = "character";

class Object {
    var length: Int = -1;
    var sequence: Array = [""];
}

var str: Array = Array("abc".characters);

func lps (string: [String], i: Int, j: Int) -> Object {
    // base case - if the string is 1 character long, then return itself
    if i == j {
        let ret = Object();
        ret.length = i;
        ret.sequence = string;
        return ret;
    }
    
    // base case - if the string is of length 2 and the chars are the same
    if i + 1 == j  && string[i] == string[j] {
        let ret = Object();
        ret.length = j;
        ret.sequence = string;
        return ret;
    }
    
    if string[i] == string[j] {
        return lps(string: string, i: i + 1, j: j - 1);
    }
    
    
    
    return Object();
}

var input = test.characters.map { String($0) };
input = ["A", "A", "A"];

let i = 0;
let j = input.count - 1;
lps(string: input, i: i , j: j);