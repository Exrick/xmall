package cn.exrick.sso.service.impl;

import cn.exrick.common.exception.XmallException;
import cn.exrick.manager.mapper.TbAddressMapper;
import cn.exrick.manager.pojo.TbAddress;
import cn.exrick.manager.pojo.TbAddressExample;
import cn.exrick.sso.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class AddressServiceImpl implements AddressService {

    @Autowired
    private TbAddressMapper tbAddressMapper;

    @Override
    public List<TbAddress> getAddressList(Long userId) {

        List<TbAddress> list=new ArrayList<>();
        TbAddressExample example=new TbAddressExample();
        TbAddressExample.Criteria criteria=example.createCriteria();
        criteria.andUserIdEqualTo(userId);
        list=tbAddressMapper.selectByExample(example);
        if(list==null){
            throw new XmallException("获取默认地址列表失败");
        }

        for(int i=0;i<list.size();i++){
            if(list.get(i).getIsDefault()){
                Collections.swap(list,0,i);
                break;
            }
        }

        return list;
    }

    @Override
    public TbAddress getAddress(Long addressId) {

        TbAddress tbAddress=tbAddressMapper.selectByPrimaryKey(addressId);
        if(tbAddress==null){
            throw new XmallException("通过id获取地址失败");
        }
        return tbAddress;
    }

    @Override
    public int addAddress(TbAddress tbAddress) {

        //设置唯一默认
        setOneDefault(tbAddress);
        if(tbAddressMapper.insert(tbAddress)!=1){
            throw new XmallException("添加地址失败");
        }
        return 1;
    }

    @Override
    public int updateAddress(TbAddress tbAddress) {

        //设置唯一默认
        setOneDefault(tbAddress);
        if(tbAddressMapper.updateByPrimaryKey(tbAddress)!=1){
            throw new XmallException("更新地址失败");
        }
        return 1;
    }

    @Override
    public int delAddress(TbAddress tbAddress) {

        if(tbAddressMapper.deleteByPrimaryKey(tbAddress.getAddressId())!=1){
            throw new XmallException("删除地址失败");
        }
        return 1;
    }

    public void setOneDefault(TbAddress tbAddress){
        //设置唯一默认
        if(tbAddress.getIsDefault()){
            TbAddressExample example=new TbAddressExample();
            TbAddressExample.Criteria criteria= example.createCriteria();
            criteria.andUserIdEqualTo(tbAddress.getUserId());
            List<TbAddress> list=tbAddressMapper.selectByExample(example);
            for(TbAddress tbAddress1:list){
                tbAddress1.setIsDefault(false);
                tbAddressMapper.updateByPrimaryKey(tbAddress1);
            }
        }
    }
}
