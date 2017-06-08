def display_board(board)
  line1 = [" #{board[0]} ", " #{board[1]} ", " #{board[2]} "].join('|')
  line2 = [" #{board[3]} ", " #{board[4]} ", " #{board[5]} "].join('|')
  line3 = [" #{board[6]} ", " #{board[7]} ", " #{board[8]} "].join('|')
  puts line1 + "\n" + "-"*11 + "\n" + line2 + "\n" + "-"*11 + "\n" + line3
end

def position_taken?(board, index)
  entry = board[index]
  is_empty = (entry == " ") || (entry == "") || (entry == nil)
  return !is_empty
end

def valid_move?(board, index)
  return index.between?(0, 8) && !position_taken?(board, index)
end

def input_to_index(input)
  index = input.to_i
  return index.between?(1,9) ? index-1 : -1
end

def move(board, index, token="X")
    if valid_move?(board, index)
      board[index] = token
    end
end

def turn(board, token="X")
  puts "Please enter 1-9:"
  index = input_to_index(gets.chomp)
  if index != -1
    move(board, index, token)
  else
    turn(board, token)
  end
  display_board(board)
end
