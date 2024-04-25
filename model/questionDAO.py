def selectAllQuestions(cursor):
    script = "select * from tbl_question_quiz_py order by id asc"

    cursor.execute(script)
    result = cursor.fetchall()

    return result
