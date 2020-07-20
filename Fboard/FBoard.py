class FBoard :
  
   # constructor to initialize the board
   def __init__(self):
      
       # initialize the board to empty ('-')
       self.__board = [['-' for i in range(8)] for j in range(8)]
       # place four o pieces
       self.__board[7][0] = 'o'
       self.__board[7][2] = 'o'
       self.__board[7][4] = 'o'
       self.__board[7][6] = 'o'
       # set the game state
       self.__gameState = "UNFINISHED"
       # place the x piece
       self.__XRow = 0
       self.__XCol = 3
       self.__board[0][3] = 'x'
      
  
   # function to return the current game state  
   def get_game_state(self):
       return self.__gameState
  
   # function to move the x piece to (row,col)
   def move_x(self, row, col):
  
       # check if gameState is Unfinished
       if self.__gameState == "UNFINISHED":
          
           # check if row and col are valid
           if(row >= 0 and row < 8 and col >=0 and col < 8):
              
               # check if it is a valid move  
               if(((self.__XRow -1) == row and (self.__XCol-1 == col)) or ((self.__XRow+1) == row and (self.__XCol-1) == col) or ((self.__XRow-1) == row and (self.__XCol+1) == col) or ((self.__XRow+1) == row and (self.__XCol+1) == col)):
                  
                   # check if position in board in empty, then move x piece to this position
                   if self.__board[row][col] == '-':
                       self.__board[row][col] = 'x'
                       self.__board[self.__XRow][self.__XCol] = '-'
                       self.__XRow = row
                       self.__XCol = col
                      
                       # check if game is won by x
                       if self.__XRow == 7:
                           self.__gameState = "X_WON"
                      
                       return True  
                   else:
                       return False
               else:
                   return False
           else:
               return False
       else:
           return False

   # function to move the o piece from (fromRow,fromCol) to (toRow, toCol)      
   def move_o(self, fromRow, fromCol, toRow, toCol):
      
       # check if gameState is Unfinished
       if self.__gameState == "UNFINISHED":
          
           # check if fromRow, fromCol, toRow, toCol are valid
           if(fromRow >= 0 and fromRow < 8 and fromCol >=0 and fromCol < 8 and toRow >= 0 and toRow < 8 and toCol >=0 and toCol < 8):
              
               # check if position at (fromRow, fromCol) contains o piece
               if self.__board[fromRow][fromCol] == 'o':
                  
                   # check if (toRow, toCol) is empty
                   if self.__board[toRow][toCol] == '-':
                      
                       # check if row doesn't increase
                       if fromRow-1 == toRow:
                          
                           # check if valid move, then move to (toRow, toCol)
                           if(((fromCol-1) == toCol) or ((fromCol+1) == toCol)):
                               self.__board[fromRow][fromCol] = '-'
                               self.__board[toRow][toCol] = 'o'
                              
                               # check if game is won by o piece
                               # check for the first row
                               if(self.__XRow == 0):
                                   if(self.__XCol == 0): # for first column
                                       if(self.__board[self.__XRow+1][self.__XCol+1] == 'o'):
                                           self.__gameState = 'O_WON'
                                  
                                   elif(self.__XCol == 7): # for last column
                                       if(self.__board[self.__XRow+1][self.__XCol-1] == 'o'):
                                           self.__gameState = 'O_WON'
                                  
                                   else: #check for rest of the columns
                                       if(self.__board[self.__XRow+1][self.__XCol-1] == 'o' and self.__board[self.__XRow+1][self.__XCol+1] == 'o'):
                                           self.__gameState = 'O_WON'
                               else:          
                                   # check for the rest of the rows
                                   if(self.__XCol == 0): # for first column
                                       if(self.__board[self.__XRow-1][self.__XCol+1] == 'o' and self.__board[self.__XRow+1][self.__XCol+1] == 'o'):
                                           self.__gameState = 'O_WON'
                                  
                                   elif(self.__XCol == 7): # for last column
                                       if(self.__board[self.__XRow-1][self.__XCol-1] == 'o' and self.__board[self.__XRow+1][self.__XCol-1] == 'o'):
                                           self.__gameState = 'O_WON'
                                      
                                   else: # check for rest of the columns
                                       if((self.__board[self.__XRow-1][self.__XCol-1] == 'o') and (self.__board[self.__XRow-1][self.__XCol+1] == 'o') and (self.__board[self.__XRow+1][self.__XCol-1] == 'o') and (self.__board[self.__XRow+1][self.__XCol+1] == 'o')):
                                           self.__gameState = 'O_WON'
                                  
                               return True

                           else:
                               return False
                       else:
                           return False
                   else:
                       return False
                      
               else:
                   return False
           else:
               return False
       else:
           return False
          
  
   # function to print the board
   def print_board(self):
      
       for i in range(len(self.__board)):
           print(self.__board[i])
       print('')  
      
# test the class      
fb = FBoard()
fb.print_board()
fb.move_x(1,1)
fb.print_board()
fb.move_x(2,0)
fb.print_board()
fb.move_o(6,6,5,5)
fb.print_board()
print(fb.get_game_state())