CREATE TRIGGER trigger_update_timestamp
BEFORE UPDATE FOR 'users'
FOR EACH ROW
EXECUTE FUNCTION update_timestamp();