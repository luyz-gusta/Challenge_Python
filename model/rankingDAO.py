def selectRanking(cursor):
    script = f"select * from tbl_ranking_quiz_py"
    cursor.execute(script)
    result = cursor.fetchall()

    return result


def insertUserAndPoint(connection, cursor, user_name, points):
    script = f"insert into tbl_ranking_quiz_py (user_name, points) values ('{user_name}','{points}')"
    cursor.execute(script)
    connection.commit()

    script = "select id from tbl_ranking_quiz_py order by id desc limit 1"
    cursor.execute(script)
    id_user = cursor.fetchall()

    result = []
    id_user = id_user[0][0]
    args = [user_name, id_user]
    cursor.callproc('getUserRankingPosition', args)
    for data in cursor.stored_results():
        result = data.fetchall()
    print(result)

    return result
