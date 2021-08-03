"""Connects to the database."""

import sqlite3

import mysql.connector as mysql

from depositaire import config

if config.get('DB_TYPE').upper() == 'MARIADB':
    conn = mysql.connect(
        user=config.get('DB_USER'),
        password=config.get('DB_PASS'),
        host=config.get('DB_HOST'),
        port=config.getint('DB_PORT'),
        database=config.get('DB_NAME'),
    )
else:
    conn = sqlite3.connect(config.get('DB_FILE') or 'depositaire.sqlite',
                           check_same_thread=False)


def get():
    """
    Return the database connection object.

    Returns:
        The database connection object.
    """
    return conn
