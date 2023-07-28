/*
76. Minimum Window Substring

Description:
Given two strings s and t of lengths m and n respectively, return the minimum window 
substring of s such that every character in t (including duplicates) is included in the window. If there is no such substring, return the empty string "".

The testcases will be generated such that the answer is unique.


Example 1:
Input: s = "ADOBECODEBANC", t = "ABC"
Output: "BANC"
Explanation: The minimum window substring "BANC" includes 'A', 'B', and 'C' from string t.\

Example 2:
Input: s = "a", t = "a"
Output: "a"
Explanation: The entire string s is the minimum window.

Example 3:
Input: s = "a", t = "aa"
Output: ""
Explanation: Both 'a's from t must be included in the window.
Since the largest window of s only has one 'a', return empty string.


Constraints:
* m == s.length
* n == t.length
* 1 <= m, n <= 105
* s and t consist of uppercase and lowercase English letters.
*/

class Solution {
  static const a = 65;
  String minWindow(String s, String t) {
    if (s.length < t.length) return '';
    final window = List<int>.filled(58, 0);
    final alp = List<int>.filled(58, 0);
    int len = 0;

    for (int i = 0; i < t.length; ++i) {
      final c = alp[t[i].codeUnitAt(0) - a] += 1;
      if (c == 1) len += 1;
    }

    int start = -1;
    int end = -1;
    int cur = 0;

    void range(int l, int r) {
      if (end < 0 || r - l < end - start) {
        start = l;
        end = r;
      }
    }

    for (int l = 0, r = 0; r < s.length; ++r) {
      final pos = s[r].codeUnitAt(0) - a;
      if (alp[pos] == 0) continue;

      window[pos] += 1;
      if (window[pos] == alp[pos]) cur += 1;
      if (cur == len) {
        bool removed = false;
        while (l < t.length) {
          final p = s[l].codeUnitAt(0) - a;
          if (removed && alp[p] > 0) break;
          if (!removed) range(l, r);
          if (alp[p] > 0) {
            window[p] -= 1;
            removed = window[p] < alp[p];
          }
          l += 1;
        }
        cur -= 1;
      }
    }

    return end < 0 ? '' : s.substring(start, end + 1);
  }
}
