defmodule BinarySearchTree do
  @type bst_node :: %{data: any, left: bst_node | nil, right: bst_node | nil}

  @doc """
  Create a new Binary Search Tree with root's value as the given 'data'
  """
  @spec new(any) :: bst_node
  def new(data) do
    %{data: data, left: nil, right: nil}
  end

  @doc """
  Creates and inserts a node with its value as 'data' into the tree.
  """
  @spec insert(bst_node, any) :: bst_node
  def insert(nil, node_value), do: new(node_value)
  def insert(%{data: data, left: left, right: right}, node_value) do
    cond do
      data < node_value -> %{data: data, left: left, right: insert(right, node_value)}
      data >= node_value -> %{data: data, left: insert(left, node_value), right: right}
    end
  end

  @doc """
  Traverses the Binary Search Tree in order and returns a list of each node's data.
  """
  @spec in_order(bst_node) :: [any]
  def in_order(tree) do
    in_order(tree, [])
  end

  def in_order(nil, list) do
    list
  end

  def in_order(%{data: data, left: left, right: right}, list) do
    leftPart = in_order(left, list)
    list = leftPart ++ [data]
    in_order(right, list)
  end

end
