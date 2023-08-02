/*
74. Search a 2D Matrix

Description:
You are given an m x n integer matrix matrix with the following two properties:

- Each row is sorted in non-decreasing order.
- The first integer of each row is greater than the last integer of the previous row.
Given an integer target, return true if target is in matrix or false otherwise.

You must write a solution in O(log(m * n)) time complexity.


Example 1:
Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
Output: true

Example 2:
Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13
Output: false


Constraints:
m == matrix.length
n == matrix[i].length
1 <= m, n <= 100
-104 <= matrix[i][j], target <= 104
 */

class Solution {
  bool searchMatrix(List<List<int>> matrix, int target) {
    for (int i = 0; i < matrix.length; ++i) {
      int mid;

      for (int l = 0, r = matrix[i].length - 1; l <= r;) {
        mid = (l + r) ~/ 2;
        if (matrix[i][mid] < target) {
          l = mid + 1;
        } else if (matrix[i][mid] > target) {
          r = mid - 1;
        } else {
          return true;
        }
      }
    }

    return false;
  }
}
