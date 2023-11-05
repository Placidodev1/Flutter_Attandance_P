import  pymysql
from config import  Config
connection = pymysql.connect(
    host=Config.HOST,
    user=Config.USER,
    password=Config.PASSWORD,
    database=Config.DATABASE,
    port=Config.PORT,
    cursorclass=pymysql.cursors.DictCursor
)