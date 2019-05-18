import numpy as np

#create empty board
def createboard():
    return (np.array([[0, 0, 0],[0, 0, 0],[0, 0, 0]]))

#play game
def play_game():
    board = createboard()
    winner = 0
    counter = 0
    print(board)
    while winner == 0:
        for player in [1, 2]:
            row = int(input('Player %s select row: '%(player)))
            col = int(input('Player %s select column: '%(player)))
            col = col - 1
            row = row - 1
            entervalues(board, row, col, player)
            winner = checkwinner(board, player)
            counter = counter + 1;
            print(board)
            if(winner != 0):
                break
        if (winner != 0 or counter == 8):
            break
    return (winner)

#input
def entervalues(board, row, col, player):
    board[row][col] = player

#check column
def columncheck(board, player):
    for i in [0, 1, 2]:
        win = True
        for j in [0, 1, 2]:
            if board[i][j] != player:
                win = False
        if(win):
            return(win)
            break
    return(win)

#check row
def rowcheck(board, player):
    for i in [0, 1, 2]:
        win = True
        for j in [0, 1, 2]:
            if board[j][i] != player:
                win = False
        if(win):
            return(win)
            break
    return(win)

#check diagonal
def diagcheck1(board, player):
    win = True
    for i in [0, 1, 2]:
        if board[i][i] != player:
            win = False
    return(win)


def diagcheck2(board, player):
    win = True
    for i in [0, 1, 2]:
        if board[2 - i][i] != player:
            win = False
    return(win)

#check for winner
def checkwinner(board, player):
    winner = 0
    if(rowcheck(board, player) or columncheck(board, player) or diagcheck1(board, player) or diagcheck2(board, player)):
        winner = player
    return(winner)

print( "The winner is: " + str(play_game()))
