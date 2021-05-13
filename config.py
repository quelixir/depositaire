import os

import toml

pyproject_toml = toml.load('pyproject.toml')
os.environ['DEPOSITAIRE_VERSION'] = pyproject_toml['tool']['poetry']['version']
pyproject_toml = None

from dotenv import load_dotenv

load_dotenv()


def get(key):
    key = str(key).upper()
    if ('DEPOSITAIRE' in key[:11]):
        print()
        return str(os.getenv(key))
    else:
        return str(os.getenv('DEPOSITAIRE_' + key))


def getboolean(key):
    return bool(get(key))


def getfloat(key):
    return float(get(key))


def getint(key):
    return int(get(key))
