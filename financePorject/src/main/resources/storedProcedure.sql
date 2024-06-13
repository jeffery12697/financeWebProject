CREATE OR REPLACE FUNCTION insert_product(
    p_product_id VARCHAR,
    p_product_name VARCHAR,
    p_price DOUBLE PRECISION,
    p_fee_rate DOUBLE PRECISION
)
    RETURNS VOID AS
$func$
BEGIN
    -- 开始事务
BEGIN
        -- 检查是否存在相同的 product_id
        IF EXISTS (SELECT 1 FROM product WHERE product_id = p_product_id) THEN
            -- 如果存在相同的 product_id，抛出异常
            RAISE NOTICE 'Error: Duplicate product_id, operation rolled back.';
ELSE
            -- 如果不存在相同的 product_id，插入新记录
            INSERT INTO product (product_id, product_name, price, fee_rate)
            VALUES (p_product_id, p_product_name, p_price, p_fee_rate);
END IF;
EXCEPTION
        -- 捕获任何异常并回滚事务
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE NOTICE 'An error occurred, operation rolled back.';
END;
END;
$func$
LANGUAGE plpgsql;;


CREATE OR REPLACE FUNCTION insert_myuser(
    p_user_id VARCHAR,
    p_user_name VARCHAR,
    p_email VARCHAR,
    p_account VARCHAR
)
RETURNS VOID AS $$
BEGIN
BEGIN
        -- 尝试插入新记录
INSERT INTO myUser (user_id, user_name, email, account)
VALUES (p_user_id, p_user_name, p_email, p_account);
EXCEPTION
        -- 捕获唯一约束违规异常
        WHEN unique_violation THEN
            -- 略过错误并继续
            RAISE NOTICE 'User with user_id % already exists, skipping insertion.', p_user_id;
        -- 捕获其他异常并略过
WHEN OTHERS THEN
            RAISE NOTICE 'An error occurred while inserting user_id %, skipping insertion.', p_user_id;
END;
END;
$$ LANGUAGE plpgsql;;

CREATE OR REPLACE FUNCTION get_likelist_details()
    RETURNS TABLE (
                      product_id VARCHAR,
                      product_name VARCHAR,
                      price DECIMAL,
                      fee_rate DECIMAL,
                      user_id VARCHAR,
                      email VARCHAR,
                      quantity INT,
                      account VARCHAR,
                      total_fee DECIMAL,
                      total_amount DECIMAL,
                      sn INT
                  ) AS $$
BEGIN
    RETURN QUERY
        SELECT
            p.product_id,
            p.product_name,
            p.price,
            p.fee_rate,
            u.user_id,
            u.email,
            l.quantity,
            l.account,
            l.total_fee,
            l.total_amount,
            l.sn
        FROM
            likeList l
                JOIN
            product p ON l.product_id = p.product_id
                JOIN
            myUser u ON l.user_id = u.user_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_likelist_details_by_user(p_user_id VARCHAR)
    RETURNS TABLE (
                      product_id VARCHAR,
                      product_name VARCHAR,
                      price DECIMAL,
                      fee_rate DECIMAL,
                      user_id VARCHAR,
                      email VARCHAR,
                      quantity INT,
                      account VARCHAR,
                      total_fee DECIMAL,
                      total_amount DECIMAL,
                      sn INT
                  ) AS $$
BEGIN
    RETURN QUERY
        SELECT
            p.product_id,
            p.product_name,
            p.price,
            p.fee_rate,
            u.user_id,
            u.email,
            l.quantity,
            l.account,
            l.total_fee,
            l.total_amount,
            l.sn
        FROM
            likeList l
                JOIN
            product p ON l.product_id = p.product_id
                JOIN
            myUser u ON l.user_id = u.user_id
        WHERE
            u.user_id = p_user_id;
END;
$$ LANGUAGE plpgsql;;


CREATE OR REPLACE FUNCTION insert_likelist(
    p_user_id VARCHAR,
    p_product_id VARCHAR,
    p_account VARCHAR,
    p_quantity INT,
    p_total_fee DECIMAL,
    p_total_amount DECIMAL
)
    RETURNS VOID AS $$
BEGIN
    BEGIN
        -- 尝试插入新记录
        INSERT INTO likeList (user_id, product_id, account, quantity, total_fee, total_amount)
        VALUES (p_user_id, p_product_id, p_account, p_quantity, p_total_fee, p_total_amount);
    EXCEPTION
        -- 捕获唯一约束违规异常
        WHEN unique_violation THEN
            -- 略过错误并继续
            RAISE NOTICE 'LikeList entry with user_id % and product_id % already exists, skipping insertion.', p_user_id, p_product_id;
        -- 捕获其他异常并略过
        WHEN OTHERS THEN
            RAISE NOTICE 'An error occurred while inserting into likeList for user_id % and product_id %, skipping insertion.', p_user_id, p_product_id;
    END;
END;
$$ LANGUAGE plpgsql;;

CREATE OR REPLACE FUNCTION update_likelist(
    p_sn INT,
    p_user_id VARCHAR,
    p_product_id VARCHAR,
    p_account VARCHAR,
    p_quantity INT,
    p_total_fee DECIMAL,
    p_total_amount DECIMAL
)
    RETURNS VOID AS $$
BEGIN
    BEGIN
        -- 尝试更新记录
        UPDATE likeList
        SET user_id = p_user_id,
            product_id = p_product_id,
            account = p_account,
            quantity = p_quantity,
            total_fee = p_total_fee,
            total_amount = p_total_amount
        WHERE sn = p_sn;
    EXCEPTION
        -- 捕获唯一约束违规异常
        WHEN unique_violation THEN
            -- 略过错误并继续
            RAISE NOTICE 'LikeList entry with sn % could not be updated due to unique constraint violation.', p_sn;
        -- 捕获其他异常并略过
        WHEN OTHERS THEN
            RAISE NOTICE 'An error occurred while updating likeList entry with sn %, skipping update.', p_sn;
    END;
END;
$$ LANGUAGE plpgsql;;


CREATE OR REPLACE FUNCTION delete_likelist(p_sn INT)
    RETURNS VOID AS $$
BEGIN
    BEGIN
        -- 尝试删除记录
        DELETE FROM likeList WHERE sn = p_sn;
    EXCEPTION
        -- 捕获异常并略过
        WHEN OTHERS THEN
            RAISE NOTICE 'An error occurred while deleting likeList entry with sn %, skipping deletion.', p_sn;
    END;
END;
$$ LANGUAGE plpgsql;;







