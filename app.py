from flask import Flask

app = Flask(__name__)

# init
import config

app.debug = config.getboolean('DEBUG')

# API
import routes.api.v1

# default route
from flask import jsonify


@app.route('/')
def hello_world():
    return jsonify(hello="world", app="depositaire", version=config.get('VERSION'))


if __name__ == '__main__':
    app.run()
