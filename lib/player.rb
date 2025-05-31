# frozen_string_literal: true

require_relative './board'

class Player # rubocop:disable Style/Documentation
  attr_accessor :sign, :name

  def initialize(name, board)
    @name = name
    @sign = 'Знак пока не выбран'
    @board = board
  end

  def choose_sign
    print "Выберите знак x или o: " # rubocop:disable Style/StringLiterals
    sign = gets.chomp
    if %w[o x].include?(sign)
      @sign = sign
    else
      puts 'Выбран неверный знак'
      choose_sign until %w[o x].include?(sign)
    end
  end

  def make_move
    print "Введите номер строки: " # rubocop:disable Style/StringLiterals
    line = gets.to_i - 1
    print "Введите номер столбца: " # rubocop:disable Style/StringLiterals
    column = gets.to_i - 1
    @board.board[line][column] = @sign
  end
end
