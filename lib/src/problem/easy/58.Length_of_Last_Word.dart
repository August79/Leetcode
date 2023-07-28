/*
58. Length of Last Word

Description:
Given a string s consisting of words and spaces, return the length of the last word in the string.

A word is a maximal substring consisting of non-space characters only.


Example 1:
Input: s = "Hello World"
Output: 5
Explanation: The last word is "World" with length 5.

Example 2:
Input: s = "   fly me   to   the moon  "
Output: 4
Explanation: The last word is "moon" with length 4.

Constraints:
* 1 <= s.length <= 104
* s consists of only English letters and spaces ' '.
* There will be at least one word in s.
*/

class Solution {
  int lengthOfLastWord(String s) {
    int len = s.length;
    int max = 0;

    for (int i = len - 1; i >= 0; i--) {
      final l = s[i];
      if (l != ' ') {
        max += 1;
      } else if (l == ' ' && max > 0) {
        return max;
      }
    }

    return max;
  }
}
