require ('pry')

class My_Hash
  stored_keys = []
  stored_values = []

  define_method(:initialize) do |key, value|
    @key = key
    @value = value
    store(@key, @value)
  end

  define_method(:store) do |key, value|
    if stored_keys[0] == nil
      stored_keys[0] = key
      stored_values[0] = value
    end
    stored_keys.push(key)
    stored_keys.push(value)
  end

  define_method(:remove) do |key|   #removes based only on key value
    to_delete = stored_keys.find_index(key)
    stored_keys.delete_at(to_delete)
    stored_values.delete_at(to_delete)
  end

  define_method(:grab) do |key|
    return_key = stored_keys.find_index(key)
    return_value = stored_values[return_key]
    return_value
  end

  define_method(:key_exists) do |key|
    stored_keys.include?(key)
  end

  define_method(:value_exists) do

  end

  define_method(:get_key) do

  end

  define_method(:length) do

  end

  define_method(:merge) do

  end


end
