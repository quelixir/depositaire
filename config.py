import configparser

cfg = configparser.ConfigParser()
cfg.read('depositaire.cfg')

import toml

pyproject_toml = toml.load('pyproject.toml')
VERSION = pyproject_toml['tool']['poetry']['version']
