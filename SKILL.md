# LearnTracker 项目助手 - 完整版

> AI组一轮考核项目：基于Spring Boot的个人学习资源管理系统

---

## 📋 项目基本信息

**项目名称**：LearnTracker - 个人学习资源管理系统
**考核目标**：独立完成一个可运行、可维护、可扩展的 Java 后端项目
**难度**：⭐⭐⭐⭐（4/5）

---

## 🛠️ 技术栈

| 技术 | 用途 |
|------|------|
| Spring Boot 3.4 | 后端框架 |
| PostgreSQL | 关系型数据库 |
| Redis | 缓存数据库 |
| MyBatis-Plus | ORM框架 |
| JWT | 用户认证 |
| Swagger | API文档 |

---

## 🎯 功能清单

### P0 - 必须完成
- [ ] 用户注册/登录
- [ ] JWT Token认证
- [ ] 学习资源CRUD
- [ ] 标签管理
- [ ] 笔记功能

### P1 - 进阶功能
- [ ] Redis缓存
- [ ] 首页统计
- [ ] 优先级排序

---

## 📅 14天学习计划

### Day 1-2: 环境 + Java基础
- JDK 17、IDEA、项目创建 ✅ (已完成)
- Java核心语法：OOP、集合、异常、泛型

### Day 3-4: 数据库 + ORM
- PostgreSQL + MyBatis-Plus
- 数据库设计实战

### Day 5-8: 核心功能
- 用户模块 + JWT认证
- 学习资源模块
- 标签 + 笔记模块

### Day 9-14: 进阶功能
- Redis缓存
- AOP日志
- 查询优化

---

## 📁 项目文件结构

```
learn-tracker/
├── src/main/java/com/example/learntracker/
│   ├── LearnTrackerApplication.java    # 启动类
│   ├── aspect/                         # AOP切面
│   │   ├── OperationLog.java
│   │   └── OperationLogAspect.java
│   ├── common/                         # 公共类
│   │   └── Result.java                 # 统一返回结果
│   ├── config/                         # 配置类
│   │   └── AopConfig.java
│   ├── controller/                    # 控制器（接收请求）
│   │   └── HealthController.java
│   ├── dto/                           # 数据传输对象
│   ├── entity/                        # 实体类（数据库映射）
│   │   └── User.java
│   ├── mapper/                        # MyBatis映射接口
│   ├── service/                       # 业务逻辑层
│   ├── util/                          # 工具类
│   └── vo/                            # 视图对象
├── src/main/resources/                # 配置文件
│   └── application.yml
├── pom.xml                            # Maven依赖配置
└── SKILL.md                           # 项目学习指南
```

### 各层职责与文件地址

| 层级 | 目录 | 职责 | 示例文件 |
|------|------|------|----------|
| **Controller** | `controller/` | 接收HTTP请求，返回响应 | `HealthController.java` |
| **Service** | `service/` | 业务逻辑处理 | `UserService.java` |
| **Mapper** | `mapper/` | 数据库操作（MyBatis） | `UserMapper.java` |
| **Entity** | `entity/` | 数据库表映射对象 | `User.java` |
| **DTO** | `dto/` | 数据传输对象（请求/响应） | `LoginRequest.java` |
| **VO** | `vo/` | 视图对象（返回给前端） | `UserVO.java` |
| **Common** | `common/` | 公共组件（统一返回、异常） | `Result.java` |
| **Config** | `config/` | 配置类（Bean注入） | `AopConfig.java` |
| **Aspect** | `aspect/` | AOP切面（日志、事务） | `OperationLogAspect.java` |
| **Util** | `util/` | 工具类 | `JwtUtil.java` |

### 面向对象

```java
// 封装：私有属性 + public方法
public class User {
    private Long id;
    private String username;
    
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
}

// 继承
public class Student extends User {
    private String school;
}

// 接口
interface LoginService {
    String login(String username, String password);
}
```

### 集合框架

```java
// List - 有序可重复
List<String> list = new ArrayList<>();
list.add("item");

// Map - 键值对
Map<String, Object> map = new HashMap<>();
map.put("key", value);

// 遍历
for (String item : list) {
    System.out.println(item);
}
```

### 异常处理

```java
try {
    // 可能异常的代码
} catch (Exception e) {
    e.printStackTrace();
} finally {
    // 清理资源
}

// 自定义异常
class BusinessException extends RuntimeException {
    public BusinessException(String message) {
        super(message);
    }
}
```

---

## 🚀 快速启动

1. **启动数据库**
```bash
# PostgreSQL
pg_ctl -D /usr/local/pgsql/data start

# Redis
redis-server
```

2. **运行项目**
```bash
cd D:\openclaw-workspace\learn-tracker
mvn spring-boot:run
```

3. **访问接口**
- API: http://localhost:8080/api/health
- Swagger: http://localhost:8080/swagger-ui.html

---

## 📝 接口设计

| 方法 | 路径 | 说明 |
|------|------|------|
| POST | /api/auth/register | 用户注册 |
| POST | /api/auth/login | 用户登录 |
| GET | /api/users/me | 获取当前用户 |
| GET | /api/resources | 资源列表 |
| POST | /api/resources | 创建资源 |
| PUT | /api/resources/{id} | 更新资源 |
| DELETE | /api/resources/{id} | 删除资源 |

---

## ⚠️ 注意事项

1. **不要学JSP** - 过时技术
2. **不要CV** - 禁止抄袭
3. **代码规范** - 参考《阿里巴巴Java开发手册》