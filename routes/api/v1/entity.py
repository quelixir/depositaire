from app import app
from flask import jsonify

import config
from . import api_v1


@app.route(api_v1.BASE_URL + '/entity')
def entity():
    ent_name = {'ent_name_full': config.cfg['ent_name']['ent_name_full'],
                'ent_name_short': config.cfg['ent_name']['ent_name_short'],
                'ent_name_legal': config.cfg['ent_name']['ent_name_legal']}
    return jsonify(ent_name=ent_name)
