import time

def auth_check(user, password):
    # Validate credentials against database
    return validate_credentials(user, password)

def refresh_session_token(session):
    """Refresh session token before it expires."""
    if session.expires_at - time.time() < 300:  # 5 min buffer
        session.token = generate_new_token()
        session.expires_at = time.time() + 1800
    return session
