"""Interprets configuration variables."""

import os

import toml
from dotenv import load_dotenv

pyproject_toml = toml.load('pyproject.toml')
os.environ['DEPOSITAIRE_VERSION'] = pyproject_toml['tool']['poetry']['version']
pyproject_toml = None

load_dotenv()


def get(key):
    """
    Return the value of a specified configuration key as a string.

    Args:
        key: The key to return the value of.

    Returns:
        The value of the specified configuration key, as a string.
    """
    key = str(key).upper()
    if ('DEPOSITAIRE' in key[:11]):
        print()
        return str(os.getenv(key))
    else:
        return str(os.getenv('DEPOSITAIRE_' + key))


def getboolean(key):
    """
    Return the value of a specified configuration key as a boolean.

    Args:
        key: The key to return the value of.

    Returns:
        The value of the specified configuration key, as a boolean.
    """
    return bool(get(key))


def getfloat(key):
    """
    Return the value of a specified configuration key as a float.

    Args:
        key: The key to return the value of.

    Returns:
        The value of the specified configuration key, as a float.
    """
    return float(get(key))


def getint(key):
    """
    Return the value of a specified configuration key as an int.

    Args:
        key: The key to return the value of.

    Returns:
        The value of the specified configuration key, as an int.
    """
    return int(get(key))
