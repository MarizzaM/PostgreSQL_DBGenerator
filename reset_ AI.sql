drop function sp_delete_all_records_and_set_ai_into_0;

create or replace function sp_delete_all_records_and_set_ai_into_0() returns int

language plpgsql AS
    $$
        DECLARE
            rows_count int := 0;
        BEGIN

            WITH row AS (
            DELETE FROM customers
            RETURNING 1)
            
            SELECT count(*) INTO rows_count FROM row;
            
            ALTER SEQUENCE customers_id_seq RESTART WITH 1;
            
            RETURN rows_count;

        END;
    $$;

select * from sp_delete_all_records_and_set_ai_into_0();
