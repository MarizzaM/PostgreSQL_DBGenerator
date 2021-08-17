drop procedure sp_insert_into_2_tables;

create or replace procedure sp_insert_into_2_tables(_name text, _age int , _product_name text)
language plpgsql AS
    $$
        DECLARE
        new_id bigint;
            BEGIN
            INSERT INTO customers (name, age)
            VALUES (_name, _age)
            RETURNING id into new_id;
            INSERT INTO orders (product_name, customer_id)
            VALUES (_product_name, new_id);
            END;
    $$;

call sp_insert_into_2_tables('Sam', 120, 'guitar');
