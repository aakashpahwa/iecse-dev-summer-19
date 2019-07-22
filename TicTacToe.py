print('---------------------------TIC TAC TOE-----------------------------\n')
print('\t\t\t___|__|___')
print('\t\t\t___|__|___')
print('\t\t\t   |  |   ')
print("please choose your symbol:\n1.Player1->X\n2.Player2->O\n>>")
print('\t\t\t_1|_2_|_3__')
print('\t\t\t_4|_5_|_6_')
print('\t\t\t 7| 8 | 9 ')
list_Pl1 = []
list_Pl2 = []

list = ['', '', '', '', '', '', '', '', '', '']




def displayBoard(player, input):

    print('the input is', input)
    ''''''
    print("\t\t\t_", list[1], "_|_", list[2], "_|_", list[3], "_")
    print("\t\t\t_", list[4], "_|_", list[5], "_|_", list[6], "_")
    print("\t\t\t_", list[7], "_|_", list[8], "_|_", list[9], "_")




def check_input(input_pl):
    if list[input_pl] == '':
        return True
    else:
        return False




def winner(chk):
    return (list[1] == list[2] == list[3] == chk or
            list[4] == list[5] == list[6] == chk or
            list[7] == list[8] == list[9] == chk or
            list[1] == list[4] == list[7] == chk or
            list[2] == list[5] == list[8] == chk or
            list[3] == list[6] == list[9] == chk or
            list[1] == list[5] == list[9] == chk or
            list[7] == list[5] == list[3] == chk)



def play():
       
    list_input = 1
   
    error_pl2 = 'off'
    while(list_input <= 9):  
        if(list_input % 2 != 0):  
            print('Player:X Enter your desired position')
            input_Pl1 = int(input('')) 
            
            if (check_input(input_Pl1)) and (error_pl2 == 'off'):
               
                list[input_Pl1] = "X"
                displayBoard('X', input_Pl1)
               
                if(winner('X')):
                    print("X is winner")
                    break
                                   list_input += 1

            else:  
                print('the position is already taken.Please choose wisely player X\n`')
                continue
        else:
            
            if(list_input != 9):
                print('Player:O Enter your desired position')

                input_Pl2 = int(input(''))
                if check_input(input_Pl2):

                    list[input_Pl2] = "O"
                    list_Pl2.append(input_Pl2)
                    if(winner("O")):
                        print("O is winner")
                        break
                    list_input += 1

                    displayBoard("O", input_Pl2)
                    error_pl2 = 'off'

                else:
                    print(
                        'the position is already taken .Please choose wisely player O \n')
                   
                    error_pl2 = 'on'
    repeat = input('do you want another game? y for yes and n for no?::')
    if(repeat == "y" or repeat == "Y"):
        play()
play()
