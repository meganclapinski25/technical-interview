#return the amount of vowels in a sentence, return as ints in alphabatical order


#Example: I like shaggy dogs
#[1,1,1,1,0]
#[a,e,i,o,u]

def custom_prob(sentence):
    #initializes the count for each vowel in the list
    counts = [0] * 5
    #iterates over each character in the sentences
    for char in sentence:
        #if the character is a vowel, goes through the list and adds the vowel to the list count
        if char in 'aeiou':
            if char == 'a':
                counts[0] += 1
            elif char == 'e':
                counts[1] += 1
            elif char == 'i':
                counts[2] += 1
            elif char == 'o':
                counts[3] += 1
            elif char == 'u':
                counts[4] += 1
    

    return counts
sentence = "I like really really big birds"
result = custom_prob(sentence)
print(result)