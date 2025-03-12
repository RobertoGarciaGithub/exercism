class FlattenArray
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def flatten_array(arr: array, acc: [])
    arr.each do |element|
      if element.is_a?(Array)
        flatten_array(arr: element, acc: acc)
      else
        acc << element
      end
    end
    acc
  end
end
