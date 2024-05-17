import time
from model import responseDAO, questionDAO, rankingDAO


def quiz(connection, cursor, user_name):
    status = False

    alternative_dictionary = {
        '0': 'A',
        '1': 'B',
        '2': 'C',
        '3': 'D',
        'a': '0',
        'b': '1',
        'c': '2',
        'd': '3',
    }

    template = []

    list_questions = questionDAO.selectAllQuestions(cursor=cursor)
    points = 0

    for question_index, question in enumerate(list_questions):
        print(f"{question_index + 1}.{question[1]}")

        looping_response = True

        list_response = responseDAO.selectResponseByIdQuestion(cursor=cursor, id=question[0])
        for response_index, response in enumerate(list_response):
            print(f"({alternative_dictionary[str(response_index)]}) {response[2]}")

            if response_index + 1 == 4:
                while looping_response:
                    user_response = input('R: ')
                    if (
                            user_response.lower() != 'a' and
                            user_response.lower() != 'b' and
                            user_response.lower() != 'c' and
                            user_response.lower() != 'd'
                    ):
                        print('Digite a reposta novamente!!')
                    else:
                        alternative_answer = list_response[int(alternative_dictionary[user_response.lower()])]
                        if alternative_answer[3] == 1:
                            answer_dictionary = {
                                'question': question_index + 1,
                                'response': True
                            }
                            points += 1
                            template.append(answer_dictionary)
                        else:
                            answer_dictionary = {
                                'question': question_index + 1,
                                'response': False
                            }
                            template.append(answer_dictionary)

                        looping_response = False

    user = rankingDAO.insertUserAndPoint(connection=connection, cursor=cursor, user_name=user_name, points=points * 10)
    print(f"VOCÊ FEZ {points * 10} pontos está em {user[0][0]}°lugar")
    time.sleep(2.0)

    looping_template = True
    print('Deseja ver quais questões você acertou para essa pontuação?')
    while looping_template:
        decision = input('(S) Sim \n(N) Não\n').lower()

        if decision == 's':
            print('---- Legenda ----')
            print('C - Correto')
            print('E - Errado')

            print("\n--Resultado--")
            for answer in template:
                if len(str(answer['question'])) < 2:
                    print(f"|  {answer['question']}  -  {answer['response'] and 'C' or 'E'}  |")
                else:
                    print(f"|  {answer['question']} -  {answer['response'] and 'C' or 'E'}  |")
            print("-------------")
            looping_template = False
        elif decision == 'n':
            looping_template = False
        else:
            print("Opção Inválida! Digite uma das opção abaixo:")
    looping_decision = True

    time.sleep(2.0)
    print('Deseja voltar ao menu? ')
    while looping_decision:
        option = input('(S) Sim \n(N) Não, encerrar programar\n').lower()

        if option == 's':
            status = True
            looping_decision = False
        elif option == 'n':
            status = False
            looping_decision = False
            print('Obrigado por jogar o quiz !!')
        else:
            print('Opção inválida! Digite a opção novamente:')

    return status
