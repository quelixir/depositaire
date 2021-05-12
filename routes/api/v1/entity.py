from app import app
from flask import jsonify

import config
from . import api_v1


@app.route(api_v1.BASE_URL + '/entity')
def entity():
    ent_name = {'ent_name_full': config.get('ENT_NAME_FULL'),
                'ent_name_short': config.get('ENT_NAME_SHORT'),
                'ent_name_legal': config.get('ENT_NAME_LEGAL')}
    return jsonify(ent_name=ent_name)
