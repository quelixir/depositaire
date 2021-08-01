"""Transactions endpoint."""

from flask import jsonify

import database
from app import app

from . import api_v1, util

conn = database.get()
cursor = conn.cursor(buffered=True)


@app.route(api_v1.BASE_URL + '/transactions')
def transactions():
    """Return /transactions endpoint."""
    cursor.execute('SELECT * FROM `transactions`;')
    execution = cursor.fetchall()
    return util.jsondump(execution, cursor), 200, {
        'Content-Type': 'application/json'}


@app.route(api_v1.BASE_URL + '/transactions/<id>')
def transactions_by_id(id=None):
    """Return /transactions/<id> endpoint."""
    if (len(id) == 36):
        cursor.execute('SELECT * FROM `transactions` WHERE `id` = %s;',
                       (id,))
        execution = cursor.fetchall()
        return util.jsondump(execution, cursor), 200,\
            {'Content-Type': 'application/json'}
    else:
        return jsonify(error=400)


@app.route(api_v1.BASE_URL + '/transaction_codes')
def transaction_codes():
    """Return /transaction_codes endpoint."""
    cursor.execute('SELECT * FROM `transaction_codes`;')
    execution = cursor.fetchall()
    return util.jsondump(execution, cursor), 200,\
        {'Content-Type': 'application/json'}


@app.route(api_v1.BASE_URL + '/transaction_codes/<id>')
def transaction_codes_by_id(search_id=None):
    """Return /transaction_codes/<id> endpoint."""
    if (len(search_id) == 36):
        cursor.execute('SELECT * FROM `transaction_codes` WHERE `id` = %s;',
                       (search_id,))
        execution = cursor.fetchall()
        return util.jsondump(execution, cursor), 200,\
            {'Content-Type': 'application/json'}
    else:
        return jsonify(error=400)
