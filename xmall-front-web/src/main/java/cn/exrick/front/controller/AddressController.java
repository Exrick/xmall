package cn.exrick.front.controller;

import cn.exrick.common.pojo.Result;
import cn.exrick.common.utils.ResultUtil;
import cn.exrick.manager.pojo.TbAddress;
import cn.exrick.sso.service.AddressService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author Exrickx
 */
@RestController
@Api(description = "收货地址")
public class AddressController {

    @Autowired
    private AddressService addressService;

    @RequestMapping(value = "/member/addressList",method = RequestMethod.POST)
    @ApiOperation(value = "获得所有收货地址")
    public Result<List<TbAddress>> addressList(@RequestBody TbAddress tbAddress){

        List<TbAddress> list=addressService.getAddressList(tbAddress.getUserId());
        return new ResultUtil<List<TbAddress>>().setData(list);
    }

    @RequestMapping(value = "/member/address",method = RequestMethod.POST)
    @ApiOperation(value = "通过id获得收货地址")
    public Result<TbAddress> address(@RequestBody TbAddress tbAddress){

        TbAddress address=addressService.getAddress(tbAddress.getAddressId());
        return new ResultUtil<TbAddress>().setData(address);
    }

    @RequestMapping(value = "/member/addAddress",method = RequestMethod.POST)
    @ApiOperation(value = "添加收货地址")
    public Result<Object> addAddress(@RequestBody TbAddress tbAddress){

        int result=addressService.addAddress(tbAddress);
        return new ResultUtil<Object>().setData(result);
    }

    @RequestMapping(value = "/member/updateAddress",method = RequestMethod.POST)
    @ApiOperation(value = "编辑收货地址")
    public Result<Object> updateAddress(@RequestBody TbAddress tbAddress){

        int result=addressService.updateAddress(tbAddress);
        return new ResultUtil<Object>().setData(result);
    }

    @RequestMapping(value = "/member/delAddress",method = RequestMethod.POST)
    @ApiOperation(value = "删除收货地址")
    public Result<Object> delAddress(@RequestBody TbAddress tbAddress){

        int result=addressService.delAddress(tbAddress);
        return new ResultUtil<Object>().setData(result);
    }
}
