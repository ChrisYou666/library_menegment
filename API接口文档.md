# 图书管理系统 - 后端API接口文档

## 接口概述

本文档详细描述了图书管理系统后端提供的所有REST API接口，包括请求方法、参数说明、响应格式等。

### 基础信息
- **服务地址**: http://localhost:9090
- **数据格式**: JSON
- **字符编码**: UTF-8
- **认证方式**: JWT Token（部分接口需要）

### 通用响应格式
```json
{
  "code": 200,
  "msg": "操作成功",
  "data": {}
}
```

## 1. 用户管理接口

### 1.1 用户注册
- **接口地址**: `POST /user/register`
- **请求参数**:
```json
{
  "username": "用户名",
  "password": "密码",
  "nickName": "昵称",
  "sex": "性别",
  "address": "地址",
  "phone": "电话"
}
```
- **响应示例**:
```json
{
  "code": 200,
  "msg": "注册成功",
  "data": null
}
```

### 1.2 用户登录
- **接口地址**: `POST /user/login`
- **请求参数**:
```json
{
  "username": "用户名",
  "password": "密码"
}
```
- **响应示例**:
```json
{
  "code": 200,
  "msg": "登录成功",
  "data": {
    "id": 1,
    "username": "admin",
    "nickName": "管理员",
    "role": 1,
    "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9..."
  }
}
```

### 1.3 分页查询用户
- **接口地址**: `GET /user`
- **请求参数**:
  - `pageNum`: 页码（默认1）
  - `pageSize`: 每页大小（默认10）
- **响应示例**:
```json
{
  "code": 200,
  "msg": "查询成功",
  "data": {
    "records": [
      {
        "id": 1,
        "username": "admin",
        "nickName": "管理员",
        "sex": "男",
        "address": "系统管理部",
        "phone": "13800138000",
        "role": 1,
        "status": 1,
        "createTime": "2024-01-01 10:00:00"
      }
    ],
    "total": 1,
    "size": 10,
    "current": 1,
    "pages": 1
  }
}
```

### 1.4 新增用户
- **接口地址**: `POST /user`
- **请求参数**: 同用户注册

### 1.5 更新用户信息
- **接口地址**: `PUT /user`
- **请求参数**:
```json
{
  "id": 1,
  "username": "用户名",
  "nickName": "昵称",
  "sex": "性别",
  "address": "地址",
  "phone": "电话",
  "role": 2,
  "status": 1
}
```

### 1.6 修改密码
- **接口地址**: `PUT /user/password`
- **请求参数**:
```json
{
  "username": "用户名",
  "password": "新密码"
}
```

### 1.7 删除用户
- **接口地址**: `DELETE /user/{id}`
- **路径参数**: `id` - 用户ID

### 1.8 批量删除用户
- **接口地址**: `POST /user/deleteBatch`
- **请求参数**:
```json
[1, 2, 3]
```

### 1.9 多条件搜索用户
- **接口地址**: `GET /user/usersearch`
- **请求参数**:
  - `pageNum`: 页码
  - `pageSize`: 每页大小
  - `username`: 用户名（可选）
  - `nickName`: 昵称（可选）
  - `address`: 地址（可选）
  - `phone`: 电话（可选）

## 2. 图书管理接口

### 2.1 分页查询图书
- **接口地址**: `GET /book`
- **请求参数**:
  - `pageNum`: 页码（默认1）
  - `pageSize`: 每页大小（默认10）
- **响应示例**:
```json
{
  "code": 200,
  "msg": "查询成功",
  "data": {
    "records": [
      {
        "id": 1,
        "bookNumber": "BK001",
        "isbn": "9787111234567",
        "nameCn": "Java编程思想",
        "nameId": "Thinking in Java",
        "language": "中文",
        "author": "Bruce Eckel",
        "translator": "陈昊鹏",
        "publisher": "机械工业出版社",
        "publishDate": "2020-01-01",
        "price": 89.00,
        "categoryId": 1,
        "location": "A-01-001",
        "totalQuantity": 5,
        "availableQuantity": 3,
        "borrowCount": 10,
        "status": 1,
        "description": "Java编程经典教材",
        "ratingAvg": 4.5,
        "createTime": "2024-01-01 10:00:00"
      }
    ],
    "total": 1,
    "size": 10,
    "current": 1,
    "pages": 1
  }
}
```

