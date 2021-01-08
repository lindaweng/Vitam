def jsEncode(word)
    single = word.index("'")
    double = word.index('"')
    while single != nil
        word = word[0...single] + "\\x27" + word[single+1..-1]
        single = word.index("'", single+1)
    end
    while double != nil
        word = word[0...double] + "\\x22" + word[double+1..-1]
        double = word.index('"', double+1)
    end
    return word
end