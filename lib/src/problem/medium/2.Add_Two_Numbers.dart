/* 
11. Container With Most Water

Description:
You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.


Example 1:
Input: l1 = [2,4,3], l2 = [5,6,4]
Output: [7,0,8]
Explanation: 342 + 465 = 807.

Example 2:
Input: l1 = [0], l2 = [0]
Output: [0]

Example 3:
Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
Output: [8,9,9,9,0,0,0,1]


Constraints:
- The number of nodes in each linked list is in the range [1, 100].
- 0 <= Node.val <= 9
- It is guaranteed that the list represents a number that does not have leading zeros.
*/

import 'package:leetcode/src/data_structure/list_node.dart';

// Iterative
ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
  final answer = ListNode();
  ListNode? cur = answer;
  ListNode? first = l1;
  ListNode? second = l2;
  int carry = 0;

  while (first != null || second != null || carry != 0) {
    int f = first?.val ?? 0;
    int s = second?.val ?? 0;
    int sum = f + s + carry;

    carry = sum > 9 ? 1 : 0;
    if (sum > 9) sum = sum % 10;

    cur?.next = ListNode(sum);
    cur = cur?.next;

    first = first?.next;
    second = second?.next;
  }

  return answer.next;
}

// Recursive
ListNode? addTwoRecursive(ListNode? l1, ListNode? l2) {
  if (l1 == null && l2 == null) return null;
  if (l1 == null) return l2;
  if (l2 == null) return l1;

  final sum = l1.val + l2.val;
  final answer = ListNode(sum > 9 ? sum % 10 : sum);

  answer.next = addTwoRecursive(l1.next, l2.next);
  if (sum > 9) answer.next = addTwoRecursive(answer.next, ListNode(1));

  return answer;
}
