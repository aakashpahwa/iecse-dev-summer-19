# main data of the game
table = [['1', '2', '3'],
        ['4', '5', '6'],
        ['7', '8', '9']]

# printing function. works perfectly
def display(game):
    print("")
    print("             TIC TAC TOE     ")
    print("     Player 1(X)     Player2(O)      ")
    print("")
    print("     |     |     ")
    print(" ", game[0][0], " | ", game[0][1], " | ", game[0][2] )
    print("_____|_____|_____")
    print("     |     |     ")
    print(" ", game[1][0], " | ", game[1][1], " | ", game[1][2] )
    print("_____|_____|_____")
    print("     |     |     ")
    print(" ", game[2][0], " | ", game[2][1], " | ", game[2][2] )
    print("     |     |     ")
    print("")

# function to check status after every move
# return 1 if game is won
# return 0 if tie
# return -1 if game is in progress
def checkwin(game):
    if (game[0][0] == game[0][1] and game[0][1] == game[0][2]):
        return 1
    elif (game[1][0] == game[1][1] and game[1][1] == game[1][2]):
        return 1
    elif (game[2][0] == game[2][1] and game[2][1] == game[2][2]):
        return 1
    elif (game[0][0] == game[1][0] and game[1][0] == game[2][0]):
        return 1
    elif (game[0][1] == game[1][1] and game[1][1] == game[2][1]):
        return 1
    elif (game[0][2] == game[2][2] and game[1][2] == game[2][2]):
        return 1
    elif (game[0][0] == game[1][1] and game[1][1] == game[2][2]):
        return 1
    elif (game[0][2] == game[1][1] and game[1][1] == game[2][0]):
        return 1
    elif (game[0][0] != '1' and game[0][1] != '2' and game[0][2] != '3' and game[1][0] != '4' and game[1][1] != '5' and game[1][2] != '6' and game[2][0] != '7' and game[2][1] != '8' and game[2][2] != '9'):
        return 0
    else:
        return -1


player=1
i=-1

while i==-1:
    display(table)

    if (player%2==1):
        player = 1
        mark= 'X' 
    elif (player%2==0):
        player = 2
        mark='O' 

    print("Player ", player)
    choice=int(input("Enter cell number: "))

    if (choice == 1 and table[0][0] == '1'):
        table[0][0] = mark
    elif (choice == 2 and table[0][1] == '2'):
        table[0][1] = mark
    elif (choice == 3 and table[0][2] == '3'):
        table[0][2] = mark
    elif (choice == 4 and table[1][0] == '4'):
        table[1][0] = mark
    elif (choice == 5 and table[1][1] == '5'):
        table[1][1] = mark
    elif (choice == 6 and table[1][2] == '6'):
        table[1][2] = mark
    elif (choice == 7 and table[2][0] == '7'):
        table[2][0] = mark
    elif (choice == 8 and table[2][1] == '8'):
        table[2][1] = mark
    elif (choice == 9 and table[2][2] == '9'):
        table[2][2] = mark
    else:
        print("Invalid Move")
        player=player-1
    
    i=checkwin(table)
    player=player+1

display(table)

if (i==1):
    print(" Player", player-1, " wins")
elif (i==0):
    print(" Game draw!")

wait = input("Press any key to exit!")