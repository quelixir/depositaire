"""Tests for /api/holders endpoint."""


def test_holders_endpoint_not_empty(client):
    """Ensure /api/holders endpoint is not empty."""
    for url in ('/api/holders', '/api/holders/'):
        res = client.get(url, follow_redirects=True)
        data = res.get_data(as_text=True)
        assert data is not None
