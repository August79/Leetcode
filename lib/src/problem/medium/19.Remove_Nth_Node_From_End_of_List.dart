/*
74. Search a 2D Matrix

Description:
Given the head of a linked list, remove the nth node from the end of the list and return its head.


Example 1:
Input: head = [1,2,3,4,5], n = 2
Output: [1,2,3,5]

Example 2:
Input: head = [1], n = 1
Output: []

Example 3:
Input: head = [1,2], n = 1
Output: [1]


Constraints:
- The number of nodes in the list is sz.
- 1 <= sz <= 30
- 0 <= Node.val <= 100
- 1 <= n <= sz

Follow up: Could you do this in one pass?
*/

import 'package:leetcode/src/data_structure/list_node.dart';

class Solution {
  ListNode? removeNthFromEnd(ListNode? head, int n) {
    ListNode? slow = head;
    ListNode? fast = head;

    for (int i = 0; i < n; ++i) {
      fast = fast?.next;
    }

    if (fast == null) return slow?.next;

    fast = fast.next;
    while (fast != null) {
      slow = slow?.next;
      fast = fast.next;
    }

    slow?.next = slow.next?.next;
    return head;
  }
}
