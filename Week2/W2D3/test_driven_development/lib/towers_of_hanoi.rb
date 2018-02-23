class TowersofHanoi

  attr_reader :towers

  def initialize(towers = [[3, 2, 1], [], []])
    @towers = towers
  end

  def move(start_tower, end_tower)
    if towers[end_tower].empty?
      towers[end_tower].push(towers[start_tower].pop)
      return towers
    elsif towers[start_tower].last < towers[end_tower].last
      towers[end_tower].push(towers[start_tower].pop)
      return towers
    else
      raise "Can't move piece!"
    end
  end

  def won?
    towers[0].empty? && towers[1].length == 3 || towers[2].length == 3
  end

end
