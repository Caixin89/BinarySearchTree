BinarySearchTree
================

Binary Search Tree that has no balancing mechanism.

Interface:
1.  insert(num)
    Method: Inserts a number into the tree.
    Input Parameter: Number to be inserted (num).
    Output: Number that was inserted.

2.  has?(num)
    Method: Checks if the tree contains a number.
    Input Parameter: Number to be checked (num).
    Output: Boolean of whether the tree has such number.

3.  delete(num)
    Method: Deletes a number in the tree.
    Input Parameter: Number to be deleted (num)
    Output: If number could not be found, returns nil. Else, number to be deleted would be returned.

4.  findMin
    Method: Finds the smallest number in the tree.
    Output: If tree is empty, returns nil. Else, the smallest number is returned.

5.  findMax
    Method: Finds the largest number in the tree.
    Output: If tree is empty, returns nil. Else, the largest number is returned.

6.  successor(num)
    Method: Finds the successor of a number in the tree.
    Input Parameter: Number whose successor you want to find.
    Output: If number or its successor could not be found, returns nil. Else, returns the successor.

7.  predecessor(num)
    Method: Finds the predecessor of a number in the tree.
    Input Parameter: Number whose predecessor you want to find.
    Output: If number or its predecessor could not be found, returns nil. Else, returns the predecessor.
