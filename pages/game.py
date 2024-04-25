import random
from model import responseDAO, questionDAO


def quiz(cursor):
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

    random_list_questions = [list_questions[0], list_questions[1]]
    # random_list_questions = random.sample(list_questions, k=2)
    points = 0

    for question_index, question in enumerate(random_list_questions):
        print(f"{question_index + 1}.{question[1]}")

        looping_response = True

        list_response = responseDAO.selectResponseByIdQuestion(cursor=cursor, id=question[0])
        for response_index, response in enumerate(list_response):
            print(f"({alternative_dictionary[str(response_index)]})-{response[2]}")

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
                                'question': question_index,
                                'response': True
                            }
                            points += 1
                            template.append(answer_dictionary)
                        else:
                            answer_dictionary = {
                                'question': question_index,
                                'response': False
                            }
                            template.append(answer_dictionary)

                        looping_response = False

    return False
