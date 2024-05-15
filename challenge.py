import os
from model import server
from pages import game

os.system('cls')
connection = server.create_server_connection(
    host='challenge-mahindra.mysql.database.azure.com',
    database='db_challenge_formulae',
    password='challenge2024@',
    root='lemma_root'
)

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
            '\n(3)Sair do programa\n'
        )

        if int(option) == 1:
            looping = game.quiz(connection=connection,cursor=cursor, user_name=user_name)
        elif int(option) == 2:
            print('')
        elif int(option) == 4:
            looping = False
        else:
            print('Opção inválida! Digite novamente.')

        print('Programa finalizado!')
        cursor.close()
connection.close()
