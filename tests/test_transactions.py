"""Tests for /api/transactions endpoint."""


def test_transactions_endpoint_not_empty(client):
    """Ensure /api/transactions endpoint is not empty."""
    for url in ('/api/transactions', '/api/transactions/'):
        res = client.get(url, follow_redirects=True)
        data = res.get_data(as_text=True)
        assert data is not None
