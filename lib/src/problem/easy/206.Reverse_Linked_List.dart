/*
206. Reverse Linked List

Description:
Given the head of a singly linked list, reverse the list, and return the reversed list.


Example 1:
Input: head = [1,2,3,4,5]
Output: [5,4,3,2,1]

Example 2:
Input: head = [1,2]
Output: [2,1]


Constraints:
- The number of nodes in the list is the range [0, 5000].
- -5000 <= Node.val <= 5000
*/

import 'package:leetcode/src/data_structure/list_node.dart';

// Iterative solution
ListNode? reverseList(ListNode? head) {
  ListNode? reversed;

  while (head != null) {
    reversed = ListNode(head.val, reversed);
    head = head.next;
  }

  return reversed;
}

// Recursive solution
ListNode? reverseRecursive(ListNode? head) {
  return reverse(head, null);
}

ListNode? reverse(ListNode? head, ListNode? reversed) {
  if (head == null) return reversed;

  final next = head.next;
  head.next = reversed;

  return reverse(next, head);
}
