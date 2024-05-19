package com.shopping.service;

import com.shopping.dao.ShoppingRecordDao;
import com.shopping.dao.UserDao;
import com.shopping.dao.UserDetailDao;
import com.shopping.entity.ShoppingRecord;
import com.shopping.entity.User;
import com.shopping.entity.UserDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service
public class ShoppingRecordServiceImplement implements ShoppingRecordService {
    @Autowired
    private ShoppingRecordDao shoppingRecordDao;
    @Autowired
    private UserDetailDao userDetailDao;

    @Override
    public ShoppingRecord getShoppingRecord(int userId, int productId,String time) {
        return shoppingRecordDao.getShoppingRecord(userId,productId,time);
    }

    @Override
    public void addShoppingRecord(ShoppingRecord shoppingRecord) {
        shoppingRecordDao.addShoppingRecord(shoppingRecord);
    }

    @Override
    public boolean deleteShoppingRecord(int userId, int productId) {
        return shoppingRecordDao.deleteShoppingRecord(userId,productId);
    }

    @Override
    public boolean updateShoppingRecord(ShoppingRecord shoppingRecord) {
        return shoppingRecordDao.updateShoppingRecord(shoppingRecord);
    }

    @Override
    public List<ShoppingRecord> getShoppingRecordsByOrderStatus(int orderStatus) {
        return shoppingRecordDao.getShoppingRecordsByOrderStatus(orderStatus);
    }

    @Override
    public List<ShoppingRecord> getShoppingRecords(int userId) {
        List<ShoppingRecord> shoppingRecords=shoppingRecordDao.getShoppingRecords(userId);
        UserDetail userDetail=userDetailDao.getUserDetail(userId);
        for (ShoppingRecord shoppingRecord : shoppingRecords) {
            String address=userDetail.getAddress();
            shoppingRecord.setAddress(address);
        }
        return shoppingRecords;
    }

    @Override
    public List<ShoppingRecord> getAllShoppingRecords() {
        return shoppingRecordDao.getAllShoppingRecords();
    }

    @Override
    public boolean getUserProductRecord(int userId,int productId) {
        return shoppingRecordDao.getUserProductRecord(userId,productId);
    }
}
