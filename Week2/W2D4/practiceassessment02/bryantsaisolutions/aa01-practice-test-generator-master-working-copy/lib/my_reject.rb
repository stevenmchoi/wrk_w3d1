class Array

  def my_reject(&prc)
    accepted = []

    self.each do |el|
      accepted << el unless prc.call(el)
    end

    accepted
  end

end
