from typing import List
# Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.

# You must implement a solution with a linear runtime complexity and use only constant extra space.



def singleNumber(nums: List[int]) -> int:
    ans = 0
    for i in nums:
        #XOR ans = ans ^ i
        ans ^= i
    return ans

# Example usage:
nums = [2, 2, 1,1,4,4,3,2,1,3,6,1]
print(singleNumber(nums))  


