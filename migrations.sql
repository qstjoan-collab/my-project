-- Migration: Add index on events.created_at
-- Fixes dashboard API performance degradation (Issue #5)
-- Expected improvement: P50 from 4.2s to ~200ms

CREATE INDEX CONCURRENTLY idx_events_created_at 
ON events (created_at DESC);

-- Also add composite index for common dashboard query
CREATE INDEX CONCURRENTLY idx_events_user_created 
ON events (user_id, created_at DESC);
