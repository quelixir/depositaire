"""A share registrar solution for the 21st century."""

from flask import Flask, jsonify
app = Flask(__name__)  # noqa

import config  # noqa: E402
import routes.api.v1  # noqa

app.debug = config.getboolean('DEBUG')


@app.route('/')
def hello_world():
    """Route endpoint."""
    return jsonify(hello='world',
                   app='depositaire',
                   debug=config.get('DEBUG'),
                   version=config.get('VERSION'))


if __name__ == '__main__':
    app.run()
