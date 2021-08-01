"""API v1 route endpoint."""

from flask import jsonify

from app import app

BASE_URL = '/api/v1'


@app.route(BASE_URL)
@app.route(BASE_URL + '/index')
def api_v1():
    """Return API v1 route endpoint."""
    return jsonify(api='v1')
