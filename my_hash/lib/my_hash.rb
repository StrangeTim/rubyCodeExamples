require ('pry')

class My_Hash


  define_method(:initialize) do |key, value|
    @stored_keys = []
    @stored_values = []
    store(key, value)
  end

  define_method(:store) do |key, value|
    if @stored_keys[0] == nil
      @stored_keys[0] = key
      @stored_values[0] = value
    else
    @stored_keys.push(key)
    @stored_values.push(value)
    end
    puts @stored_keys
    puts @stored_values
  end

  define_method(:remove) do |key|   #removes based only on key value
#    to_delete = stored_keys.find_index(key)
    @stored_values.delete_at(@stored_keys.find_index(key))
    @stored_keys.delete_at(@stored_keys.find_index(key))

  end

  define_method(:grab) do |key|
    if @stored_keys.include?(key) == false
      "That key doesn't exist."
    else
      return_key = @stored_keys.find_index(key)
      return_value = @stored_values[return_key]
      return_value
    end
  end

  define_method(:key_exists?) do |key|
    @stored_keys.include?(key)
  end

  define_method(:value_exists?) do

  end

  define_method(:get_key) do

  end

  define_method(:length) do

  end

  define_method(:merge) do

  end


end
