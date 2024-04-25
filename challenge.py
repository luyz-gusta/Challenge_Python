import os
from model import server
from pages import game

os.system('cls')
connection = server.create_server_connection('localhost', '1529dev', 'db_challenge_formulae')

if connection:
    print('**************** Quiz Formula E ****************')
    user_name = input('Digite o nome do usuario: ')
    print(f'Bem vindo {user_name} !!')

    looping = True

    while looping:

        # Cria um cursor
        cursor = connection.cursor()

        option = input(
            'O você deseja fazer? '
            '\n(1)Jogar o Quiz '
            '\n(2)Ranking'
            '\n(3)Entrar como Administrador'
            '\n(4)Sair do programa\n'
        )

        if int(option) == 1:
            looping = game.quiz(cursor=cursor)
        elif int(option) == 2:
            print('')
        elif int(option) == 3:
            print('')
        elif int(option) == 4:
            looping = False
        else:
            print('Opção inválida! Digite novamente.')
        cursor.close()
connection.close()
