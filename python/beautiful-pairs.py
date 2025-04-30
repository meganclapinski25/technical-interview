from typing import List
# You are given a 0-indexed integer array nums. A pair of indices i, j where 0 <= i < j < nums.length is called beautiful if the first digit of nums[i] and the last digit of nums[j] are coprime.

# Return the total number of beautiful pairs in nums.

# Two integers x and y are coprime if there is no integer greater than 1 that divides both of them. In other words, x and y are coprime if gcd(x, y) == 1, where gcd(x, y) is the greatest common divisor of x and y

#Leet Code
#takes list of ints (nums) and returns as ints 
def countBeautifulPairs(self, nums: List[int]) -> int:

        ans = 0 # O(1)
        #creates list and maps each num to first digit, (converts to string takes first character than back to int)
        frst = list(map(lambda x: int(str(x)[0]), nums)) #O(n)
        #does same thing but uses modulus to get the last digit
        last = list(map(lambda x: x %10, nums)) #O(n)
        #iterates over each pair (x,y) uses i+1 to avoid counting pairs with the same index twice
        for i,n1 in enumerate(frst): #O(n)
            for n2 in last[i+1:]: #O(n)
                    ans+= gcd(n1, n2) == 1  #O(log(j)

        return ans O(1)
        #(n^2 *log(j))

#ChatGBT
#takes greatest common divisor, repeatedly takes remianeder of a divded by b until b is zero
def gcd(a, b):
    while b: #O(n)
        a, b = b, a % b #?
    return a #O(1)

#checks if the two ints (x & y) are co prime if gcd = 1 they are coprime
def is_coprime(x, y):
    return gcd(x, y) == 1 #O(n)

#counts the number of beautiful pairs using for loop, iterating through all pairs and checkig if they are coprime
def count_beautiful_pairs(nums):
    count = 0 # O(1)
    n = len(nums) # O(1)
    for i in range(n): #O(n)
        for j in range(i+1, n): #O(n)
            if is_coprime(nums[i] // 10, nums[j] % 10): #?
                count += 1 # O(1)
    return count # O(1)
#(n^2 *log(j))
# Test the function
nums = [12, 23, 45, 67, 89]
print(count_beautiful_pairs(nums)) 
