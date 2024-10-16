CREATE OR REPLACE FUNCTION audit_customer_changes()
RETURN TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO customer_audit (
            customer_id, operation_type, changed_by, previous_value, new_value, change_details
        )
        VALUES (
            NEW.id, 'INSERT', CURRENT_USER, NULL, to_jsonb(NEW), 'Customer record created'
        );
        RETURN NEW;

    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO customer_audit (
        customer_id, operation_type, changed_by, previous_value, new_value, change_details
        )
        VALUES (
            NEW.id, 'UPDATE', CURRENT_USER, to_jsonb(OLD), to_jsonb(NEW), 'Customer record updated'
        );
        RETURN NEW;

    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO customer_audit (
            customer_id, operation_type, changed_by, previous_value, new_value, change_details
        )
        VALUES (
            OLD.id, 'DELETE', CURRENT_USER, to_jsonb(OLD), NULL, 'Customer record deleted'
        );
        RETURN OLD;
    END IF;
END;
$$ LANGUAGE plpgsql;