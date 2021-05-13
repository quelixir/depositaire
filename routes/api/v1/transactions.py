from app import app
from flask import jsonify

from . import api_v1, util

import database

conn = database.get()

cursor = conn.cursor()


@app.route(api_v1.BASE_URL + '/transactions')
def transactions():
    return util.jsondump(cursor.execute('SELECT * FROM `transactions`;')), 200, {
        'Content-Type': 'application/json'}


@app.route(api_v1.BASE_URL + '/transactions/<id>')
def transactions_by_id(id=None):
    if (len(id) == 36):
        query = cursor.execute('SELECT * FROM `transactions` WHERE `id` = ? COLLATE NOCASE;',
                               (id,)).fetchall()
        return util.jsondump(query, cursor), 200, {'Content-Type': 'application/json'}
    else:
        return jsonify(error=400)


@app.route(api_v1.BASE_URL + '/transaction_codes')
def transaction_codes():
    return util.jsondump(cursor.execute('SELECT * FROM `transaction_codes`;')), 200, {
        'Content-Type': 'application/json'}


@app.route(api_v1.BASE_URL + '/transaction_codes/<id>')
def transaction_codes_by_id(id=None):
    if (len(id) == 36):
        query = cursor.execute('SELECT * FROM `transaction_codes` WHERE `id` = ? COLLATE NOCASE;',
                               (id,)).fetchall()
        return util.jsondump(query, cursor), 200, {'Content-Type': 'application/json'}

    else:
        return jsonify(error=400)
