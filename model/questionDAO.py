def selectAllQuestions(cursor):
    script = "select * from tbl_question_quiz_py order by RAND() limit 10"

    cursor.execute(script)
    result = cursor.fetchall()

    return result
