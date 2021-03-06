package com.zhenxin.sell.dataobject;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.zhenxin.sell.enums.ProductStatusEnum;
import com.zhenxin.sell.utils.EnumUtil;
import lombok.Data;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 商品
 * product_info
 */
@Data
@Entity
@DynamicUpdate
public class ProductInfo implements Serializable{

    private static final long serialVersionUID = -5731218293306335496L;
    /**
     * 商品ID
     */
    @Id
    private String productId;

    /**
     * 商品名
     */
    private String productName;

    /**
     * 商品单价
     */
    private BigDecimal productPrice;

    /**
     * 商品库存
     */
    private Integer productStock;

    /**
     * 商品描述
     */
    private String productDescription;

    /**
     * 商品小图
     */
    private String productIcon;

    /**
     * 商品状态，0正常 1下架
     */
    private Integer productStatus = ProductStatusEnum.UP.getCode();

    /**
     * 类目编号
     */
    private Integer categoryType;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 修改时间
     */
    private Date updateTime;

    @JsonIgnore
    public String getProductStatusEnum() {
        ProductStatusEnum message = EnumUtil.getMessageByCode(productStatus, ProductStatusEnum.class);
        if (message != null) {
            return message.getMessage();
        }
        return null;
    }
}
