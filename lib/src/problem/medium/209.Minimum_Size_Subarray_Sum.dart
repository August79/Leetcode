/* 
209. Minimum Size Subarray Sum

Description:
Given an array of positive integers nums and a positive integer target, 
return the minimal length of a contiguous subarray [nums[l], nums[l+1], ..., nums[r-1], nums[r]] 
of which the sum is greater than or equal to the target. 
If there is no such subarray, return 0 instead.


Example 1:
Input: nums = [2,3,1,2,4,3], target = 7
Output: 2
Explanation: The subarray [4,3] has a sum of 7 which is equal to the target. 
Therefore, the minimal length is 2.

Example 2:
Input: nums = [1,4,4], target = 4
Output: 1

Example 3:
Input: nums = [1,1,1,1,1,1,1,1], target = 11
Output: 0


Constraints:
* 1 <= target <= 109
* 1 <= nums.length <= 105
* 1 <= nums[i] <= 104
*/

import 'dart:math';

class Solution {
  int minSubArrayLen(int target, List<int> nums) {
    int sum = 0;
    int len = 0;

    for (int l = 0, r = 0; r < nums.length; ++r) {
      sum += nums[r];

      while (sum >= target) {
        if (len == 0) len = r + 1 - l;
        len = min(len, r + 1 - l);
        sum -= nums[l];
        l += 1;
      }
    }

    return len;
  }
}
