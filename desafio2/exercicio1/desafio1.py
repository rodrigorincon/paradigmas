import sys, ast


class Node(object):
  def __init__(self, value):
    self.value = value
    self.left = None
    self.right = None

class Tree(object):
  def __init__(self, root = None):
    self.root = root
    
  def calc_path(self, path, actual):
    path += [actual]
    if(actual.left is None and actual.right is None):
      return path
    path_left = self.calc_path(list(path), actual.left)
    path_right = self.calc_path(list(path), actual.right)
    sum_left = sum(node.value for node in path_left)
    sum_right = sum(node.value for node in path_right)
    return ( path_left if sum_left > sum_right else path_right )

  def greater_path(self):
    return self.calc_path([], self.root)

def mount_tree(input_array):
  tree = Tree()
  for index_line, line in enumerate(input_array):
    if index_line == 0: #convert the number in a Node object and insert the first line in root tree
      line[0] = Node(line[0])
      tree.root = line[0]
    else:
      for index_val, value in enumerate(line): #convert the number in a Node object 
        line[index_val] = Node(value)
      for index_val in range( len(line)-1 ): #after converted, link them filling the left and right fields (except the last line, they don't have children)
        input_array[index_line-1][index_val].left = line[index_val]
        input_array[index_line-1][index_val].right = line[index_val+1]
  return tree

def main(input_array):
  tree = mount_tree(input_array)
  path = tree.greater_path()
  print "THE MAXIMUM TOTAL PATH IS:"
  for node in path:
    print node.value
  print "WITH TOTAL = ", sum(node.value for node in path)

def process_inputs():
  arguments = sys.argv[1]
  return ast.literal_eval(arguments)

if __name__ == "__main__":
  input_array = process_inputs()
  main(input_array)
