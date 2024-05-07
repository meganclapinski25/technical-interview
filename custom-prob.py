#return the amount of vowels in a sentence, return as ints in alphabatical order


#Example: I like shaggy dogs
#[1,1,1,1,0]
#[a,e,i,o,u]

def custom_prob(sentence):
    #initializes the count for each vowel in the list
    counts = [0] * 5 # O(1)
    #iterates over each character in the sentences
    for char in sentence:  # O(n)
        #if the character is a vowel, goes through the list and adds the vowel to the list count
        if char in 'aeiou': # O(1)
            if char == 'a': # O(1)
                counts[0] += 1 # O(1)
            elif char == 'e': # O(1)
                counts[1] += 1 # O(1)
            elif char == 'i': # O(1)
                counts[2] += 1 # O(1)
            elif char == 'o': # O(1)
                counts[3] += 1 # O(1)
            elif char == 'u': # O(1)
                counts[4] += 1 # O(1)
    

    return counts
    #O(n)
sentence = "I like really really big birds"
result = custom_prob(sentence)
print(result)
