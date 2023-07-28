/* 
424. Longest Repeating Character Replacement

Description:
You are given a string s and an integer k. You can choose any character of the string and change it to any other uppercase English character. 
You can perform this operation at most k times.

Return the length of the longest substring containing the same letter you can get after performing the above operations.


Example 1:
Input: s = "ABAB", k = 2
Output: 4
Explanation: Replace the two 'A's with two 'B's or vice versa.


Example 2:
Input: s = "AABABBA", k = 1
Output: 4
Explanation: Replace the one 'A' in the middle with 'B' and form "AABBBBA".
The substring "BBBB" has the longest repeating letters, which is 4.
There may exists other ways to achive this answer too.


Constraints:
* 1 <= s.length <= 105
* s consists of only uppercase English letters.
* 0 <= k <= s.length
*/

import 'dart:math';

class Solution {
  int characterReplacement(String s, int k) {
    final table = <String, int>{};
    int maxLen = 0;
    int start = 0;

    for (int i = 0; i < s.length; ++i) {
      if (table[s[i]] == null) {
        table[s[i]] = 1;
      } else {
        table[s[i]] = table[s[i]]! + 1;
      }

      int all = 0;
      int most = 0;

      for (int c in table.values) {
        if (most < c) most = c;
        all += c;
      }

      if (all - most - k <= 0) {
        maxLen = max(all, maxLen);
        continue;
      }

      table[s[start]] = table[s[start]]! - 1;
      start += 1;
    }

    return maxLen;
  }
}
