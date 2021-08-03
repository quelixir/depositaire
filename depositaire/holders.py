"""Holders endpoint."""

from flask import Blueprint, jsonify

from depositaire import database, util

conn = database.get()
cursor = conn.cursor()

bp = Blueprint('api-holders',
               __name__, url_prefix='/api/holders')


@bp.route('/')
def holders():
    """Return /holders endpoint."""
    cursor.execute('SELECT * FROM `holders`;')
    execution = cursor.fetchall()
    return util.jsondump(execution, cursor), 200,\
        {'Content-Type': 'application/json'}


@bp.route('/<id>')
def holders_by_id(id=None):
    """Return /holders/<id> endpoint."""
    if (len(id) == 36):
        cursor.execute(
            'SELECT * FROM `holders` WHERE `id` = "{0}";'.format(id),
        )
        execution = cursor.fetchall()
        return util.jsondump(execution, cursor), 200, \
            {'Content-Type': 'application/json'}
    else:
        return jsonify(error=400)
