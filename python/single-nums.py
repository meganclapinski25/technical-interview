from typing import List
# Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.

# You must implement a solution with a linear runtime complexity and use only constant extra space.



def singleNumber(nums: List[int]) -> int:
    ans = 0 # O(1)
    for i in nums: # O(n)
        #XOR ans = ans ^ I
        ans ^= i  # O(1)
    return ans # O(1)

# O(n) 
# Example usage:
nums = [2, 2, 1,1,4,4,3,2,1,3,6,1]
print(singleNumber(nums))  


