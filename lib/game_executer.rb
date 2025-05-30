require_relative './board'
require_relative './player'

class TicTacToe
  attr_reader :can_play

  def initialize
    @can_play = true
    @board = Board.new
    @player1 = Player.new('Paul', @board)
    @player2 = Player.new('Computer', @board)
    @player1.choose_sign
    @player2.sign = 'o' if @player1.sign == 'x'
    @player2.sign = 'x' if @player1.sign == 'o'
    continue_game
  end

  private

  def game_over?
    @board.board.each do |row|
      return @can_play = false if row.uniq.size == 1 && row.first != nil # rubocop:disable Style/NonNilCheck
    end
    (0..2).each do |col|
      return @can_play = false if @board.board.map { |row| row[col] }.uniq.size == 1 && @board.board[0][col] != nil # rubocop:disable Style/NonNilCheck
    end
    return @can_play = false if [@board.board[0][0], @board.board[1][1], @board.board[2][2]].uniq.size == 1 && @board.board[0][0] != nil # rubocop:disable Style/NonNilCheck,Layout/LineLength
    return @can_play = false if [@board.board[0][2], @board.board[1][1], @board.board[2][0]].uniq.size == 1 && @board.board[0][2] != nil # rubocop:disable Layout/EmptyLineAfterGuardClause,Layout/LineLength,Style/NonNilCheck
    continue_game if @can_play == true
  end

  # def draw?
  #   @board.board.flatten.none?(&:nil?) && @can_play == true
  #   print 'Ничья'
  # end

  def continue_game
    while @can_play == true
      @player1.make_move
      @player2.make_move
      @board.show_board
      game_over?
      # draw?
    end
  end
end