### 2.2 新增图书
- **接口地址**: `POST /book`
- **请求参数**:
```json
{
  "bookNumber": "图书编号",
  "isbn": "ISBN号",
  "nameCn": "中文书名",
  "nameId": "外语书名",
  "language": "语言",
  "author": "作者",
  "translator": "译者",
  "publisher": "出版社",
  "publishDate": "2024-01-01",
  "price": 89.00,
  "categoryId": 1,
  "location": "书架位置",
  "totalQuantity": 5,
  "availableQuantity": 5,
  "description": "图书简介"
}
```

### 2.3 更新图书信息
- **接口地址**: `PUT /book`
- **请求参数**: 包含id的完整图书信息

### 2.4 删除图书
- **接口地址**: `DELETE /book/{id}`
- **路径参数**: `id` - 图书ID

### 2.5 批量删除图书
- **接口地址**: `POST /book/deleteBatch`
- **请求参数**: `[1, 2, 3]`

### 2.6 根据图书编号查询
- **接口地址**: `GET /book/number/{bookNumber}`
- **路径参数**: `bookNumber` - 图书编号

### 2.7 多条件搜索图书
- **接口地址**: `GET /book/search`
- **请求参数**:
  - `pageNum`: 页码
  - `pageSize`: 每页大小
  - `keyword`: 关键词（可选）
  - `author`: 作者（可选）
  - `publisher`: 出版社（可选）
  - `language`: 语言（可选）
  - `categoryId`: 分类ID（可选）

### 2.8 按分类查询图书
- **接口地址**: `GET /book/category/{categoryId}`
- **路径参数**: `categoryId` - 分类ID
- **请求参数**:
  - `pageNum`: 页码
  - `pageSize`: 每页大小

### 2.9 按语言查询图书
- **接口地址**: `GET /book/language/{language}`
- **路径参数**: `language` - 语言
- **请求参数**:
  - `pageNum`: 页码
  - `pageSize`: 每页大小

### 2.10 获取热门图书
- **接口地址**: `GET /book/popular`
- **请求参数**:
  - `limit`: 返回数量（默认10）

### 2.11 获取高评分图书
- **接口地址**: `GET /book/highRated`
- **请求参数**:
  - `limit`: 返回数量（默认10）
  - `minRating`: 最低评分（默认4.0）

### 2.12 借阅图书
- **接口地址**: `POST /book/borrow/{id}`
- **路径参数**: `id` - 图书ID
- **请求参数**:
```json
{
  "userId": 1,
  "borrowDays": 30
}
```

### 2.13 归还图书
- **接口地址**: `POST /book/return/{id}`
- **路径参数**: `id` - 图书ID
- **请求参数**:
```json
{
  "userId": 1
}
```

### 2.14 获取所有语言列表
- **接口地址**: `GET /book/languages`

### 2.15 检查图书编号是否存在
- **接口地址**: `GET /book/checkNumber`
- **请求参数**:
  - `bookNumber`: 图书编号
  - `excludeId`: 排除的图书ID（可选）

### 2.16 批量更新图书状态
- **接口地址**: `POST /book/batchUpdateStatus`
- **请求参数**:
  - `bookIds`: 图书ID列表
  - `status`: 状态值

### 2.17 获取图书详情
- **接口地址**: `GET /book/detail/{id}`
- **路径参数**: `id` - 图书ID

### 2.18 更新图书平均评分
- **接口地址**: `PUT /book/updateRating/{id}`
- **路径参数**: `id` - 图书ID

