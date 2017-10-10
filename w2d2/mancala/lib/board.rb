class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { Array.new() }
    place_stones
    @p1 = name1
    @p2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_index do |i|
      (4.times { @cups[i] << :stone}) unless i == 6 || i == 13
    end
  end

  def valid_move?(start_pos)
    raise ArgumentError.new("Invalid starting cup") if start_pos < 0 || start_pos > 13
    raise ArgumentError.new("Invalid starting cup") if @cups[start_pos].empty?
  end

  def make_move(start_pos, player)
    stones = @cups[start_pos]
    @cups[start_pos] = []
    i = start_pos
    stones.length.times do
      i += 1
      i += 1 if player == @p2 && i == 6
      i += 1 if player == @p1 && i == 13
      i = i % 14
      @cups[i] << :stone
    end
    render
    next_turn(i + 1)
    return :prompt if player == @p1 && i == 6
    return :prompt if player == @p2 && i == 13
    p @cups[i - 1].length
    return :switch if @cups[i].length == 1
    i
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0...6].all? { |el| el.empty? } || @cups[7...13].all? { |el| el.empty? }
  end

  def winner
    case @cups[6].length <=> @cups[13].length
    when -1
      @p2
    when 0
      :draw
    when 1
      @p1
    end
  end
end
