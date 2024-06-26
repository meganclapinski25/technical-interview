# You are climbing a staircase. It takes n steps to reach the top.

# Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

# Example 1:

# Input: n = 2
# Output: 2
# Explanation: There are two ways to climb to the top.
# 1. 1 step + 1 step
# 2. 2 steps

# Example 2:

# Input: n = 3
# Output: 3
# Explanation: There are three ways to climb to the top.
# 1. 1 step + 1 step + 1 step
# 2. 1 step + 2 steps
# 3. 2 steps + 1 step

def climbStairs(self, n: int) -> int:
    ways = 1 # O(1)

    # loop through the range, 1 - half of n because once you reach halfway you ca either do single or double steps 
    for i in range(1, (n // 2) + 1): #O(n)
        product = 1 # O(1)
    # loop through range, 2*i is represets taking 2 steps at a time
    for j in range(i, 2 * i): #O(n)
        # n-j = remaining steps -> / -> # of steps to take 2 at a time
        product *= (n - j) / (j - i + 1) # O(1)
    # total number of ways 
    ways += product # O(1)

    return int(ways) # O(1)
#(1 + 1 + 1 + 1 + 1 * n * n)
#O(n^2)

def climbStairsGBT(n):
    if n == 1:
        return 1 # O(1)
    if n == 2:
        return 2 # O(1)

    # Initialize an array to store the number of ways to reach each step
    dp = [0] * (n + 1) # O(n)
    dp[1] = 1  # There's only one way to reach the first step # O(1)
    dp[2] = 2  # There are two ways to reach the second step # O(1)

    # Calculate the number of ways to reach each step
    for i in range(3, n + 1): # O(n)
        dp[i] = dp[i - 1] + dp[i - 2] # O(1)

    return dp[n] # O(1)
    #O(n)
# Example usage:
n = 5
print("Number of distinct ways to climb", n, "steps:", climbStairsGBT(n))
