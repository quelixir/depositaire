"""Tests for /api/holder_statuses endpoint."""


def test_holder_statuses_endpoint_not_empty(client):
    """Ensure /api/holder_statuses endpoint is not empty."""
    for url in ('/api/holder_statuses', '/api/holder_statuses/'):
        res = client.get(url, follow_redirects=True)
        data = res.get_data(as_text=True)
        assert data is not None


def test_holder_statuses_endpoint_contains_description(client):
    """Ensure /api/holder_statuses endpoint contains 'description'."""
    for url in ('/api/holder_statuses', '/api/holder_statuses/'):
        res = client.get(url, follow_redirects=True)
        data = res.get_data(as_text=True)
        assert 'description' in data


def test_holder_statuses_endpoint_individualrecord(client):
    """Ensure /api/holder_statuses/<id> endpoint works."""
    res = client.get(
        '/api/holder_statuses/e4b2f116-d1ec-4b5e-a7c7-ee66b76fa90f',
        follow_redirects=True)
    data = res.get_data(as_text=True)
    assert 'active' in data
