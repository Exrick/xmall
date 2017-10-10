package cn.exrick.sso.service;

import cn.exrick.manager.pojo.TbAddress;

import java.util.List;

public interface AddressService {

    List<TbAddress> getAddressList(Long userId);

    int addAddress(TbAddress tbAddress);

    int updateAddress(TbAddress tbAddress);

    int delAddress(TbAddress tbAddress);
}
