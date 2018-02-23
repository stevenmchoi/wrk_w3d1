require 'byebug'

class Array
  def my_each
    # index = 0
    # while index < self.length
    #   yield(self[index]) #prc.call(self[index])
    #   index += 1
    # end

    self.length.times do |i|
      yield(self[i])
    end
    self


    #self
  end

  def my_select(&prc)
    # res = []
    # self.my_each do |el|
    #   res << el if prc.call(el)
    # end
    # res

    selects = []

    self.my_each do |item|
      selects << item if prc.call(item)
    end
    selects
  end

  def my_reject(&prc)
    #self - my_select(&prc)

    selects = []

    self.my_each do |item|
      selects << item unless prc.call(item)
    end

    selects
  end

  def my_any?(&prc)
    # self.my_each do |el|
    #   return true if prc.call(el)
    # end
    #
    # false

    self.my_each do |item|
      return true if prc.call(item)
    end
    false
  end

  def my_flatten
    # res = []
    #
    # self.my_each do |el|
    #   # byebug
    #   if el.is_a?(Array)
    #     res += el.my_flatten
    #   else
    #     res << el
    #   end
    # end
    #
    # res

    flattened = []

    self.my_each do |el|
      if el.is_a?(Array)
        flattened.concat(el.my_flatten)
      else
        flattened << el
      end
    end

    flattened
  end

  def my_zip(*arrays)
    # res = []
    # self.each_with_index do |el, idx|
    #   tmp = []
    #   tmp << el
    #   arr.my_each do |sub_arr|
    #     tmp << sub_arr[idx]
    #   end
    #   res << tmp
    # end
    #
    # res
    zipped = []

    self.length.times do |i|
      subzip = [self[i]]

      arrays.my_each do |array|
        subzip << array[i]
      end
      zipped << subzip
    end

    zipped
  end

  def my_rotate(offset = 1)
    true_off = offset % self.length
    self.drop(true_off) + self.take(true_off)
  end

  def my_join(sep = '')
    # str = ""
    # self.each_with_index do |el, idx|
    #   str += el.to_s
    #   next if idx == self.length - 1
    #   str += sep
    # end
    # str

    join = ""

    self.length.times do |i|
      join += self[i]
      join += seperator unless i == self.length - 1
    end
    join
  end

  def my_reverse
    # res = []
    # tmp = self.dup
    # self.length.times do
    #   res.push(tmp.pop)
    # end
    #
    # res

    reversed = []

    self.my_each do |el|
      reversed.unshift(el)
    end

    reversed
  end
end
