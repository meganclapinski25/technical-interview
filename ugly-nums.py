# An ugly number is a positive integer whose prime factors are limited to 2, 3, and 5.
# Given an integer n, return true if n is an ugly number.

class Solution:
    def isUgly(self, n):
        # If n = 0, that means n is not an ugly number
        if n == 0:
            return False

        # i iterates over the list with for loop
        # i becomes 2 -> 3 -> 5    
        for i in [2, 3, 5]:
            # While inputted number(n) / i (2, 3, 5) = 0 
            # while (n/i) is divisible (if remainder = 0)
            while n % i == 0:
                # Divides n by i using floor division operator (//) 
                # n continues to be divided by i until it is no longer divisible
                n //= i

        # If n = 1 that means that all prime factors have been divided out
        # leaving only 2, 3, and 5
        # meaning n is an ugly number
        return n == 1

# Test cases
solution = Solution()
print(solution.isUgly(9))  # Output: True
print(solution.isUgly(20))  # Output: True
print(solution.isUgly(27)) # Output: True

class Solution:     
    def is_ugly(self, n):
        # If n is a negative int (0, -1...) it isn't an ugly number
        if n <= 0:
            return False
        
        # While n/2 doesn't provide a remainder (even num)
        # Divides n / 2 and assigns that back to n -> 4//=2 n would become 2 -> 2//=2 n would become 1 
        while n % 2 == 0:
            n //= 2
        
        # Same thing but with 3 
        while n % 3 == 0:
            n //= 3
        
        # Same thing but with 5
        while n % 5 == 0:
            n //= 5
                
        return n == 1

# Test cases
solution = Solution()
print(solution.is_ugly(6))  # Output: True
print(solution.is_ugly(8))  # Output: True
print(solution.is_ugly(14)) # Output: False
