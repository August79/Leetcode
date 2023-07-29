/*
340. Longest Substring with At Most K Distinct Characters

Description:
Given a string, find the length of the longest substring T that contains at most k distinct characters.


Example 1:
Input: s = "eceba", k = 2
Output: 3
Explanation: T is "ece" which its length is 3.


Example 2:
Input: s = "aa", k = 1
Output: 2
Explanation: T is "aa" which its length is 2.
 */

import 'dart:math';

int lengthOfLongestSubstringKDistinct(String str, int k) {
  final table = <String, int>{};
  int maxLen = 0;

  for (int l = 0, r = 0; r < str.length; r++) {
    table[str[r]] = r;

    while (table.length > k) {
      final s = str[l];
      if (table[s] == l) table.remove(s);
      l += 1;
    }

    maxLen = max(maxLen, r - l + 1);
  }

  return maxLen;
}
