"""Transactions endpoint."""

from flask import Blueprint, jsonify

from depositaire import database, util

conn = database.get()
cursor = conn.cursor()

bp = Blueprint('api-transactions',
               __name__, url_prefix='/api/transactions')


@bp.route('/')
def transactions():
    """Return /transactions endpoint."""
    cursor.execute('SELECT * FROM `transactions`;')
    execution = cursor.fetchall()
    return util.jsondump(execution, cursor), 200,\
        {'Content-Type': 'application/json'}


@bp.route('/<id>')
def transactions_by_id(id=None):
    """Return /transactions/<id> endpoint."""
    if (len(id) == 36):
        cursor.execute('SELECT * FROM `transactions` WHERE `id` = %s;',
                       (id,))
        execution = cursor.fetchall()
        return util.jsondump(execution, cursor), 200, \
            {'Content-Type': 'application/json'}
    else:
        return jsonify(error=400)
