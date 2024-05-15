import mysql.connector


def create_server_connection(host, password, database, root):
    connection = None

    try:
        # Conectar ao banco de dados
        connection = mysql.connector.connect(
            host=host,
            port='3306',
            user=root,
            password=password,
            database=database
        )
    except:
        print('Servidor indisponivel! Tente novamente mais tarde.')

    return connection
