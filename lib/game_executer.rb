require_relative './board'
require_relative './player'

class TicTacToe
  attr_reader :can_play

  def initialize
    @can_play = true
    @board = Board.new
    @player1 = Player.new('Paul', @board)
    @player2 = Player.new('Alina Chipolinooo', @board)
    @player1.choose_sign
    @player2.sign = 'o' if @player1.sign == 'x'
    @player2.sign = 'x' if @player1.sign == 'o'
    continue_game
  end

  private

  def game_over?
    @board.board.each do |row|
      return @can_play = false if row.uniq.size == 1 && row.first != '-'
    end
    (0..2).each do |col|
      return @can_play = false if @board.board.map { |row| row[col] }.uniq.size == 1 && @board.board[0][col] != '-'
    end
    return @can_play = false if [@board.board[0][0], @board.board[1][1], @board.board[2][2]].uniq.size == 1 && @board.board[0][0] != '-' # rubocop:disable Layout/LineLength
    return @can_play = false if [@board.board[0][2], @board.board[1][1], @board.board[2][0]].uniq.size == 1 && @board.board[0][2] != '-' # rubocop:disable Layout/LineLength,Style/RedundantReturn
    # continue_game if @can_play == true
  end

  # def draw?
  #   @board.board.flatten.none?(&:nil?) && @can_play == true
  #   print 'Ничья'
  # end

  def continue_game
    while @can_play == true
      @board.show_board
      puts "Игрок #{@player1.name} ваш ход"
      @player1.make_move
      @board.show_board
      game_over?
      if @can_play == false
        puts "Победил #{@player1.name}"
        break
      end

      puts "Игрок #{@player2.name} ваш ход"
      @player2.make_move
      @board.show_board
      game_over?
      if @can_play == false
        puts "Победил #{@player2.name}"
        break
      end
      # draw?
    end
  end
end
