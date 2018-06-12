package com.zhenxin.sell.form;

import com.zhenxin.sell.dataobject.OrderDetail;
import lombok.Data;
import org.hibernate.validator.constraints.NotEmpty;

import java.util.List;


@Data
public class OrderForm {

    @NotEmpty(message = "姓名必填")
    private String name;

    @NotEmpty(message = "手机号必填")
    private String phone;

    @NotEmpty(message = "地址必填")
    private String address;

    @NotEmpty(message = "openid必填")
    private String openid;

    @NotEmpty(message = "购物车为空")
    private List<OrderDetail> items;

}
