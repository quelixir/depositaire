"""Entity endpoint."""

from flask import Blueprint, jsonify

from depositaire import config

bp = Blueprint('api-entity', __name__, url_prefix='/api/entity')


@bp.route('/')
@bp.route('/index')
def entity():
    """Return /api/entity endpoint."""
    entity_name = {'entity_name_full': config.get('ENTITY_NAME_FULL'),
                   'entity_name_short': config.get('ENTITY_NAME_SHORT'),
                   'entity_name_legal': config.get('ENTITY_NAME_LEGAL')}
    return jsonify(entity_name=entity_name)
