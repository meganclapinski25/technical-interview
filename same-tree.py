from typing import Optional
# Given the roots of two binary trees p and q, write a function to check if they are the same or not.

# Two binary trees are considered the same if they are structurally identical, and the nodes have the same value.
# Definition for a binary tree node.
class TreeNode:
     def __init__(self, val=0, left=None, right=None):
         self.val = val
         self.left = left
         self.right = right

class Solution:
    def isSameTree(self, p: Optional[TreeNode], q: Optional[TreeNode]) -> bool:
        #if both trees are empty returns true
        if not p and not q:
            return True  # O(1)
        #cheacks if one tree has ended and the other hasnt.
        #returns a recursive call to check the left and the right subtrees of p and q are the same 
        if p and q and p.val == q.val:
            return self.isSameTree(p.left, q.left) and self.isSameTree(p.right, q.right #O(n)
        
        return False  # O(1)
     #O(n)

def isSameTreeGBT(p: TreeNode, q: TreeNode) -> bool:
    # If both trees are empty, they are the same
    if not p and not q:
        return True # O(1)
    # If one of the trees is empty while the other is not, they are not the same
    if not p or not q:
        return False # O(1)
    # If the values of the current nodes are not equal, they are not the same
    if p.val != q.val:
        return False # O(1)
    # Recursively check if the left and right subtrees are the same
    return isSameTreeGBT(p.left, q.left) and isSameTreeGBT(p.right, q.right) #O(n)
#O(n)