## 3. 借阅管理接口

### 3.1 查询借阅记录
- **接口地址**: `GET /LendRecord`
- **请求参数**:
  - `pageNum`: 页码
  - `pageSize`: 每页大小

### 3.2 新增借阅记录
- **接口地址**: `POST /LendRecord`
- **请求参数**:
```json
{
  "readerId": 1,
  "bookId": 1,
  "bookName": "图书名称",
  "bookNumber": "图书编号",
  "lendTime": "2024-01-01 10:00:00",
  "dueTime": "2024-01-31 10:00:00",
  "borrowDays": 30,
  "operatorId": 1,
  "remark": "备注"
}
```

### 3.3 更新借阅记录
- **接口地址**: `PUT /LendRecord`
- **请求参数**: 包含id的完整借阅记录信息

### 3.4 归还图书
- **接口地址**: `PUT /LendRecord1`
- **请求参数**:
```json
{
  "id": 1,
  "returnTime": "2024-01-15 10:00:00",
  "operatorId": 1
}
```

### 3.5 删除借阅记录
- **接口地址**: `DELETE /LendRecord/{id}`
- **路径参数**: `id` - 借阅记录ID

## 4. 图书评论接口

### 4.1 添加评论
- **接口地址**: `POST /comment`
- **请求参数**:
```json
{
  "bookId": 1,
  "userId": 1,
  "byPerson": "评论人",
  "content": "评论内容",
  "rating": 5
}
```

### 4.2 更新评论
- **接口地址**: `PUT /comment`
- **请求参数**: 包含id的完整评论信息

### 4.3 删除评论
- **接口地址**: `DELETE /comment/{id}`
- **路径参数**: `id` - 评论ID

### 4.4 批量删除评论
- **接口地址**: `POST /comment/deleteBatch`
- **请求参数**: `[1, 2, 3]`

### 4.5 根据图书ID分页查询评论
- **接口地址**: `GET /comment/book/{bookId}`
- **路径参数**: `bookId` - 图书ID
- **请求参数**:
  - `pageNum`: 页码
  - `pageSize`: 每页大小

### 4.6 根据用户ID分页查询评论
- **接口地址**: `GET /comment/user/{userId}`
- **路径参数**: `userId` - 用户ID
- **请求参数**:
  - `pageNum`: 页码
  - `pageSize`: 每页大小

### 4.7 计算图书平均评分
- **接口地址**: `GET /comment/rating/{bookId}`
- **路径参数**: `bookId` - 图书ID

### 4.8 获取评论统计信息
- **接口地址**: `GET /comment/statistics/{bookId}`
- **路径参数**: `bookId` - 图书ID

### 4.9 检查用户是否已评论
- **接口地址**: `GET /comment/check`
- **请求参数**:
  - `bookId`: 图书ID
  - `userId`: 用户ID

### 4.10 获取最新评论
- **接口地址**: `GET /comment/latest`
- **请求参数**:
  - `limit`: 返回数量（默认10）

### 4.11 获取高分评论
- **接口地址**: `GET /comment/highRated`
- **请求参数**:
  - `limit`: 返回数量（默认10）
  - `minRating`: 最低评分（默认4）

## 5. 图书推荐接口

### 5.1 添加推荐
- **接口地址**: `POST /recommendation`
- **请求参数**:
```json
{
  "bookId": 1,
  "recommendMonth": "2024-01",
  "recommendReason": "推荐理由",
  "operatorId": 1
}
```

### 5.2 更新推荐
- **接口地址**: `PUT /recommendation`
- **请求参数**: 包含id的完整推荐信息

### 5.3 删除推荐
- **接口地址**: `DELETE /recommendation/{id}`
- **路径参数**: `id` - 推荐ID

### 5.4 批量删除推荐
- **接口地址**: `POST /recommendation/deleteBatch`
- **请求参数**: `[1, 2, 3]`

