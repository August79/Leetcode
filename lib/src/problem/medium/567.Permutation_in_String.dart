/* 
209. Minimum Size Subarray Sum

Description:
Given two strings s1 and s2, return true if s2 contains a permutation of s1, or false otherwise.

In other words, return true if one of s1's permutations is the substring of s2.


Example 1:
Input: s1 = "ab", s2 = "eidbaooo"
Output: true
Explanation: s2 contains one permutation of s1 ("ba").

Example 2:
Input: s1 = "ab", s2 = "eidboaoo"
Output: false


Constraints:
* 1 <= s1.length, s2.length <= 104
* s1 and s2 consist of lowercase English letters.
*/

class Solution {
  static const a = 97;
  bool checkInclusion(String s1, String s2) {
    if (s1.length > s2.length) return false;
    final table = <String, int>{};
    final alp = List<int>.filled(26, 0);

    for (int i = 0; i < s1.length; ++i) {
      if (table[s1[i]] == null) {
        table[s1[i]] = 1;
      } else {
        table[s1[i]] = table[s1[i]]! + 1;
      }
    }

    int start = 0, count = 0;
    for (int i = 0; i < s2.length; ++i) {
      final s = s2[i];
      final pos = s.codeUnitAt(0) - a;

      alp[pos] += 1;
      if (table[s] == null || alp[pos] > table[s]!) {
        final del = alp[pos];
        while (alp[pos] == del) {
          alp[s2[start].codeUnitAt(0) - a] -= 1;
          start += 1;
          count -= 1;
        }
      }

      count += 1;
      if (count == s1.length) return true;
    }
    return false;
  }
}
