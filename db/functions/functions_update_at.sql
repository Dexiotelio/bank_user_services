CREATE OR REPLACE FUNCTION update_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.update_at := NOW();
    RETURN NEW
END
$$ LANGUAGE plpgsql;