### 5.5 分页查询推荐图书
- **接口地址**: `GET /recommendation`
- **请求参数**:
  - `pageNum`: 页码
  - `pageSize`: 每页大小

### 5.6 根据推荐月份查询
- **接口地址**: `GET /recommendation/month/{month}`
- **路径参数**: `month` - 推荐月份（YYYY-MM格式）

### 5.7 获取当前有效推荐
- **接口地址**: `GET /recommendation/current`

### 5.8 根据图书ID查询推荐记录
- **接口地址**: `GET /recommendation/book/{bookId}`
- **路径参数**: `bookId` - 图书ID

### 5.9 检查指定月份是否已有推荐
- **接口地址**: `GET /recommendation/checkMonth`
- **请求参数**:
  - `month`: 推荐月份
  - `excludeId`: 排除的推荐ID（可选）

### 5.10 获取所有推荐月份列表
- **接口地址**: `GET /recommendation/months`

### 5.11 启用推荐
- **接口地址**: `POST /recommendation/activate/{id}`
- **路径参数**: `id` - 推荐ID

### 5.12 停用推荐
- **接口地址**: `POST /recommendation/deactivate/{id}`
- **路径参数**: `id` - 推荐ID

## 6. 图书分类接口

### 6.1 添加分类
- **接口地址**: `POST /category`
- **请求参数**:
```json
{
  "categoryName": "分类名称",
  "categoryCode": "分类编码",
  "description": "分类描述",
  "parentId": 1,
  "sortOrder": 1
}
```

### 6.2 更新分类
- **接口地址**: `PUT /category`
- **请求参数**: 包含id的完整分类信息

### 6.3 删除分类
- **接口地址**: `DELETE /category/{id}`
- **路径参数**: `id` - 分类ID

### 6.4 批量删除分类
- **接口地址**: `POST /category/deleteBatch`
- **请求参数**: `[1, 2, 3]`

### 6.5 获取所有启用的分类
- **接口地址**: `GET /category/enabled`

### 6.6 根据父分类ID查询子分类
- **接口地址**: `GET /category/parent/{parentId}`
- **路径参数**: `parentId` - 父分类ID

### 6.7 查询根分类（顶级分类）
- **接口地址**: `GET /category/root`

### 6.8 构建分类树
- **接口地址**: `GET /category/tree`
- **请求参数**:
  - `parentId`: 父分类ID（可选）

### 6.9 获取分类的完整路径
- **接口地址**: `GET /category/path/{categoryId}`
- **路径参数**: `categoryId` - 分类ID

### 6.10 查询分类下的图书数量
- **接口地址**: `GET /category/bookCount/{categoryId}`
- **路径参数**: `categoryId` - 分类ID

### 6.11 检查分类编码是否存在
- **接口地址**: `GET /category/checkCode`
- **请求参数**:
  - `categoryCode`: 分类编码
  - `excludeId`: 排除的分类ID（可选）

### 6.12 检查分类名称是否存在
- **接口地址**: `GET /category/checkName`
- **请求参数**:
  - `categoryName`: 分类名称
  - `parentId`: 父分类ID（可选）
  - `excludeId`: 排除的分类ID（可选）

### 6.13 移动分类到新的父分类下
- **接口地址**: `POST /category/move`
- **请求参数**:
  - `categoryId`: 分类ID
  - `newParentId`: 新父分类ID（可选）

### 6.14 调整分类排序
- **接口地址**: `POST /category/sort`
- **请求参数**:
  - `categoryId`: 分类ID
  - `newSortOrder`: 新排序序号

## 7. 系统统计接口

### 7.1 获取今日统计数据
- **接口地址**: `GET /stats/today`

### 7.2 获取最近N天的统计数据
- **接口地址**: `GET /stats/recent`
- **请求参数**:
  - `days`: 天数（默认7）

