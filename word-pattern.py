# Given a pattern and a string s, find if s follows the same pattern.

# Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty word in s.

 

# Example 1:

# Input: pattern = "abba", s = "dog cat cat dog"
# Output: true

# Example 2:

# Input: pattern = "abba", s = "dog cat cat fish"
# Output: false

# Example 3:

# Input: pattern = "aaaa", s = "dog cat cat dog"
# Output: false

#LeetCode
def wordPattern(self, pattern: str, s: str) -> bool:

        #spilts the s string into individual words
        s = s.split()
        #len finds the number of unique characterrs in the pattern and s string
        #zip_longest (itertools) will take the pattern ('ced') for example and group together the words that contain that in s
        return (len(set(pattern)) ==
                len(set(s)) ==
                len(set(zip_longest(pattern,s))))
#Ran in leetcode and works - couldn't figure out how to run test cases in vscode with this 

    

#CHATGBT
def wordPattern(pattern, s):
    # Split the input string s into individual words
    words = s.split()
    
    # Check if the length of the pattern and the number of words in s are the same
    if len(pattern) != len(words):
        return False
    
    # Create two dictionaries to map characters in the pattern to words in s and vice versa
    char_to_word = {}
    word_to_char = {}
    
    # Iterate through each character in the pattern and its corresponding word in s
    for char, word in zip(pattern, words):
        # Check if the current character has been mapped before
        if char in char_to_word:
            # Check if the current word matches the previously mapped word for the character
            if char_to_word[char] != word:
                return False
        else:
            # Map the current character to the current word
            char_to_word[char] = word
            
        # Check if the current word has been mapped before
        if word in word_to_char:
            # Check if the current character matches the previously mapped character for the word
            if word_to_char[word] != char:
                return False
        else:
            # Map the current word to the current character
            word_to_char[word] = char
            
    # If all characters in the pattern have been mapped consistently to words in s, return True
    return True

# test
pattern = "dddd"
s = "dog dog dog dog"
print(wordPattern(pattern, s))  
#explanation
#unique characters = 1
#unique words = 1
#zip pattern (d,dog)... = true
