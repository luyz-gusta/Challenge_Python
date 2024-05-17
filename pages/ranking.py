import time
from model import rankingDAO

def ranking(cursor):
    data_ranking = rankingDAO.selectRanking(cursor=cursor)

    # Definindo o comprimento máximo do nome de usuário para garantir alinhamento
    max_username_length = max(len(user[0]) for user in data_ranking) + 2  # Adicionando 2 para espaçamento extra

    length_str = max_username_length + 14

    print("\n--Ranking--")
    for index in range(0, length_str):
        print('-', end="")
    print('-')

    for index in range(1, len(data_ranking) + 1):
        user = data_ranking[index - 1]
        username = user[0].ljust(max_username_length)  # Alinhando o nome de usuário à esquerda

        if index < 10:
            if user[1] < 100:
                print(f"| {index}°  - {username} - {user[1]}  |")
            else:
                print(f"| {index}°  - {username} - {user[1]} |")
        else:
            if user[1] < 100:
                print(f"| {index}° - {username} - {user[1]}  |")
            else:
                print(f"| {index}° - {username} - {user[1]} |")
    for index in range(0, length_str):
        print('-', end="")
    print('-')

    time.sleep(2.0)

    status = True
    looping_decision = True
    print('\nDeseja voltar ao menu? ')
    while looping_decision:
        option = input('(S) Sim \n(N) Não, encerrar programar\n').lower()

        if option == 's':
            status = True
            looping_decision = False
        elif option == 'n':
            status = False
            looping_decision = False
            print('Obrigado por utilizar o sistema !!')
        else:
            print('Opção inválida! Digite a opção novamente:')

    return status
