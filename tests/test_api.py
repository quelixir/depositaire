"""Tests for /api endpoint."""


def test_api_endpoint_not_empty(client):
    """Ensure /api endpoint is not empty."""
    for url in ('/api', '/api/', '/api/index'):
        res = client.get(url, follow_redirects=True)
        data = res.get_data(as_text=True)
        assert data is not None


def test_api_endpoint_contains_api(client):
    """Ensure /api endpoint contains 'api'."""
    for url in ('/api', '/api/', '/api/index'):
        res = client.get(url, follow_redirects=True)
        data = res.get_data(as_text=True)
        assert 'api' in data
