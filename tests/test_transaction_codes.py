"""Tests for /api/transaction_codes endpoint."""


def test_transaction_codes_endpoint_empty(client):
    """Ensure /api/transaction_codes endpoint is not empty."""
    for url in ('/api/transaction_codes', '/api/transaction_codes/'):
        res = client.get(url, follow_redirects=True)
        data = res.get_data(as_text=True)
        assert data is not None


def test_transaction_codes_endpoint_contains_reason(client):
    """Ensure /api/transaction_codes endpoint contains 'reason'."""
    for url in ('/api/transaction_codes', '/api/transaction_codes/'):
        res = client.get(url, follow_redirects=True)
        data = res.get_data(as_text=True)
        assert 'reason' in data


def test_transaction_codes_endpoint_individualrecord(client):
    """Ensure /api/transaction_codes/<id> endpoint works."""
    res = client.get(
        '/api/transaction_codes/032dec5e-aa3a-4691-8467-93c7b439bbf8',
        follow_redirects=True)
    data = res.get_data(as_text=True)
    assert 'conversion_miscellaneous' in data
