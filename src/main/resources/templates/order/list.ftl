<!doctype html>
<html lang="zh">
    <#include "../common/header.ftl">
<body>

<div id="wrapper" class="toggled">
    <#include "../common/nav.ftl">

    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th>订单ID</th>
                            <th>姓名</th>
                            <th>手机号</th>
                            <th>地址</th>
                            <th>金额</th>
                            <th>订单状态</th>
                            <th>支付状态</th>
                            <th>创建时间</th>
                            <th colspan="2">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                <#list orderDTOPage.content as item>
                <tr>
                    <td>${item.orderId}</td>
                    <td>${item.buyerName}</td>
                    <td>${item.buyerPhone}</td>
                    <td>${item.buyerAddress}</td>
                    <td>${item.orderAmount}</td>
                    <td>${item.getOrderStatusEnum()}</td>
                    <td>${item.getPayStatusEnum()}</td>
                    <td>${item.createTime}</td>
                    <td>
                        <a href="/sell/seller/order/detail?orderId=${item.orderId}">详情</a>
                    </td>
                    <td>
                            <#if item.orderStatus == 0>
                                <a href="/sell/seller/order/cancel?orderId=${item.orderId}">取消</a>
                            </#if>
                    </td>
                </tr>
                </#list>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-12 column">
                    <form id="mForm">
                        <input type="hidden" id="pageInput" name="page" value="0">
                        <ul class="pagination pull-right">
                    <#if currentPage == 0>
                        <li class="disabled">
                            <a href="javascript:void(0)">上一页</a>
                        </li>
                    <#else >
                        <li>
                            <a href="javascript:void(0)" onclick="jumpPage(${currentPage - 1})">上一页</a>
                        </li>
                    </#if>
                    <#list 1..orderDTOPage.getTotalPages() as item>
                        <#if (currentPage + 1) lte (item + 5) && (currentPage + 1) gte (item - 5)>
                            <#if currentPage == item_index>
                                <li class="disabled"><a href="#">${item}</a></li>
                            <#else >
                                <li class="">
                                    <a href="javascript:void(0)" onclick="jumpPage(${item_index})">${item}</a>
                                </li>
                            </#if>
                        </#if>
                    </#list>
                    <#if currentPage == (orderDTOPage.getTotalPages() - 1)>
                        <li class="disabled">
                            <a href="javascript:void(0)">下一页</a>
                        </li>
                    <#else >
                        <li>
                            <a href="javascript:void(0)" onclick="jumpPage(${currentPage + 1})">下一页</a>
                        </li>
                    </#if>
                        </ul>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<script
        src="https://code.jquery.com/jquery-2.2.4.min.js"
        integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
        crossorigin="anonymous"></script>
<script src="/sell/js/message-box.js"></script>
<script>
    
    function jumpPage(pageNum) {
        $("#pageInput").val(pageNum);
        $("#mForm").submit();
    }

    var webSocket = null;
    if ('webSocket' in window) {
        webSocket = new WebSocket("ws://localhost:9010/sell/webSocket");
    } else {
        MessageBox.alert("当前浏览器不支持 WebSocket ");
    }
    webSocket.onopen = function (ev) {
        MessageBox.tipe("<i>打开 WebSocket 连接</i>");
    };
    webSocket.onclose = function (ev) {
        MessageBox.tipe("<i>关闭 WebSocket 连接 </i>")
    };
    webSocket.onmessage = function (ev) {
        MessageBox.alert(ev.data, "提示");
    }
</script>
</body>
</html>