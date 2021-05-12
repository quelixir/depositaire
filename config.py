import os

import toml

pyproject_toml = toml.load('pyproject.toml')
os.environ['DEPOSITAIRE_VERSION'] = pyproject_toml['tool']['poetry']['version']
pyproject_toml = None

from dotenv import load_dotenv

load_dotenv()


def get(key):
    return str(os.getenv('DEPOSITAIRE_' + str(key).upper()))


def getboolean(key):
    return bool(get(key))


def getfloat(key):
    return float(get(key))


def getint(key):
    return int(get(key))
