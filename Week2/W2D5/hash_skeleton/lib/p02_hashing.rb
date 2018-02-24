class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    ords = self.map { |el| el.to_s.ord }

    xor_res = 0
    ords[0...-1].each_index do |idx|
      curr_ord = ords[idx]
      next_ord = ords[idx+1]

      xor_res += curr_ord ^ next_ord
    end
    xor_res
  end
end

class String
  def hash
    # ords = self.chars.map{|chr| chr.ord }
    #
    # xor_res = 0
    # ords[0...-1].each_index do |idx|
    #   curr_ord = ords[idx]
    #   next_ord = ords[idx+1]
    #
    #   xor_res += curr_ord ^ next_ord
    # end
    # xor_res

    self.chars.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    ords = self.map {|k,v| k.to_s.ord + v.to_s.ord }

    xor_res = 0
    ords[0...-1].each_index do |idx|
      curr_ord = ords[idx]
      next_ord = ords[idx+1]

      xor_res += curr_ord ^ next_ord
    end
    xor_res
  end
end
