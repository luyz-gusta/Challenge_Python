from model import rankingDAO

def ranking(cursor):
    data_ranking = rankingDAO.selectRanking(cursor=cursor)

