"""Configure tests."""

import pytest

from depositaire import create_app


@pytest.fixture
def app():
    """Create and configure a new app instance for each test."""
    app = create_app()

    yield app


@pytest.fixture
def client(app):
    """Return test client for the app."""
    return app.test_client()


@pytest.fixture
def runner(app):
    """Return test runner for the app's Click commands."""
    return app.test_cli_runner()
