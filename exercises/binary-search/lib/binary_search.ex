defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _key) do
    :not_found
  end

  def search(numbers, key) do
    do_search(numbers, key, 0, tuple_size(numbers) - 1)
  end

  def do_search(_numbers, _key, low, high) when low > high do
    :not_found
  end

  def do_search(numbers, key, low, high) do
    index = div((high + low), 2)
    ans = elem(numbers, index)
    cond do
      ans == key -> {:ok, index}
      ans > key -> do_search(numbers, key, low, index - 1)
      ans < key -> do_search(numbers, key, index + 1, high)
    end
  end
end
