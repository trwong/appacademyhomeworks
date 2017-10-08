require 'colorize'

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    if @game_over == false
      round_success_message
      sleep(2)
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      system("clear")
      puts color.colorize(color.to_sym)
      sleep(1)
      system("clear")
      sleep(0.5)
      system("clear")
    end
  end

  def require_sequence
    @seq.each do |color|
      unless gets.chomp == color
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "--- Success level #{@sequence_length} complete! ---"
  end

  def game_over_message
    puts " ---- #{"Game Over".colorize(:red)} ----"
    puts "Correct sequence was: #{@seq}"
    puts "#{sequence_length - 1} rounds completed"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if $0 == __FILE__
  Simon.new.play
end
