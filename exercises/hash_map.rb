class HashMap
  # A basic implementation of HashMap using arrays

  def initialize()
    @keys = Array.new
    @values = Array.new
  end

  def put(key, value)
    index = @keys.index(key)

    if index.nil?
      @keys.push(key)
      @values.push(value)
    else
      @values[index] = value
    end
  end

  def get(key = nil)
    if key.nil?
      return map()
    end

    index = @keys.index(key)

    if index.nil?
      nil
    else
      @values[index]
    end
  end

  def remove(key)
    index = @keys.index(key)

    if index.nil?
      nil
    else
      value = @values[index]

      @keys.delete_at(index)
      @values.delete_at(index)

      value
    end
  end

  protected

  def map()
    @keys.map do |key|
      [key, get(key)]
    end.to_h
  end
end

map = HashMap.new
map.put("key", "val")
puts map.get("key").inspect
puts map.get().inspect
