"""Connects to the database."""

import mysql.connector as db

from depositaire import config

conn = db.connect(
    user=config.get('DB_USER'),
    password=config.get('DB_PASS'),
    host=config.get('DB_HOST'),
    port=config.getint('DB_PORT'),
    database=config.get('DB_NAME'),
)


def get():
    """
    Return the database MySQLConnection object.

    Returns:
        The database MySQLConnection object.
    """
    return conn
