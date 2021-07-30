import config

import mysql.connector as db

conn = db.connect(
    user=config.get('DB_USER'),
    password=config.get('DB_PASS'),
    host=config.get('DB_HOST'),
    port=config.getint('DB_PORT'),
    database=config.get('DB_NAME')
)


def get():
    return conn
