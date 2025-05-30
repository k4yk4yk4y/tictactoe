# frozen_string_literal: true

class Board # rubocop:disable Style/Documentation
  attr_accessor :board

  def initialize
    @board = [['-', '-', '-'],
              ['-', '-', '-'],
              ['-', '-', '-']]
  end

  def show_board
    @board.each do |line|
      print "#{line.join(' ')}\n"
    end
  end

  def clear_board=(_new_board)
    @board = [['-', '-', '-'],
              ['-', '-', '-'],
              ['-', '-', '-']]
  end
end
