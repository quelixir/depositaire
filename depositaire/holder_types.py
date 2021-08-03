"""Holder types endpoint."""

from flask import Blueprint, jsonify

from depositaire import database, util

conn = database.get()
cursor = conn.cursor()

bp = Blueprint('api-holder_types',
               __name__, url_prefix='/api/holder_types')


@bp.route('/')
def holder_types():
    """Return /holder_types endpoint."""
    cursor.execute('SELECT * FROM `holder_types`;')
    execution = cursor.fetchall()
    return util.jsondump(execution, cursor), 200, \
        {'Content-Type': 'application/json'}


@bp.route('/<id>')
def holder_type_by_id(id=None):
    """Return /holder_types/<id> endpoint."""
    if (len(id) == 36):
        cursor.execute(
            'SELECT * FROM `holder_types` WHERE `id` = "{0}";'.format(id),
        )
        execution = cursor.fetchall()
        return util.jsondump(execution, cursor), 200, \
            {'Content-Type': 'application/json'}
    else:
        return jsonify(error=400)
