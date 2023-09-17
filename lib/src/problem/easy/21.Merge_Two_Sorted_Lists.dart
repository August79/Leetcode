/*
21. Merge Two Sorted Lists

Description:
You are given the heads of two sorted linked lists list1 and list2.

Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.

Return the head of the merged linked list.


Example 1:
Input: list1 = [1,2,4], list2 = [1,3,4]
Output: [1,1,2,3,4,4]

Example 1:
Input: list1 = [], list2 = []
Output: []


Constraints:
- The number of nodes in both lists is in the range [0, 50].
- -100 <= Node.val <= 100
- Both list1 and list2 are sorted in non-decreasing order.
*/

import 'package:leetcode/src/data_structure/list_node.dart';

// Iterative solution
ListNode? mergeTwoLists(ListNode? list1, ListNode? list2) {
  final merged = ListNode();
  ListNode? tail = merged;

  while (list1 != null && list2 != null) {
    if (list1.val < list2.val) {
      tail?.next = list1;
      list1 = list1.next;
    } else {
      tail?.next = list2;
      list2 = list2.next;
    }
    tail = tail?.next;
  }

  if (list1 == null) tail?.next = list2;
  if (list2 == null) tail?.next = list1;

  return merged.next;
}

// Recursive solution
ListNode? mergeRecursive(ListNode? list1, ListNode? list2) {
  if (list1 == null) return list2;
  if (list2 == null) return list1;

  ListNode? merged;

  if (list1.val < list2.val) {
    merged = list1;
    merged.next = mergeRecursive(list1.next, list2);
  } else {
    merged = list2;
    merged.next = mergeRecursive(list1, list2.next);
  }

  return merged;
}
