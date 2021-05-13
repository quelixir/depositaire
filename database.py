import config

import sqlite3

conn = sqlite3.connect(config.get('DB_FILE'), check_same_thread=False)


def get():
    return conn
