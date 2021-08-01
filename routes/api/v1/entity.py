"""Entity endpoint."""

from flask import jsonify

import config
from app import app
from . import api_v1  # noqa


@app.route(api_v1.BASE_URL + '/entity')
def entity():
    """Return /entity endpoint."""
    entity_name = {'entity_name_full': config.get('ENTITY_NAME_FULL'),
                   'entity_name_short': config.get('ENTITY_NAME_SHORT'),
                   'entity_name_legal': config.get('ENTITY_NAME_LEGAL')}
    return jsonify(entity_name=entity_name)
