"""Transactions endpoint."""

from flask import Blueprint, jsonify, request

from depositaire import database, util

conn = database.get()
cursor = conn.cursor()

bp = Blueprint('api-transactions',
               __name__, url_prefix='/api/transactions')


@bp.route('', methods=['GET'])
def transactions():
    """Return /transactions GET endpoint."""
    cursor.execute('SELECT * FROM `transactions`;')
    execution = cursor.fetchall()
    return util.jsondump(execution, cursor), 200,\
        {'Content-Type': 'application/json'}


@bp.route('', methods=['POST', 'PUT'])
def transactions_create():
    """Return /transactions POST/PUT endpoints."""
    return jsonify(postOrPut=request.method), 200,\
        {'Content-Type': 'application/json'}


@bp.route('/<id>')
def transaction_by_id(id=None):
    """Return /transactions/<id> endpoint."""
    if (len(id) == 36):
        cursor.execute(
            'SELECT * FROM `transactions` WHERE `id` = "{0}";'.format(id),
        )
        execution = cursor.fetchall()
        return util.jsondump(execution, cursor), 200, \
            {'Content-Type': 'application/json'}
    else:
        return jsonify(error=400)
