from typing import List
# You are given a 0-indexed integer array nums. A pair of indices i, j where 0 <= i < j < nums.length is called beautiful if the first digit of nums[i] and the last digit of nums[j] are coprime.

# Return the total number of beautiful pairs in nums.

# Two integers x and y are coprime if there is no integer greater than 1 that divides both of them. In other words, x and y are coprime if gcd(x, y) == 1, where gcd(x, y) is the greatest common divisor of x and y

#Leet Code
#takes list of ints (nums) and returns as ints 
def countBeautifulPairs(self, nums: List[int]) -> int:

        ans = 0
        #creates list and maps each num to first digit, (converts to string takes first character than back to int)
        frst = list(map(lambda x: int(str(x)[0]), nums))
        #does same thing but uses modulus to get the last digit
        last = list(map(lambda x: x %10, nums))
        #iterates over each pair (x,y) uses i+1 to avoid counting pairs with the same index twice
        for i,n1 in enumerate(frst):
            for n2 in last[i+1:]: ans+= gcd(n1, n2) == 1

        return ans

#ChatGBT
#takes greatest common divisor, repeatedly takes remianeder of a divded by b until b is zero
def gcd(a, b):
    while b:
        a, b = b, a % b
    return a

#checks if the two ints (x & y) are co prime if gcd = 1 they are coprime
def is_coprime(x, y):
    return gcd(x, y) == 1

#counts the number of beautiful pairs using for loop, iterating through all pairs and checkig if they are coprime
def count_beautiful_pairs(nums):
    count = 0
    n = len(nums)
    for i in range(n):
        for j in range(i+1, n):
            if is_coprime(nums[i] // 10, nums[j] % 10):
                count += 1
    return count

# Test the functio
nums = [12, 23, 45, 67, 89]
print(count_beautiful_pairs(nums)) 