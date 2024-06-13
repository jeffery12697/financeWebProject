# FinanceWebProject

## 環境建置

* Java 22
* 開啟 Docker Desktop

## 操作方式

終端機依序輸入

```
git clone https://github.com/jeffery12697/financeWebProject.git

cd financeWebProject

cd financeProject

./mvnw spring-boot:run
```

## API 文件

### 基本URL

`{{BASEURL}}=http://localhost:8080`

### 新增金融喜好商品紀錄
假定金融商品(product)為固定資訊，productId 須已經在 product table 中

* 方法: POST
* URL: `{{BASEURL}}/api/likes`
* 描述: 創建一個新的喜好金融商品紀錄。
* request Body
```
{
    "userId": "U001",
    "productId": "P005",
    "account": "1234233",
    "totalFee": 10.1,
    "totalAmount": 200.1,
    "quantity":2
}

```

### 查詢喜好金融商品清單

* 方法: GET
* URL:` {{BASEURL}}/api/likes/user/{userID}`
* 描述: 根據使用者 ID 查詢其所有的喜好金融商品紀錄。

### 刪除喜好金融商品資訊


* 方法: DELETE
* URL: {{BASEURL}}/api/likes/{LikelistID}
* 描述: 根據紀錄的 ID 刪除喜好金融商品紀錄。


### 更改喜好金融商品資訊

* 方法: PUT
* URL: {{BASEURL}}/api/likes
* 描述: 更新一個喜好金融商品紀錄。
* request Body
```
{
    "userId": 3,
    "productId": 1,
    "orderAmount": 1,
    "account": "123456",
    "totalFee": 0.1,
    "totalAmount": 0.1
}
```

### 查詢所有喜好金融商品紀錄

* 方法: GET
* URL: {{BASEURL}}/api/likes
* 描述: 查詢所有喜好金融商品紀錄。


## 資料庫設計

選用 postgresql，用 docker compose 連接

### 資料庫架構圖

https://dbdiagram.io/d/666ae372a179551be6cd2051

![Untitled](https://hackmd.io/_uploads/B1znNDOS0.png)

### Stored Procedure

於 `resource.storedProcedure.sql` 中包含所有 api 用到的 Stored Procedure

### 測試資料

於程式開啟時會自動 load 10 筆測試資料於 table 中，指令存放於 `resource.data.sql`

* product table
![Screenshot 2024-06-13 at 8.41.32 PM](https://hackmd.io/_uploads/SytStvOSR.png)

* myuser table

![Screenshot 2024-06-13 at 8.41.53 PM](https://hackmd.io/_uploads/r1M9KvOBC.png)



* likeList
![Screenshot 2024-06-13 at 8.40.52 PM](https://hackmd.io/_uploads/rJYYtPuB0.png)
