CREATE TRIGGER trigger_update_timestamp
BEFORE UPDATE FOR customer
FOR EACH ROW
EXECUTE FUNCTION update_timestamp();