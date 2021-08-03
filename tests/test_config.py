"""Tests config parser."""

import unittest

from depositaire import config


class TestConfig(unittest.TestCase):
    """Tests config parser."""

    def test_config_get(self):
        """Test get method."""
        self.assertIsInstance(config.get('TITLE'), str)

    def test_config_autoprefixing(self):
        """Ensure returned values are the same with or without prefixes."""
        self.assertEqual(config.get('TITLE'), config.get('DEPOSITAIRE_TITLE'))

    def test_config_getboolean(self):
        """Test getboolean method."""
        self.assertIsInstance(config.getboolean('DEBUG'), bool)

    def test_config_getfloat(self):
        """Test getfloat method."""
        self.assertIsInstance(config.getfloat('DB_PORT'), float)

    def test_config_getint(self):
        """Test getint method."""
        self.assertIsInstance(config.getint('DB_PORT'), int)
