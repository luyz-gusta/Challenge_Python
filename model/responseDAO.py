def selectResponseByIdQuestion(cursor, id: int):
    script = f"select * from tbl_response_quiz_py where id_question = '{id}' order by id asc"

    cursor.execute(script)
    result = cursor.fetchall()

    return result
