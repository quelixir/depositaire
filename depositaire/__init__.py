"""A share registrar solution for the 21st century."""

import os

from flask import Flask, jsonify

from depositaire import config, entity, transaction_codes, transactions


def create_app():
    """Create and configure an instance of the Flask application."""
    app = Flask(__name__, instance_relative_config=True)
    app.debug = config.getboolean('DEBUG')

    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    app.register_blueprint(entity.bp)
    app.register_blueprint(transactions.bp)
    app.register_blueprint(transaction_codes.bp)

    @app.route('/')
    def hello_world():
        """Route endpoint."""
        return jsonify(hello='world',
                       app='depositaire',
                       debug=config.get('DEBUG'),
                       version=config.get('VERSION'))

    @app.route('/api')
    @app.route('/api/')
    @app.route('/api/index')
    def api():
        """Return /api endpoint."""
        return jsonify(api='api')

    return app
