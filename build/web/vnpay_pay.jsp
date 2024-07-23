<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Tạo mới đơn hàng</title>
    <link href="/vnpay_jsp/assets/bootstrap.min.css" rel="stylesheet"/>
    <link href="/vnpay_jsp/assets/jumbotron-narrow.css" rel="stylesheet">
    <script src="/vnpay_jsp/assets/jquery-1.11.3.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="header clearfix">
            <h3 class="text-muted">VNPAY </h3>
        </div>
        
     <div class="container form-container">
        <h2 class="text-center mb-4">Thanh Toán Với VNPay</h2>
        <form action="/vnpay_jsp/vnpayajax" id="frmCreateOrder" method="post">
            <div class="form-group">
                <label for="amount">Số tiền</label>
                <input class="form-control" data-val="true" data-val-number="The field Amount must be a number." data-val-required="The Amount field is required."
                       id="amount" max="100000000" min="1" name="totalAmount" type="number" value="<%= request.getParameter("totalAmount") %>" readonly />
            </div>
            <div class="form-group">
                <label for="orderInfo">Thông tin thanh toán (Đảm bảo thông tin chính xác để nhận hàng)</label>
                <input class="form-control" id="orderInfo" name="orderInfo" type="text" value="<%= request.getParameter("fullName") %> - email: <%= request.getParameter("userEmail") %> - sdt: <%= request.getParameter("phonenumber") %> - giao hang toi dia chi: <%= request.getParameter("address") %> "/>
            </div>
            <h4>Chọn phương thức thanh toán</h4>
            <div class="form-group">
                <select class="form-control" id="bankCode" name="bankCode">
                    <option value="">Cổng thanh toán VNPAYQR</option>
                    <option value="VNBANK">Thanh toán qua thẻ ATM/Tài khoản nội địa</option>
                    <option value="INTCARD">Thanh toán qua thẻ quốc tế</option>
                </select>
            </div>
            <div class="form-group">
                <h5>Chọn ngôn ngữ giao diện thanh toán:</h5>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" id="languageVn" name="language" value="vn" checked>
                    <label class="form-check-label" for="languageVn">Tiếng việt</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" id="languageEn" name="language" value="en">
                    <label class="form-check-label" for="languageEn">Tiếng anh</label>
                </div>
            </div>
            <button type="submit" class="btn btn-custom btn-lg btn-block">Thanh toán</button>
        </form>
    </div>
        <p>
            &nbsp;
        </p>
        <footer class="footer">
            <p>&copy; VNPAY 2024</p>
        </footer>
    </div>

    <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
    <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
    <script type="text/javascript">
        $("#frmCreateOrder").submit(function () {
            var postData = $("#frmCreateOrder").serialize();
            var submitUrl = $("#frmCreateOrder").attr("action");
            $.ajax({
                type: "POST",
                url: submitUrl,
                data: postData,
                dataType: 'JSON',
                success: function (x) {
                    if (x.code === '00') {
                        if (window.vnpay) {
                            vnpay.open({width: 768, height: 600, url: x.data});
                        } else {
                            location.href = x.data;
                        }
                        return false;
                    } else {
                        alert(x.message);
                    }
                }
            });
            return false;
        });
    </script>
</body>
</html>
