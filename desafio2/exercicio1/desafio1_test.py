from desafio1 import Tree, Node,mount_tree
import unittest

class FunctionsTest(unittest.TestCase):
  def setUp(self):
    input_array = [[6],[3,5],[10,7,1],[1,2,3,4]]
    self.tree = mount_tree(input_array)
  
  def testMountTreeCreated(self):
    self.assertIsInstance(self.tree, Tree,'fail in mountTree function, fail in create a tree')
    self.assertIsInstance(self.tree.root, Node,'fail in mountTree function, fail in create a tree')
    
  def testMountTreeCreateRoot(self):
    self.assertEqual(self.tree.root.value, 6,'fail in mountTree function, fail in set a root')
  
  def testMountTreeLinkNodes(self):
    self.assertIsInstance(self.tree.root.left, Node,'fail in mountTree function, fail in create the nodes')
    self.assertEqual(self.tree.root.left.value, 3,'fail in mountTree function, fail in link the nodes')
    self.assertEqual(self.tree.root.right.value, 5,'fail in mountTree function, fail in link the nodes')
  
  def testMountTreeLinkCorrectlyNodes(self):
    root = self.tree.root
    self.assertIs(root.left.right, root.right.left,'fail in mountTree function, fail in link the nodes')
    self.assertEqual(root.left.right.value, 7,'fail in mountTree function, fail in link the nodes')
    third_line_node1 = root.left.left
    third_line_node2 = root.left.right
    third_line_node3 = root.right.right
    self.assertIs(third_line_node1.right, third_line_node2.left,'fail in mountTree function, fail in link the nodes')
    self.assertIs(third_line_node2.right, third_line_node3.left,'fail in mountTree function, fail in link the nodes')


class NodeTest(unittest.TestCase):
  def testConstructorValue(self):
    node = Node(4)
    self.assertEqual(node.value, 4,'fail in set the value of Node in constructor')
  
  def testConstructorError(self):
    node = None
    try:
      node = Node()
      self.fail('create correctly a Node without a default value')
    except TypeError:
      self.assertIsNone(node,'create a node object without a default value')
  
  def testConstructorChildren(self):
    node = Node(5)
    self.assertIsNone(node.left,'fail in set the default value None for left')
    self.assertIsNone(node.right,'fail in set the default value None for right')
  
  def testInsertChildren(self):
    father = Node(5)
    left = Node(3)
    right = Node(7)
    father.left = left
    father.right = right
    self.assertIs(father.left, left,'fail in set a node for left pointer')
    self.assertIs(father.right, right,'fail in set a node for right pointer')
    self.assertIsNone(left.left,'fail in set the default value None for left')
    self.assertIsNone(left.right,'fail in set the default value None for right')
  

class TreeTest(unittest.TestCase):
  def testConstructorValue(self):
    node = Node(4)
    tree = Tree(node)
    self.assertIs(tree.root, node,'fail in set the root of Tree in constructor')
  
  def testEmptyConstructor(self):
    tree = Tree()
    self.assertIsNone(tree.root,'fail in create a tree without a default root')

  def testGreaterPath1(self):
    root = Node(4)
    node1_line2 = Node(3)
    node2_line2 = Node(5)
    node1_line3 = Node(2)
    node2_line3 = Node(8)
    node3_line3 = Node(6)
    #linking the objects
    tree = Tree(root)
    root.left = node1_line2
    root.right = node2_line2
    node1_line2.left = node1_line3
    node1_line2.right = node2_line3
    node2_line2.left = node2_line3
    node2_line2.right = node3_line3
    path = tree.greater_path()
    self.assertEqual(len(path), 3, 'fail in greater_path method. Length of path is different of the depth of the tree')
    self.assertIs(path[0], root,'fail in greater_path method. The first Node may be always the root')
    self.assertIs(path[1], node2_line2,'fail in greater_path method. The path was wrong')
    self.assertIs(path[2], node2_line3,'fail in greater_path method. The path was wrong')
  
  def testGreaterPath2(self):
    root = Node(2)
    node1_line2 = Node(9)
    node2_line2 = Node(6)
    node1_line3 = Node(2)
    node2_line3 = Node(3)
    node3_line3 = Node(7)
    #linking the objects
    tree = Tree(root)
    root.left = node1_line2
    root.right = node2_line2
    node1_line2.left = node1_line3
    node1_line2.right = node2_line3
    node2_line2.left = node2_line3
    node2_line2.right = node3_line3
    path = tree.greater_path()
    self.assertEqual(len(path), 3, 'fail in greater_path method. Length of path is different of the depth of the tree')
    self.assertIs(path[0], root,'fail in greater_path method. The first Node may be always the root')
    self.assertIs(path[1], node2_line2,'fail in greater_path method. The path was wrong')
    self.assertIs(path[2], node3_line3,'fail in greater_path method. The path was wrong')

  def testGreaterPath3(self):
    root = Node(6)
    node1_line2 = Node(3)
    node2_line2 = Node(5)
    node1_line3 = Node(9)
    node2_line3 = Node(7)
    node3_line3 = Node(1)
    node1_line4 = Node(4)
    node2_line4 = Node(6)
    node3_line4 = Node(8)
    node4_line4 = Node(4)
    #linking the objects
    tree = Tree(root)
    root.left = node1_line2
    root.right = node2_line2
    node1_line2.left = node1_line3
    node1_line2.right = node2_line3
    node2_line2.left = node2_line3
    node2_line2.right = node3_line3
    node1_line3.left = node1_line4
    node1_line3.right = node2_line4
    node2_line3.left = node2_line4
    node2_line3.right = node3_line4
    node3_line3.left = node3_line4
    node3_line3.right = node4_line4
    path = tree.greater_path()
    self.assertEqual(len(path), 4, 'fail in greater_path method. Length of path is different of the depth of the tree')
    self.assertIs(path[0], root,'fail in greater_path method. The first Node may be always the root')
    self.assertIs(path[1], node2_line2,'fail in greater_path method. The path was wrong')
    self.assertIs(path[2], node2_line3,'fail in greater_path method. The path was wrong')
    self.assertIs(path[3], node3_line4,'fail in greater_path method. The path was wrong')

if __name__ == '__main__':
  unittest.main()
