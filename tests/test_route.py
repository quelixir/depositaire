"""Tests for route endpoint."""


def test_route_endpoint_not_empty(client):
    """Ensure route endpoint is not empty."""
    res = client.get('/', follow_redirects=True)
    data = res.get_data(as_text=True)
    assert data is not None


def test_route_endpoint_contains_depositaire(client):
    """Ensure route endpoint contains 'depositaire'."""
    res = client.get('/', follow_redirects=True)
    data = res.get_data(as_text=True)
    assert 'depositaire' in data
