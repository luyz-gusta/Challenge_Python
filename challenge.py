import os
from model import server
from pages import game, ranking

os.system('cls')
connection = server.create_server_connection(
    host='challenge-mahindra.mysql.database.azure.com',
    database='db_challenge_formulae',
    password='challenge2024@',
    root='lemma_root'
)

if connection:
    print('**************** Quiz Formula E ****************')

    user_name = input('Digite o nome do usuario (Até 20 carácteres): ')
    while True:
        if len(user_name) < 3 or len(user_name) > 20:
            print('Nome de usuário inválido!!')
            user_name = input('Digite novamente o nome do usuario (Até 20 carácteres): ')
        else:
            break
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

        if option == '1':
            looping = game.quiz(connection=connection,cursor=cursor, user_name=user_name)
        elif option == '2':
            looping = ranking.ranking(cursor=cursor)
        elif option == '3':
            looping = False
        else:
            print('Opção inválida! Digite novamente.')
        cursor.close()
connection.close()
print('Programa finalizado!')
