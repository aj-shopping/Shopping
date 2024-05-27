package com.shopping.dao;

import com.shopping.entity.ShoppingRecord;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;


@Repository
public class ShoppingRecordDaoImplement implements ShoppingRecordDao {
    @Resource
    private SessionFactory sessionFactory;

    @Override
    public ShoppingRecord getShoppingRecord(int userId, int productId, String time) {
        String hql = "from ShoppingRecord where userId=? and productId=? and time=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, userId);
        query.setParameter(1, productId);
        query.setParameter(2, time);
        return (ShoppingRecord) query.uniqueResult();
    }

    @Override
    public void addShoppingRecord(ShoppingRecord shoppingRecord) {
        sessionFactory.getCurrentSession().save(shoppingRecord);
    }

    @Override
    public boolean deleteShoppingRecord(int userId, int productId) {
        String hql = "delete ShoppingRecord where userId=? and productId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, userId);
        query.setParameter(1, productId);
        return query.executeUpdate() > 0;
    }

    @Override
    public boolean updateShoppingRecord(ShoppingRecord shoppingRecord) {
        // 获取当前日期
        Date currentDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        // 格式化日期为字符串
        String dateString = dateFormat.format(currentDate);
        // 生成三位随机数
        Random random = new Random();
        int randomNumber = random.nextInt(1000);
        // 组合日期和随机数
        String ordernumber = dateString + String.format("%03d", randomNumber);
        String delivery_id = "SF" + ordernumber;
        String hql = "update ShoppingReocrd set orderStatus=? where userId=? and productId=? and time=?";
        String sql = "update shopping_record set order_status=" + shoppingRecord.getOrderStatus() + ",delivery_id=" + delivery_id + " where user_id=" + shoppingRecord.getUserId() + " and product_id=" + shoppingRecord.getProductId() + " and time='" + shoppingRecord.getTime() + "'";
//        Query query = sessionFactory.getCurrentSession().createQuery(hql);
//        query.setParameter(0,shoppingRecord.getOrderStatus());
//        query.setParameter(1,shoppingRecord.getUserId());
//        query.setParameter(2,shoppingRecord.getProductId());
//        query.setParameter(3,shoppingRecord.getTime());
        Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
        return query.executeUpdate() > 0;
    }

    @Override
    public List<ShoppingRecord> getShoppingRecords(int userId) {
        String hql = "from ShoppingRecord where userId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, userId);
        return query.list();
    }

    @Override
    public List<ShoppingRecord> getAllShoppingRecords() {
        String hql = "from ShoppingRecord";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        return query.list();
    }

    @Override
    public List<ShoppingRecord> getShoppingRecordsByOrderStatus(int orderStatus) {
        String hql = "from ShoppingRecord where orderStatus=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, orderStatus);
        return query.list();
    }

    @Override
    public boolean getUserProductRecord(int userId, int productId) {
        String hql = "from ShoppingRecord where userId=? and productId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, userId);
        query.setParameter(1, productId);
        return query.list().size() > 0;
    }

    @Override
    public boolean deleteShoppingRecordByUser(int userId) {
        String hql = "delete ShoppingRecord where userId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, userId);
        return query.executeUpdate() > 0;
    }

    @Override
    public boolean deleteShoppingRecordByProductId(int productId) {
        String hql = "delete ShoppingRecord where productId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, productId);
        return query.executeUpdate() > 0;
    }

    @Override
    public boolean returnGood(int userId, int productId, String time) {
        String sql = "update shopping_record set order_status=3 where user_id=" + userId + " and product_id=" + productId + " and time='" + time + "'";
        Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
        return query.executeUpdate() > 0;
    }
}
