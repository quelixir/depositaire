"""Tests for /api/holder_types endpoint."""


def test_holder_types_endpoint_not_empty(client):
    """Ensure /api/holder_types endpoint is not empty."""
    for url in ('/api/holder_types', '/api/holder_types/'):
        res = client.get(url, follow_redirects=True)
        data = res.get_data(as_text=True)
        assert data is not None


def test_holder_types_endpoint_contains_description(client):
    """Ensure /api/holder_types endpoint contains 'description'."""
    for url in ('/api/holder_types', '/api/holder_types/'):
        res = client.get(url, follow_redirects=True)
        data = res.get_data(as_text=True)
        assert 'description' in data


def test_holder_types_endpoint_individualrecord(client):
    """Ensure /api/holder_types/<id> endpoint works."""
    res = client.get(
        '/api/holder_types/959bc08a-db64-482e-b431-559731059b32',
        follow_redirects=True)
    data = res.get_data(as_text=True)
    assert 'trust' in data
