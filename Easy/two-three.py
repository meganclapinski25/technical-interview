# Given three integer arrays nums1, nums2, and nums3, return a distinct array containing all the values that are present in at least two out of the three arrays. You may return the values in any order.
 

# Example 1:

# Input: nums1 = [1,1,3,2], nums2 = [2,3], nums3 = [3]
# Output: [3,2]
# Explanation: The values that are present in at least two arrays are:
# - 3, in all three arrays.
# - 2, in nums1 and nums2.
# Example 2:

# Input: nums1 = [3,1], nums2 = [2,3], nums3 = [1,2]
# Output: [2,3,1]
# Explanation: The values that are present in at least two arrays are:
# - 2, in nums2 and nums3.
# - 3, in nums1 and nums2.
# - 1, in nums1 and nums3.
# Example 3:

# Input: nums1 = [1,2,2], nums2 = [4,3,3], nums3 = [5]
# Output: []
# Explanation: No value is present in at least two arrays.


#CHATGBT
def find_common_elements(nums1, nums2, nums3):
    # Convert arrays to sets to eliminate duplicates
    set1 = set(nums1)
    set2 = set(nums2)
    set3 = set(nums3)
    
    # Find the common elements using set intersection
    common_elements = (set1 & set2) | (set2 & set3) | (set1 & set3)
    
    # Convert the result back to a list
    result = list(common_elements)
    
    return result

# Example usage:
nums1 = [1, 2, 2, 3]
nums2 = [2, 3, 4]
nums3 = [3, 4, 5]

print(find_common_elements(nums1, nums2, nums3))  # Output: [2, 3, 4]



#LeetCode
def solution(nums1, nums2, nums3):
    #empty list
    ret = []

    #adds the common int with intersection from each list to the empty ret list
    ret += set(nums1).intersection(set(nums2))
    ret += set(nums1).intersection(set(nums3))
    ret += set(nums2).intersection(set(nums3))

    return list(set(ret))

# Example usage:
nums1 = [5, 4, 7, 2]
nums2 = [2, 9, 3]
nums3 = [2, 2, 5]

print(solution(nums1, nums2, nums3))  # Output: [2, 3, 4]
