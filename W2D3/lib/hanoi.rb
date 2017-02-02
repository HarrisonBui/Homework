class Hanoi

  attr_reader :towers

  def initialize
    @towers = [[3,2,1], [], []]
  end

  def play
    until won?
      render
      from, to = get_input
      move(from, to)
    end
  end

  def get_input
    puts "Please enter a from tower"
    from = gets.chomp.to_i
    puts "Please enter a to tower"
    to = gets.chomp.to_i
    [from, to]
  end

  def move(from_tower, to_tower)
    raise ArgumentError unless valid_move(from_tower, to_tower)
    towers[to_tower].push(towers[from_tower].pop)
    render
  end

  def valid_move(from_tower, to_tower)
    from = towers[from_tower].last
    to = towers[to_tower].last
    return false if from.nil?
    return true if to.nil?
    from < to
  end

  def render
    system('clear')
    @towers.each do |tower|
      print "#{tower}\n"
    end
  end

  def won?
    tower1 = towers.first
    return false unless tower1.empty?
    towers[1] == [3,2,1] || towers[2] == [3,2,1]
  end
end

Hanoi.new.play
