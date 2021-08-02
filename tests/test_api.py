"""Tests for /api endpoint."""


def test_api_endpoint_empty(client):
    """Ensure /api endpoint is not empty."""
    res = client.get('/api')
    data = res.get_data(as_text=True)
    assert data is not None


def test_api_endpoint_contains_api(client):
    """Ensure /api endpoint contains 'api'."""
    res = client.get('/api')
    data = res.get_data(as_text=True)
    assert 'api' in data
