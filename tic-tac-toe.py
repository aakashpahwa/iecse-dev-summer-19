board = [ [ '1' , '2' , '3' ] , [ '4' , '5' , '6' ] , [ '7' , '8' , '9' ] ]

def resetBoard():
    global board
    board = [ [ '1' , '2' , '3' ] , [ '4' , '5' , '6' ] , [ '7' , '8' , '9' ] ]

def printBoard():
    global board
    print("\n")
    for i in range(3):
        print( board[i][0] + " | " + board[i][1] + " | " + board[i][2] )
        if i!=2:
            print("---------")
    print("\n")

def checkWinner():
    global board
    foundWinner = False
    winningCharacter = '#'
    for i in range(3):
        if board[i][0] == board[i][1] and board[i][1] == board[i][2]:
            foundWinner = True
            winningCharacter = board[i][0]
        elif board[0][i] == board[1][i] and board[1][i] == board[2][i]:
            foundWinner = True
            winningCharacter = board[0][i]
    if not foundWinner:
        if board[0][0] == board[1][1] and board[1][1] == board[2][2]:
            foundWinner = True
            winningCharacter = board[0][0]
        elif board[2][0] == board[1][1] and board[1][1] == board[0][2]:
            foundWinner = True
            winningCharacter = board[2][0]
    
    if foundWinner:
        printBoard()
        print("Player "+winningCharacter+" Won")
    return foundWinner
    

def playerMove( currentPlayer ):
    global board
    moveChar = 'X' if currentPlayer == 1 else 'O'
    validMove = False
    while not validMove:
        print( "Enter position for player " + moveChar  )
        moveIndex = int( input() )
        if moveIndex in range( 1 , 10 ) and board[ (moveIndex - 1) // 3 ][ (moveIndex - 1)%3 ] not in [ 'X' , 'O' ]:
            board[ (moveIndex - 1) // 3 ][ (moveIndex - 1)%3 ] = moveChar
            validMove = True
        else:
            print( "Invalid Move" )

def main():
    currentPlayer = 1
    resetBoard()
    while True:
        printBoard()
        playerMove( currentPlayer )
        currentPlayer = 1 if currentPlayer != 1 else 2
        if checkWinner():
            break

main()
