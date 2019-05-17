turn = 0
combos = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
board = [0,1,2,3,4,5,6,7,8]

def showBoard():
    print('|',board[0],'|',board[1],'|',board[2],'|')
    print('|',board[3],'|',board[4],'|',board[5],'|')
    print('|',board[6],'|',board[7],'|',board[8],'|')

def gameStatus():
    for i in combos:
        if(board[i[0]]==board[i[1]] and board[i[0]]==board[i[2]]):    
            if(turn%2==0):
                print("O Wins")
            else:
                print("X wins")
            return False
        if(turn==9):
            print("Draw !") 
            return False
    return True


print("\n\n\nEnter the spot number you want to fill!")
showBoard()

while gameStatus():
    choice = int(input())

    if(choice in range(0,9)):
        if(board[choice]!='x' and board[choice]!='o'):
            if(turn%2==0):
                 board[choice] = 'x'
            else:
                 board[choice] = 'o'
            turn+=1
        else:
            print("That spot is occupied")
    else:
        print("Enter a valid number")
 
    showBoard()
    



    
    