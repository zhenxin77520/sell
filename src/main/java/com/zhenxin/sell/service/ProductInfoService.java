package com.zhenxin.sell.service;

import com.zhenxin.sell.dataobject.ProductInfo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ProductInfoService {

    ProductInfo findOne(String productId);

    /**
     * 查询所有在架商品
     * @return
     */
    List<ProductInfo> findUpAll();

    /**
     * 分页查询
     * @param pageable
     * @return
     */
    Page<ProductInfo> findAll(Pageable pageable);

    //加库存

    //减库存
}