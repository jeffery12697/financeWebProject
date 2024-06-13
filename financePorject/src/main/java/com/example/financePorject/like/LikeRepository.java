package com.example.financePorject.like;

import com.example.financePorject.Application;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.stereotype.Repository;


import java.util.List;
import java.util.Optional;

@Repository
public class LikeRepository {
    private static final Logger log = LoggerFactory.getLogger(Application.class);
    private final JdbcClient jdbcClient;


    public LikeRepository(JdbcClient jdbcClient) {
        this.jdbcClient = jdbcClient;
    }

    public List<Like> findAll(){
        String sql = "SELECT * FROM get_likelist_details();";
        return jdbcClient.sql(sql).query(Like.class).list();
    }

    public List<Like> findByUserId(String userId){
        String sql = "SELECT * FROM get_likelist_details_by_user(:id);";
        return jdbcClient.sql(sql)
                .param("id", userId).query(Like.class).list();
    }


    public void create(Like like) {
        String sql = "SELECT insert_likelist(:userId, :productId, :quantity, :account, :totalFee, :totalAmount);";

        jdbcClient.sql(sql)
                .param("userId", like.userId())
                .param("productId", like.productId())
                .param("quantity", like.quantity())
                .param("account", like.account())
                .param("totalFee", like.totalFee())
                .param("totalAmount", like.totalAmount())
                .query();;
    }

    public void update(Like newLike) {
        String sql = "SELECT update_likelist(:sn, :userId, :productId, :account, :quanyity, :totalFee, :totalAmount);";

        jdbcClient.sql(sql)
                .param("userId", newLike.userId())
                .param("productId", newLike.productId())
                .param("account", newLike.account())
                .param("quantity", newLike.quantity())
                .param("totalFee", newLike.totalFee())
                .param("totalAmount", newLike.totalAmount())
                .param("sn", newLike.sn())
                .query();
    }

    public void remove(Integer sn) {
        String sql = "SELECT delete_likelist(:sn);";

        jdbcClient.sql(sql)
                .param("sn", sn)
                .query();
    }
}
