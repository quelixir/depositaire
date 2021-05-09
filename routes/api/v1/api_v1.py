from app import app
from flask import jsonify

BASE_URL = "/api/v1"


@app.route(BASE_URL)
@app.route(BASE_URL + '/index')
def api_v1():
    return jsonify(api="v1")
