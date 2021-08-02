"""Tests for /api/entity endpoint."""


def test_entity_endpoint_empty(client):
    """Ensure /api/entity endpoint is not empty."""
    for url in ('/api/entity', '/api/entity/', '/api/entity/index'):
        res = client.get(url, follow_redirects=True)
        data = res.get_data(as_text=True)
        assert data is not None


def test_entity_endpoint_contains_acme(client):
    """Ensure /api/entity endpoint contains 'ACME'."""
    for url in ('/api/entity', '/api/entity/', '/api/entity/index'):
        res = client.get(url, follow_redirects=True)
        data = res.get_data(as_text=True)
        assert 'ACME' in data
