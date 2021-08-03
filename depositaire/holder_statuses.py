"""Holder statuses endpoint."""

from flask import Blueprint, jsonify

from depositaire import database, util

conn = database.get()
cursor = conn.cursor()

bp = Blueprint('api-holder_statuses',
               __name__, url_prefix='/api/holder_statuses')


@bp.route('/')
def holder_statuses():
    """Return /holder_statuses endpoint."""
    cursor.execute('SELECT * FROM `holder_statuses`;')
    execution = cursor.fetchall()
    return util.jsondump(execution, cursor), 200, \
        {'Content-Type': 'application/json'}


@bp.route('/<id>')
def holder_status_by_id(id=None):
    """Return /holder_statuses/<id> endpoint."""
    if (len(id) == 36):
        cursor.execute(
            'SELECT * FROM `holder_statuses` WHERE `id` = "{0}";'.format(id),
        )
        execution = cursor.fetchall()
        return util.jsondump(execution, cursor), 200, \
            {'Content-Type': 'application/json'}
    else:
        return jsonify(error=400)
