"""Transaction codes endpoint."""

from flask import Blueprint, jsonify

from depositaire import database, util

conn = database.get()
cursor = conn.cursor()

bp = Blueprint('api-transaction_codes',
               __name__, url_prefix='/api/transaction_codes')


@bp.route('/')
def transaction_codes():
    """Return /transaction_codes endpoint."""
    cursor.execute('SELECT * FROM `transaction_codes`;')
    execution = cursor.fetchall()
    return util.jsondump(execution, cursor), 200, \
        {'Content-Type': 'application/json'}


@bp.route('/<id>')
def transaction_code_by_id(id=None):
    """Return /transaction_codes/<id> endpoint."""
    if (len(id) == 36):
        cursor.execute(
            'SELECT * FROM `transaction_codes` WHERE `id` = "{0}";'.format(id),
        )
        execution = cursor.fetchall()
        return util.jsondump(execution, cursor), 200, \
            {'Content-Type': 'application/json'}
    else:
        return jsonify(error=400)