### 7.3 根据日期查询统计数据
- **接口地址**: `GET /stats/date`
- **请求参数**:
  - `date`: 日期（YYYY-MM-DD格式）

### 7.4 查询日期范围内的统计数据
- **接口地址**: `GET /stats/range`
- **请求参数**:
  - `startDate`: 开始日期
  - `endDate`: 结束日期

### 7.5 增加新用户数
- **接口地址**: `POST /stats/newUser`
- **请求参数**:
  - `count`: 增加数量（默认1）

### 7.6 增加新图书数
- **接口地址**: `POST /stats/newBook`
- **请求参数**:
  - `count`: 增加数量（默认1）

### 7.7 增加借阅数
- **接口地址**: `POST /stats/borrow`
- **请求参数**:
  - `count`: 增加数量（默认1）

### 7.8 增加归还数
- **接口地址**: `POST /stats/return`
- **请求参数**:
  - `count`: 增加数量（默认1）

### 7.9 增加访问数
- **接口地址**: `POST /stats/visit`
- **请求参数**:
  - `count`: 增加数量（默认1）

### 7.10 增加评论数
- **接口地址**: `POST /stats/comment`
- **请求参数**:
  - `count`: 增加数量（默认1）

### 7.11 获取统计汇总数据
- **接口地址**: `GET /stats/summary`
- **请求参数**:
  - `startDate`: 开始日期（可选）
  - `endDate`: 结束日期（可选）

### 7.12 初始化今日统计数据
- **接口地址**: `POST /stats/initToday`

### 7.13 更新统计数据
- **接口地址**: `PUT /stats`
- **请求参数**: 完整的统计数据对象

### 7.14 获取用户活跃度统计
- **接口地址**: `GET /stats/userActivity`
- **请求参数**:
  - `days`: 统计天数（默认30）

### 7.15 获取图书借阅统计
- **接口地址**: `GET /stats/bookBorrow`
- **请求参数**:
  - `days`: 统计天数（默认30）

### 7.16 获取系统访问统计
- **接口地址**: `GET /stats/systemAccess`
- **请求参数**:
  - `days`: 统计天数（默认30）

### 7.17 生成统计报表
- **接口地址**: `GET /stats/report`
- **请求参数**:
  - `startDate`: 开始日期
  - `endDate`: 结束日期
  - `reportType`: 报表类型（默认summary）

### 7.18 清理过期统计数据
- **接口地址**: `DELETE /stats/cleanup`
- **请求参数**:
  - `daysToKeep`: 保留天数（默认365）

### 7.19 批量导入统计数据
- **接口地址**: `POST /stats/batchImport`
- **请求参数**: 统计数据对象数组

## 8. 系统管理接口

### 8.1 获取系统统计数据
- **接口地址**: `GET /dashboard`
- **响应示例**:
```json
{
  "code": 200,
  "msg": "查询成功",
  "data": {
    "userCount": 100,
    "bookCount": 500,
    "lendCount": 200,
    "visitCount": 1000
  }
}
```

## 错误码说明

| 错误码 | 说明 |
|--------|------|
| 200 | 操作成功 |
| 400 | 请求参数错误 |
| 401 | 未授权访问 |
| 403 | 权限不足 |
| 404 | 资源不存在 |
| 500 | 服务器内部错误 |

## 注意事项

1. 所有需要认证的接口都需要在请求头中携带JWT Token：
   ```
   Authorization: Bearer {token}
   ```

2. 日期格式统一使用：`YYYY-MM-DD` 或 `YYYY-MM-DD HH:mm:ss`

3. 分页查询的页码从1开始

4. 所有删除操作都是软删除，不会真正删除数据

5. 批量操作接口的数组参数不能为空

6. 图书编号、ISBN号等关键字段需要保证唯一性

7. 评分范围为1-5星，支持小数

8. 推荐月份格式为YYYY-MM，如：2024-01

---

**文档版本**: v1.0  
**最后更新**: 2024-01-01  
**维护人员**: 开发团队