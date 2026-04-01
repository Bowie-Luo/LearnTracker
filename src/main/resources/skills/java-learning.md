# LearnTracker Java 学习路线

> 基于 2025 后台组学习路线 + Java 语法知识文档

## 📚 学习阶段总览

| Stage | 内容 | 推荐时间 |
|-------|------|----------|
| Stage 0 | 前期准备 | 1天 |
| Stage 1 | Java 基础 | 30天 |
| Stage 2 | MySQL | 7天 |
| Stage 3 | Git | 2天 |
| Stage 4 | JavaWeb | 30天 |
| Stage 5 | 考核规范 | 持续 |

---

## Stage 1: Java 核心知识

### 🔥 必须掌握（考核必备）

#### 1.1 面向对象（Java核心思想）

```java
// 封装：私有属性 + public getter/setter
public class User {
    private String name;
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
}

// 继承：extends关键字
public class Student extends User {
    private String school;
}

// 多态：向上转型
User u = new Student(); // 父类引用指向子类对象
// instanceof判断
if (u instanceof Student) {
    Student s = (Student) u;
}
```

#### 1.2 抽象类与接口

```java
// 抽象类
abstract class Animal {
    abstract void eat(); // 抽象方法
}

// 接口（多继承）
interface Runnable {
    void run();
}
interface Flyable {
    void fly();
}
class Bird implements Runnable, Flyable {
    public void run() {}
    public void fly() {}
}
```

#### 1.3 集合框架（非常重要）

```java
// List - 有序可重复
List<String> list = new ArrayList<>();
list.add("a");
list.get(0);

// Set - 无序不可重复
Set<Integer> set = new HashSet<>();
set.add(1);

// Map - 键值对
Map<String, Integer> map = new HashMap<>();
map.put("a", 1);
map.get("a");

// 遍历
for (Map.Entry<String, Integer> entry : map.entrySet()) {
    System.out.println(entry.getKey() + ":" + entry.getValue());
}
```

#### 1.4 异常处理

```java
try {
    // 可能抛出异常的代码
} catch (IOException e) {
    // 处理IOException
    e.printStackTrace();
} catch (Exception e) {
    // 处理其他异常
} finally {
    // 无论是否异常都会执行
    resource.close();
}

// 自定义异常
class BusinessException extends RuntimeException {
    public BusinessException(String message) {
        super(message);
    }
}
```

#### 1.5 泛型

```java
// 泛型类
class Box<T> {
    private T value;
    public void set(T value) { this.value = value; }
    public T get() { return value; }
}

// 泛型方法
public static <T> T getFirst(List<T> list) {
    return list.get(0);
}
```

---

## Stage 2: 数据库（MySQL/PostgreSQL）

### 📋 核心知识点

| 主题 | 说明 |
|------|------|
| SQL基础 | SELECT/INSERT/UPDATE/DELETE |
| 约束 | 主键、外键、唯一、非空 |
| 索引 | 单列、复合、唯一索引 |
| 事务 | ACID、隔离级别 |
| 表设计 | 范式、三大范式 |

### 📝 SQL示例

```sql
-- 创建表
CREATE TABLE user (
    id BIGSERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 索引
CREATE INDEX idx_username ON user(username);

-- 事务
BEGIN;
INSERT INTO user (username) VALUES ('test');
COMMIT; -- 或 ROLLBACK;
```

### 🛠️ 练习建议

1. 设计学生管理系统数据库（学生表、班级表、课程表）
2. 练习关联查询（JOIN）
3. 练习聚合函数（COUNT、SUM、AVG）

---

## Stage 3: Git 版本控制

### 📋 常用命令

```bash
# 初始化
git init

# 克隆
git clone <url>

# 添加和提交
git add .
git commit -m "feat(service): add user login"

# 推送和拉取
git push origin main
git pull origin main

# 分支
git checkout -b feature/login
git merge feature/login

# 查看状态
git status
git log --oneline
```

### 📋 提交规范

```
type(scope): subject

feat(service): 新增用户登录功能
fix(dao): 修复SQL注入漏洞
docs(readme): 更新README
refactor(controller): 重构用户控制器
```

---

## Stage 4: JavaWeb（前后端分离）

### 📋 核心知识点

| 技术 | 说明 |
|------|------|
| HTTP协议 | 请求方法、状态码 |
| JSON | 数据格式 |
| Servlet | 处理请求 |
| Filter | 过滤器 |
| Cookie/Session | 会话管理 |

### 📝 RESTful API 设计

```java
// HTTP方法对应CRUD
// GET - 查询
// POST - 创建
// PUT - 更新
// DELETE - 删除

// 示例
@GetMapping("/users/{id}")
public User getUser(@PathVariable Long id) {}

@PostMapping("/users")
public Result<User> createUser(@RequestBody @Valid UserRequest req) {}

@PutMapping("/users/{id}")
public Result<Void> updateUser(@PathVariable Long id, @RequestBody UserRequest req) {}

@DeleteMapping("/users/{id}")
public Result<Void> deleteUser(@PathVariable Long id) {}
```

---

## Stage 5: 代码规范（考核加分项）

### 📋 命名规范

| 类型 | 规则 | 示例 |
|------|------|------|
| 类名 | 大驼峰 | `UserService`, `LoginController` |
| 方法/变量 | 小驼峰 | `getUserName`, `userList` |
| 常量 | 全大写下划线 | `MAX_COUNT`, `DEFAULT_PAGE_SIZE` |

### 📋 注释规范

```java
/**
 * 用户服务类
 * 负责用户注册、登录、权限管理
 * 
 * @author developer
 * @since 2026-03-29
 */
public class UserService {
    
    /**
     * 用户登录
     * 
     * @param username 用户名
     * @param password 密码（MD5加密）
     * @return 登录成功返回Token，失败返回null
     */
    public String login(String username, String password) {
        // TODO: 实现登录逻辑
    }
}
```

### 📋 分层架构

```
controller/     # 控制层，处理请求响应
service/       # 业务层，处理业务逻辑
mapper/        # 数据访问层，操作数据库
entity/        # 实体类，对应数据库表
dto/           # 数据传输对象
vo/            # 视图对象
util/          # 工具类
config/        # 配置类
```

---

## 📺 学习资源

### 视频教程

| 内容 | 地址 |
|------|------|
| Java基础+进阶 | https://www.bilibili.com/video/BV17F411T7Ao |
| JavaWeb | https://www.bilibili.com/video/BV1Qf4y1T7Hx |
| MySQL | https://www.bilibili.com/video/BV1Kr4y1i7ru |
| Git | https://www.bilibili.com/video/BV1MU4y1Y7h5 |

### 文档资料

| 内容 | 地址 |
|------|------|
| JavaGuide | https://javaguide.cn/ |
| 菜鸟教程 | https://www.runoob.com/java/java-tutorial.html |
| 廖雪峰Git教程 | https://www.liaoxuefeng.com/wiki/896043488029600 |

---

## 📚 推荐书籍

| 书名 | 说明 |
|------|------|
| 《Head First Java》 | 入门书籍 |
| 《阿里巴巴Java开发手册》 | **必看！考核加分** |
| 《Java核心技术卷1》 | 进阶参考 |
| 《MySQL必知必会》 | 数据库入门 |

---

## ⚠️ 注意事项

1. **不要学JSP** - 过时技术
2. **不要学Swing** - 过时技术
3. **不要CV** - 禁止抄袭，师兄一眼就能看出
4. **不要蒙混** - GPT写的代码有明显特征