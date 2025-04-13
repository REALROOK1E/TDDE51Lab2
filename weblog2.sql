/*
 Navicat Premium Data Transfer

 Source Server         : weblog演示环境-阿里云
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : 116.62.199.48:3306
 Source Schema         : weblog

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 21/01/2025 13:22:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `title` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文章标题',
  `cover` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文章封面',
  `summary` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文章摘要',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `is_deleted` tinyint(2) NOT NULL DEFAULT 0 COMMENT '删除标志位：0：未删除 1：已删除',
  `read_num` int(11) UNSIGNED NOT NULL DEFAULT 1 COMMENT '被阅读次数',
  `weight` int(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文章权重，用于是否置顶（0: 未置顶；>0: 参与置顶，权重值越高越靠前）',
  `is_publish` tinyint(2) NOT NULL DEFAULT 1 COMMENT '是否发布：0：未发布 1：已发布',
  `type` tinyint(2) NOT NULL DEFAULT 1 COMMENT '文章类型 - 1：普通文章，2：收录于知识库',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES (17, 'Postman 汉化教程，手把手教你如何设置中文', 'http://116.62.199.48:9000/weblog/414af10e933b442aa5c88f603383ad15.jpg', 'Postman 汉化教程，手把手教你如何设置中文', '2023-11-23 11:47:23', '2023-12-02 19:41:51', 0, 4863, 0, 1, 2);
INSERT INTO `t_article` VALUES (18, 'Java 如何调用执行 Python 脚本？手把手讲解', 'http://116.62.199.48:9000/weblog/04c7312e0b4b41be996004517c247e2b.jpg', 'Java 如何调用执行 Python？图文讲解超详细！', '2023-11-23 11:50:28', '2024-09-07 18:49:59', 0, 6019, 0, 1, 2);
INSERT INTO `t_article` VALUES (19, '从零手撸：前后端分离博客（全栈开发，已更新39w+字）', 'http://116.62.199.48:9000/weblog/c89cc6b66f0341c0b7854771ae063eac.jpg', '已更新 244 节内容，共计 39w+ 字，演示截图：1661 张，2期目前已经完结...', '2023-11-23 11:56:09', '2024-12-05 16:21:39', 0, 95583, 7, 1, 2);
INSERT INTO `t_article` VALUES (29, 'Windows 系统如何安装 VSCode ？（图文教程）', 'http://116.62.199.48:9000/weblog/3c090332eed8429782fabd42148aadb4.png', 'Windows 系统如何安装 VSCode ？（图文教程）', '2024-01-22 17:00:45', '2024-01-22 23:26:17', 0, 4621, 0, 1, 2);
INSERT INTO `t_article` VALUES (30, '手摸手带您学会 Elasticsearch 单机、集群、插件安装(图文教程)', 'http://116.62.199.48:9000/weblog/c58c6db953d24922803a65ca4f79a0a9.png', '手摸手带您学会 Elasticsearch 单机、集群、插件安装(图文教程)', '2024-01-28 16:16:50', '2024-01-28 16:28:59', 0, 4794, 4, 1, 1);
INSERT INTO `t_article` VALUES (31, 'uni-app开发小程序01-环境搭建', 'https://img.quanxiaoha.com/quanxiaoha/88e5a200f01a431494eb79ff66b4f4e2.png', '', '2024-04-09 21:55:18', '2024-09-16 21:00:58', 0, 357, 0, 0, 1);
INSERT INTO `t_article` VALUES (32, '从零手撸：小哈书（仿小红书，微服务架构，已更新33w+字）', 'https://img.quanxiaoha.com/quanxiaoha/10a8f0a1b83048449ab8be0d9593eb58.jpg', '已更新 33w+ 字，演示截图：1469 张，持续爆肝中，目前核心服务快完结了...', '2024-07-06 12:48:12', '2024-12-05 16:22:39', 0, 21828, 6, 1, 1);

-- ----------------------------
-- Table structure for t_article_category_rel
-- ----------------------------
DROP TABLE IF EXISTS `t_article_category_rel`;
CREATE TABLE `t_article_category_rel`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `article_id` bigint(20) UNSIGNED NOT NULL COMMENT '文章id',
  `category_id` bigint(20) UNSIGNED NOT NULL COMMENT '分类id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_article_id`(`article_id`) USING BTREE,
  INDEX `idx_category_id`(`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章所属分类关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_article_category_rel
-- ----------------------------
INSERT INTO `t_article_category_rel` VALUES (55, 17, 20);
INSERT INTO `t_article_category_rel` VALUES (75, 29, 26);
INSERT INTO `t_article_category_rel` VALUES (79, 30, 21);
INSERT INTO `t_article_category_rel` VALUES (96, 18, 21);
INSERT INTO `t_article_category_rel` VALUES (107, 31, 26);
INSERT INTO `t_article_category_rel` VALUES (115, 19, 21);
INSERT INTO `t_article_category_rel` VALUES (116, 32, 23);

-- ----------------------------
-- Table structure for t_article_content
-- ----------------------------
DROP TABLE IF EXISTS `t_article_content`;
CREATE TABLE `t_article_content`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章内容id',
  `article_id` bigint(20) NOT NULL COMMENT '文章id',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '教程正文',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_article_id`(`article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章内容表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_article_content
-- ----------------------------
INSERT INTO `t_article_content` VALUES (17, 17, '大家好，我是小哈~\n\n前天有个小伙伴问我 Postman 如何进行中文汉化，说英文看着着实不习惯。其实，Postman 本身并不支持中文，那要怎么汉化呢？ \n\n这里分享一个 GitHub 上大佬分享的 Postman 汉化补丁包，亲测还是挺好用的，只需要复制到指定目录下进行解压，即可将 Postman 设置成中文，下面是我汉化成功的截图：\n\n![Postman 汉化成功截图](https://img.quanxiaoha.com/quanxiaoha/166910606063065 \"Postman 汉化成功截图\")\n\n## Postman 简介\n\nPostman 是一款非常流行的 API 调试工具，可以说是测试工程师、后端开发人员，基本上是人手必备。\n\n## 下载&安装 Postman\n\n> 注意：想要汉化 Postman， 就**必须导入汉化补丁包，且补丁包的版本号需与 Postman 版本号一致才行**，否则大概率无法汉化。所以，**需先确认汉化补丁包的版本号，再下载对应版本的 Postman 使用**。\n\n小哈写这篇文章的时候，补丁包的最新版本号为 `9.12.2`：\n\n![下载 Postman 汉化补丁包](https://img.quanxiaoha.com/quanxiaoha/166910669028983 \"下载 Postman 汉化补丁包\")\n\n汉化补丁下载链接：[https://github.com/hlmd/Postman-cn/releases](https://github.com/hlmd/Postman-cn/releases)\n\n确认了补丁包版本号后，再下载对应版本的 Postman :\n\n| Postman 历史版本下载 | 请把下面链接的\"版本号\"替换为指定的版本号, 然后浏览器中访问即可直接下载 |\n| -------------------- | ------------------------------------------------------------ |\n| Windows64位          | https://dl.pstmn.io/download/version/版本号/win64            |\n| Windows32位          | https://dl.pstmn.io/download/version/版本号/win32            |\n| Mac Intel Chip       | https://dl.pstmn.io/download/version/版本号/osx_64           |\n| Mac Apple Chip       | https://dl.pstmn.io/download/version/版本号/osx_arm64        |\n| Linux                | https://dl.pstmn.io/download/version/版本号/linux            |\n\n比如补丁版本号为  `9.12.2`, 如果想要下载 Windows 64 位的 Postman，则下载链接为   https://dl.pstmn.io/download/version/9.12.2/win64，浏览器访问该地址，则可直接下载：\n\n![](https://img.quanxiaoha.com/quanxiaoha/166910692124840)\n\n下载成功后，双击安装即可。\n\n## 开始汉化 Postman\n\n安装成功后，我们开始汉化 Postman:\n\n### Windows 系统\n\n1、下载好对应版本的汉化补丁包 `app.zip`;\n\n2、进入到 Postman 安装目录下的 `/resources` 文件夹中：\n\n> 桌面找到 Postman 应用程序右键 -> 打开文件所在位置，再进入 `app-*.*.*/resources` 目录下，\n> 默认安装地址：`C:/Users/用户名/AppData/Local/Postman`，\n> 示例：`C:/Users/用户名/AppData/Local/Postman/app-8.8.0/resources`\n\n![](https://img.quanxiaoha.com/quanxiaoha/166910727886597)\n\n3、**复制 `app.zip` 到 `resources` 目录**，将`app.zip`**解压到当前文件夹**会生成一个`app`目录，如上图所示；\n\n4、**重启 Postman** 即可看到已经汉化成功~\n\n### Mac 系统\n\n1、下载对应版本的  `app.zip`;\n\n2、**解压** `app.zip`；\n\n3、进入 `访达/应用程序/Postman.app/Contents/Resources/`:\n\n> 进入`访达/应用程序`找到`Postman.app`右键查看包内容，再进入`Contents/Resources`\n\n4、替换 `app` 文件夹\n\n> 如果目录下没有 `app` 文件夹，那么直接解压 `app.zip` 得到 `app` 文件夹即可\n> 将`app.zip`解压出来的`app`文件夹复制到`Resources`目录，替换原本的`app`文件夹\n> 可以先删除或重命名原本的`app`文件夹\n\n5、重启 Postman 就可以了~\n\n### Linux 系统\n\n1、下载对应版本的 `app.zip`:\n\n```\n# 下方为Github地址 将版本号替换为对应版本号，例如：8.8.0\nwget https://github.com/hlmd/Postman-cn/releases/download/版本号/app.zip\n```\n\n2、**解压&&替换`app`文件夹**：\n\n```\n# Postman安装地址 自行替换\nunzip -o -d Postman安装地址/app/resources app.zip\n```\n\n## 禁掉 Postman 自动更新\n\n由于汉化补丁包版本号需要与 Postman 版本号对应的关系，如果更新了 Postman 会导致汉化失效，那么，如何禁掉 Postman 自动更新呢？\n\n### Windows\n\nWindows 删除安装目录的 update.exe 即可。\n\n### Mac / Linux\n\n将此解析加入你电脑的主机文件 hosts ：\n\n```\n0.0.0.0         dl.pstmn.io\n```\n\n> 注意：这是一项危险操作，将会使你的电脑无法与 Postman 下载服务器连接，当然这就可以使你的 Postman 应用程序不再更新, 如果想更新请将此解析注释或移除。\n\n### hosts 文件在哪里？\n\nWindows：`C:/Windows/System32/drivers/etc/hosts`\n\nLinux & Mac：`/etc/hosts`');
INSERT INTO `t_article_content` VALUES (18, 18, '\n\n## 一、前言\n\n\n\n![Java 如何调用 Python？图文讲解超详细！](https://img.quanxiaoha.com/quanxiaoha/164878546294126 \"Java 如何调用 Python？图文讲解超详细！\")\n\n大家好，我是小哈~\n\n今天给大家分享一下如何在 Java 中执行 Python 脚本，这种需求，小哈在以前参与的定时任务调度平台就遇到过，需要定时去触发某个作业，作业需要支撑业务线丰富的场景，可以是接口调用、Shell 脚本执行、推送 MQ、Python 脚本执行等。\n\n除此以外，大家都知道 Python 拥有非常丰富的第三方类库，有些功能用 Python 来实现的话，可能仅仅需要引入一下包，几行代码就搞定了，用 Java 来实现可能就需要费老鼻子劲了。\n\n好了，废话也不多说，进入今天的正题 ！\n\n给大家安利一个优秀的第三方库 `Jython`, 通过它可以非常方便的执行 Python 脚本。\n\n## 二、Jython 官网地址\n\n官网地址：[https://www.jython.org/](https://www.jython.org/)\n\nGithub 地址： [https://github.com/jython/jython](https://github.com/jython/jython)\n\n## 三、上手试试\n\n小哈为了给大家演示，先新建一个 Spring Boot 项目。\n\n### 3.1 添加依赖\n\n在 maven 的 `pom.xml` 中添加 `Jython` 依赖:\n\n```\n<dependency>\n    <groupId>org.python</groupId>\n    <artifactId>jython-standalone</artifactId>\n    <version>2.7.2</version>\n</dependency>\n```\n\n### 3.2 测试执行 Python\n\n注意，需要在你的机器上先安装好 Python 环境。\n\n#### 3.2.1 在 Java 类中直接执行 Python 语句\n\n新建单元测试，通过 Java 代码直接执行 Python 语句：\n\n```java\n@Test\nvoid executePython() {\n    // 一条简单的 python 语句，打印 Hello world !\n    String py = \"print(\'Hello world!\')\";\n\n    PythonInterpreter interpreter = new PythonInterpreter();\n    // 执行 Python 语句\n    interpreter.exec(py);\n}\n```\n\n输出：\n\n![通过Jython执行一条简单的python语句](https://img.quanxiaoha.com/quanxiaoha/164877897378477 \"通过Jython执行一条简单的python语句\")\n\n#### 3.2.2 在 Java 中调用 Python 脚本文件\n\n大多数情况下，需要执行的是具体目录下的 Python 脚本，为了测试，我们在 `D` 盘的根目录下新建 `test.py`，将刚刚的 `Hello world` 代码以文件的形式来运行：\n\n![python输出hello world脚本](https://img.quanxiaoha.com/quanxiaoha/164878017527128 \"python输出hello world脚本\")\n\n通过 Jython 去执行这个脚本：\n\n```java\n@Test\nvoid executePythonFile() {\n    // 定义脚本路径\n    String path = \"D:\\\\test.py\";\n\n    PythonInterpreter interpreter = new PythonInterpreter();\n    // 执行脚本文件\n    interpreter.execfile(path);\n}\n```\n\n可以看到，执行 Python 脚本也是 ok 的：\n\n![在java中执行python脚本](https://img.quanxiaoha.com/quanxiaoha/164878028144585 \"在java中执行python脚本\")\n\n#### 3.2.3 另外一种方式： `Runtime.getRuntime()` 执行 python 脚本文件\n\n还是刚刚的测试脚本，还可以通过  `Runtime.getRuntime()` 来执行, 示例代码如下：\n\n```java\n@Test\nvoid executePythonFile2() {\n    Process proc;\n    BufferedReader reader;\n    try {\n        // 直接执行 python 命令的方式来执行脚本\n        proc = Runtime.getRuntime().exec(\"python D:\\\\test.py\");\n        reader = new BufferedReader(new InputStreamReader(proc.getInputStream()));\n\n        String line = null;\n        while ((line = reader.readLine()) != null) {\n            // 打印输出\n            System.out.println(line);\n        }\n\n        reader.close();\n        proc.waitFor();\n    } catch (Exception e) {\n        e.printStackTrace();\n    }\n}\n```\n\n输出结果同上。\n\n#### 3.2.4 调用 Python 脚本调用某个函数，并动态传入参数，打印结果\n\n实际的业务场景中，我们可能需要在调用脚本文件时动态传入参数，并打印结果。这里为了测试，小哈简单写了个发送邮件的 Python 脚本，定义了一个 `sendEmail` 函数，需要传入以下 3 个参数：\n\n- 邮件接受者： `receiver`\n- 邮件标题：`subject`\n- 邮件内容： `content`\n\n代码如下：\n\n```python\nimport smtplib\nfrom email.mime.text import MIMEText\n\n# 邮件服务器地址\nmail_host = \'smtp.qq.com\'\n# 邮件服务器用户名\nmail_user = \'xxx@qq.com\'\n# 邮件服务器登录密码(有些是授权码)\nmail_pwd = \'xxx\'\n# 邮件发送者\nsender = \'xxx@qq.com\'\n\ndef sendEmail(receiver, subject, content):\n    \"\"\"\n    发送邮件\n    :param receiver: 接收者\n    :param subject: 邮件主题\n    :param content: 邮件内容\n    :return:\n    \"\"\"\n    message = MIMEText(content, \'plain\', \'utf-8\')\n    # 邮件主题\n    message[\'Subject\'] = subject\n    # 发送方\n    message[\'From\'] = sender\n    # 接收方\n    message[\'To\'] = receiver\n\n    try:\n        # 连接到服务器\n        smtp = smtplib.SMTP_SSL(mail_host)\n        # 登录服务器\n        smtp.login(mail_user, mail_pwd)\n        # 发送\n        smtp.sendmail(sender, receiver, message.as_string())\n        # 推出\n        smtp.quit()\n        return \'send email success ...\'\n    except smtplib.SMTPException as e:\n        print(\'error\', e)\n\n\nif __name__ == \'__main__\':\n    # 邮件接受者\n    receiver = \'xxx@qq.com\'\n    # 邮件主题\n    subject = \'打个招呼\'\n    # 邮件内容\n    content = \'我是犬小哈\'\n    sendEmail(receiver, subject, content)\n```\n\n代码中使用的是 QQ 邮件，邮件服务器的用户名和授权码就不放出来了，有兴趣的小伙伴，可将其替换自己的试试。\n\n再来看看如何通过 Jython 去调用 `sendEmail` 函数：\n\n```java\n@Test\nvoid executePythonFunction() {\n    PythonInterpreter interpreter = new PythonInterpreter();\n    // 指定指定路径下的 python 脚本\n    interpreter.execfile(\"D:\\\\test.py\");\n\n    // 指定需要调用的函数\n    PyFunction function = interpreter.get(\"sendEmail\", PyFunction.class);\n    // ↓↓↓↓↓↓↓↓ 需要传入的参数 ↓↓↓↓↓↓↓↓\n    // 邮件接受者\n    PyString receiver = Py.newStringOrUnicode(\"xxx@qq.com\");\n    // 邮件主题\n    PyString subject = Py.newStringOrUnicode(\"打个招呼【动态参数】\");\n    // 邮件内容\n    PyString content = Py.newStringOrUnicode(\"我是犬小哈【动态参数】\");\n\n    // 调用\n    PyObject pyObject = function.__call__(receiver, subject, content);\n\n    // 打印返回结果\n    System.out.println(String.format(\"result: %s\", pyObject));\n}\n```\n\n执行一下，你会发现报错：\n\n![jython调用python脚本的函数](https://img.quanxiaoha.com/quanxiaoha/164878176638496 \"jython调用python脚本的函数\")\n\nPython 脚本在没有指定具体编码时，默认以 `ASCII ` 编码，这里因为文件中涉及到中文，需要指定编码格式为 `utf-8`, 在脚本文件头添加如下代码：\n\n```python\n# -*- coding: utf-8 -*-\n```\n\n![在python文件头部指定编码格式](https://img.quanxiaoha.com/quanxiaoha/164878218182374 \"在python文件头部指定编码格式\")\n\n> PS: 详细参考：https://peps.python.org/pep-0263/\n\n再次执行看看：\n\n![python发送邮件结果](https://img.quanxiaoha.com/quanxiaoha/164878246561742 \"python发送邮件结果\")\n\n成功打印了返回参数，确认一下是否真的收到邮件了：\n\n![邮件接受成功](https://img.quanxiaoha.com/quanxiaoha/164878255009256 \"邮件接受成功\")\n\n成功收到了邮件。\n\n细心的小伙伴应该发现了，在控制台打印中有个 `550` 错误，提示内容被拒绝了，但确实又收到了邮件，这是个啥情况，点进后面的连接看了一下 http://service.mail.qq.com/cgi-bin/help?subtype=1&&id=20022&&no=1000726：\n\n![提示垃圾邮件](https://img.quanxiaoha.com/quanxiaoha/164878272503991 \"提示垃圾邮件\")\n\n初步怀疑是自己做测试发送了过多的邮件导致，被 QQ 判定为垃圾营销邮件了，但是收还是能收到的，小伙伴们如果收不到也可以将发送者的邮箱地址设置为 QQ 邮件白名单。\n\n## 四、结语\n\n小伙伴们如果有需要在 Java 中执行 Python 脚本的，不妨试试 `Jython` 这个库，整体来说还是非常棒滴~ 这期分享就到这里了，下期见~\n\n## 五、Ref\n\n- https://www.cnblogs.com/wuwuyong/p/10600749.html\n\n- https://blog.csdn.net/qq_26591517/article/details/80441540');
INSERT INTO `t_article_content` VALUES (19, 19, '## 👋 自我介绍\n\n> 大家好，我是小哈。前某厂中台架构，公众号小哈学 Java 作者。91年生人，码龄 9 年，先后供职于支付、共享等互联网领域，主导负责过数据传输、日志平台、任务调度、文件平台等产品，以支撑各部门业务线。喜欢分享知识，热爱技术，也不止于技术，不只是写 Java，业余也爱玩前端、Python、Android 等，是个活跃的技术折腾者。\n\n本实战项目是星球内部第一个项目，2期已经更新完毕，演示地址：[http://116.62.199.48/](http://116.62.199.48/), 新项目[《仿小红书（基于 Spring Cloud Alibaba 微服务架构）》](https://www.quanxiaoha.com/column/10247.html \"《仿小红书（基于 Spring Cloud Alibaba 微服务架构）》\")正在拼命更新中，欢迎阅读...\n\n目前**已输出 72w+ 字，更新了 430 小节内容，演示图片：3134 张，还在持续爆肝中，目标是将 Java 程序员生涯中，比较典型的项目都教会大家，如前后端分离博客全栈级开发、秒杀系统、在线商城、IM 即时通讯（Netty）、权限管理（Spring Security）、Spring Cloud Alibaba 微服务等等... 目前有 2400+ 小伙伴已加入，一起学习打卡，一起进步！同频的人才能走的更快、更远 ！** 欢迎各位小伙伴加入哟~\n\n👉 [加入星球](https://t.zsxq.com/12h3hIayK \"加入星球\")，你将获得: <span class=\"font-bold\" style=\"color: #f97316\">专属的项目实战 / Java 学习路线 / 一对一提问 / 学习打卡 / 赠书活动</span>，与一群热爱学习的小伙伴一起，将走的更快、更远! **公众号：小哈学Java, 回复【星球】**，可领取<span class=\"font-bold\" style=\"color: #f97316\">专属优惠券</span>~\n\n---\n\n> 本项目 2 期版本已部署到了阿里云服务器上（功能继续迭代中...），可点击下面链接进行访问，查看实际效果：\n>\n> 演示地址：[http://116.62.199.48/](http://116.62.199.48/)\n>\n> 后台登录演示账号:\n> \n> - 账号：test\n> - 密码：test\n\n## 🏃 关于实战项目\n\n知识星球是个私密学习圈子，我会在星球内部，出一系列**从 0 到 1 的实战项目**，贴合真实的企业级项目开发规范，使用**主流的企业技术栈**，全程手写后端 + 前端完整代码，通过专栏的形式，把每个功能点的开发的步骤，手摸手，通过**丰富的图片 + 文字**，**保姆级教学**（PS: 同时按小节进度提供代码，不至于一上来代码量太多，不知道从哪入手）。\n\n\n![](https://img.quanxiaoha.com/quanxiaoha/169361945065538)\n\n目前，我已经给自己的网站：[犬小哈教程](www.quanxiaoha.com/column \"犬小哈教程\") 新开发了专栏模块，可以让小伙伴们只需跟着实战专栏，按照章节顺序教学来，上手敲，即可搞定每个功能点的开发，成体系地完成一个独立项目。*目前加入的小伙伴，都给出了超高评价，以下了截取了部分好评*：\n\n![](https://img.quanxiaoha.com/quanxiaoha/169733756405612)\n\n![](https://img.quanxiaoha.com/quanxiaoha/169733761293187)\n\n![](https://img.quanxiaoha.com/quanxiaoha/169733762195775)\n\n另外，在跟随小节内容上手的过程中，若遇到问题，可在星球内发起 *1v1 提问，小哈亲自解答*。\n\n![\"星球内提问\"](https://img.quanxiaoha.com/quanxiaoha/169396126861858 \"星球内提问\")\n\n星球说不清楚的，项目进度因为某一块搞不定的，微信发我源码，帮忙看问题出在哪：\n\n![搞不定的，微信发我源码，帮忙看问题出在哪](https://img.quanxiaoha.com/quanxiaoha/169406285385964 \"搞不定的，微信发我源码，帮忙看问题出在哪\")\n\n\n陪伴式写项目，到最终部署到云服务器上，能够通过域名来访问，完成项目上线。\n\n> 💡 TIP : 后期也会尝试分享一些适合程序员的技术副业，比如开发一些小工具网站，进行推广运营，有了一定用户量，能够挣点零花钱啥的。当然，这都是后话了，前提还需要你能够自行完整的开发一个独立应用，前期还是以项目实战为主。\n\n既然小哈是准备出一系列的实战项目，我希望这些项目的难度是循序渐进的，能够让你真实的感受到自己的功力在慢慢增强。但是又不想写那种纯纯的 CRUD 型管理后台项目，太枯燥。那么，第一个项目小哈就定位在难度不大，易上手，有趣，并且非常有代表性，实际工作中也能够被频繁用到的。\n\n脑瓜子一转，想到之前好多读者问我博客的事情，今年 4 月份的时候，又有读者微信问我: *你的博客有没有开源，感觉还挺好看，也想学习、部署一个。*\n\n![](https://img.quanxiaoha.com/quanxiaoha/169355366112215)\n\n于是乎，花了点时间整了第一个实战项目 —— **前后端分离的博客 Weblog**。\n\n\n## 💁 项目介绍\n\n每个技术人都应该有属于自己的博客！相比较直接使用第三方博客平台，自行搭建博客更有成就感；另外就是没有平台限制，比如你想发个二维码引流啥的，平台基本都是不允许的，还有，你可以自由 `div` 定制自己想要的博客 `css` 样式，哪天 UI 看不爽了，咱就自己换；最后，*面试的时候，如果简历贴上的是自己开发博客地址，也会很加分*！\n\n### 🔗 演示地址\n\n目前 1.0 版本已经部署到了阿里云服务器上，可点击下面链接进行访问，查看实际效果：\n\n[http://116.62.199.48/](http://116.62.199.48/ \"http://116.62.199.48/\")\n\n管理后台登录账号/密码:\n\n- 账号：test\n- 密码：test\n\n> ⚠️ 注意：该账号的角色为*游客*角色，*仅支持查询操作*，新增、修改、删除操作会提示不允许。\n\n### ⚒️ 功能模块\n\n> 💡 TIP : 以下*只是 1.0 版本的功能，后续小哈将添加更多功能进去, 比如图库管理、知识库、在线人数统计、SSR（服务端渲染） 等等*，能够想到的高逼格功能，咱都整上，附带超详细的实战图文笔记 ...\n\n![Weblog 功能模块一览](https://img.quanxiaoha.com/quanxiaoha/169560157482464 \"Weblog 功能模块一览\")\n\n### ✏️ 技术栈\n\n![Weblog 技术栈一览](https://img.quanxiaoha.com/quanxiaoha/169560181378937 \"Weblog 技术栈一览\")\n\n## 🎉 专栏目标\n\n学完本项目，你将具备如下能力：\n\n- 掌握独立开发全栈项目的能力（*后端 + 前端*）；\n- 掌握 Spring Boot 相关技术栈，以及构建后端项目能力，写出符合企业级的代码规范；\n- 掌握 Vue 3.x + Element Plus + Vite 4 技术构建前端工程的能力，并能够手动搭建 Admin 后台管理系统；\n- 掌握前端页面响应式设计（同时适配不同屏幕），排版布局，能够根据自己需求，`div` 自己想要的前端效果；\n- ...\n\n## 💡 专栏亮点\n\n- 在技术选型上，小哈选择了目前主流热门的技术栈，对标企业级项目开发；\n- 严格把控代码质量，数据库设计，写出令同事称道的代码；\n- 熟悉后端工程的搭建，如一些通用的基础设施：参数校验、全局异常捕获、`API` 统一出入参日志打印等等；\n- 能够独立完成整个网站的部署流程，从本地功能开发，功能测试，再到部署到云服务器上、域名选购、网站备案，最终公网可访问；\n- 对象存储 `Minio` 的使用, 能够独立搭建个人图床；\n- 从 0 到 1 ，通过 `Element Plus` 纯手搭 `Admin` 管理后台前端骨架；\n- 使用 Vue 3 `setup` 等语法糖新特性, 组合式 `API` 来开发；\n- 博客前台页面在设计上美观大气；\n- ...\n\n## 📖 专栏大纲\n\n整个实战专栏，小哈按功能点开发进度来做的目录，大致如下：\n\n> 💡 TIP : 如下目录不代表最终内容，只会更多，目前只是把已完成的部分详细的罗列了出来，其中大部分功能正在开发中，所属具体小节的标题也会陆续更新进来。\n\n- 一、[项目介绍](https://www.quanxiaoha.com/column/10000.html)\n- 二、开发环境搭建\n  - [2.1 【后端】环境安装&工具准备](https://www.quanxiaoha.com/column/10003.html)\n  - [2.2 【前端】开发环境&工具安装](https://www.quanxiaoha.com/column/10004.html)\n\n- 三、Spring Boot 后端工程搭建\n  - [3.1 搭建 Spring Boot 多模块工程（通过 Spring Initializr）](https://www.quanxiaoha.com/column/10005.html)\n  - [3.2【补充】搭建 Spring Boot 多模块工程（通过 Maven Archetype）](https://www.quanxiaoha.com/column/10161.html)\n  \n  - [3.3 Spring Boot 多环境配置](https://www.quanxiaoha.com/column/10006.html)\n  - [3.4 配置 Lombok](https://www.quanxiaoha.com/column/10007.html)\n  - [3.5 Spring Boot 整合 Lockback 日志](https://www.quanxiaoha.com/column/10008.html)\n  - [3.6 Spring Boot 自定义注解，实现 API 请求日志切面](https://www.quanxiaoha.com/column/10009.html)\n  - [3.7 Spring Boot 通过 MDC 实现日志跟踪](https://www.quanxiaoha.com/column/10010.html)\n  - [3.8 Spring Boot 实现优雅的参数校验](https://www.quanxiaoha.com/column/10011.html)\n  - [3.9 Spring Boot 自定义响应工具类](https://www.quanxiaoha.com/column/10012.html)\n  - [3.10 Spring Boot 实现全局异常管理](https://www.quanxiaoha.com/column/10013.html)\n  - [3.11 全局异常处理器+参数校验（最佳实践）](https://www.quanxiaoha.com/column/10014.html)\n  - [3.12 整合 Knife4j：提升接口调试效率](https://www.quanxiaoha.com/column/10015.html)\n  - [3.13 自定义 Jackson 序列化、反序列化，支持 Java 8 日期新特性](https://www.quanxiaoha.com/column/10016.html)\n  - [3.14 小结](https://www.quanxiaoha.com/column/10017.html)\n\n- 四、使用 Vue 3 + Vite 4 搭建前端工程\n  - [4.1 Vue 3 环境安装& Weblog 项目搭建](https://www.quanxiaoha.com/column/10018.html)\n  - [4.2 安装 VSCode 开发工具](https://www.quanxiaoha.com/column/10019.html)\n  - [4.3 添加 vue-router 路由管理器](https://www.quanxiaoha.com/column/10020.html)\n  - [4.4 Vite 配置路径别名：更方便的引用文件](https://www.quanxiaoha.com/column/10021.html)\n  - [4.5 整合 Tailwind CSS](https://www.quanxiaoha.com/column/10022.html)\n  - [4.6 整合 Tailwind CSS 组件库：Flowbite](https://www.quanxiaoha.com/column/10023.html)\n  - [4.7 整合饿了么 Element Plus 组件库](https://www.quanxiaoha.com/column/10024.html)\n\n- 五、登录模块开发\n  - [5.1 登录页设计：支持响应式布局](https://www.quanxiaoha.com/column/10025.html)\n  - [5.2 登录页加点盐：通过 Animate.css 添加动画](https://www.quanxiaoha.com/column/10026.html)\n  - [5.3 整合 Mybatis Plus](https://www.quanxiaoha.com/column/10027.html)\n  - [5.4 p6spy 组件打印完整的 SQL 语句、执行耗时](https://www.quanxiaoha.com/column/10028.html)\n  - [5.5 整合 Spring Security](https://www.quanxiaoha.com/column/10029.html)\n  - [5.6 Spring Security 整合 JWT ：实现身份认证](https://www.quanxiaoha.com/column/10030.html)\n  - [5.7 Spring Security 整合 JWT ：实现接口鉴权](https://www.quanxiaoha.com/column/10031.html)\n  - [5.8 Vue 整合 Axios 实现登录功能（解决跨域问题）](https://www.quanxiaoha.com/column/10032.html)\n  - [5.9 登录页表单验证](https://www.quanxiaoha.com/column/10033.html)\n  - [5.10 登录消息提示、回车键监听、按钮加载 Loading](https://www.quanxiaoha.com/column/10034.html)\n  - [5.11 存储 Token 到 Cookie 中](https://www.quanxiaoha.com/column/10035.html)\n  - [5.12 Axios 添加请求拦截器、响应拦截器](https://www.quanxiaoha.com/column/10036.html)\n  - [5.13 全局路由拦截：实现页面标题动态设置、后台路由跳转的登录判断](https://www.quanxiaoha.com/column/10037.html)\n  - [5.14 实现页面顶部加载 Loading 效果](https://www.quanxiaoha.com/column/10038.html)\n  - [5.15 重复登录问题优化、密码框可显示密码](https://www.quanxiaoha.com/column/10040.html)\n  - [5.16 角色鉴权：添加演示账号，仅支持查询操作](https://www.quanxiaoha.com/column/10089.html)\n  \n  \n  \n\n- 六、Element Plus 手搭 Admin 管理后台骨架\n  - [6.1 搭建管理后台基本布局](https://www.quanxiaoha.com/column/10039.html)\n  - [6.2 后台公共 Header 头：样式布局](https://www.quanxiaoha.com/column/10041.html)\n  - [6.3 后台公共左侧 Menu 菜单栏：样式布局](https://www.quanxiaoha.com/column/10042.html)\n  - [6.4 整合全局状态管理库 Pinia](https://www.quanxiaoha.com/column/10043.html)\n  - [6.5 左边菜单栏点击收缩、展开功能实现](https://www.quanxiaoha.com/column/10044.html)\n  - [6.6 支持全屏展示、页面点击刷新](https://www.quanxiaoha.com/column/10045.html)\n  - [6.7 标签导航栏组件实现：样式布局](https://www.quanxiaoha.com/column/10046.html)\n  - [6.8 标签导航栏组件实现：路由同步 (1)](https://www.quanxiaoha.com/column/10047.html)\n  - [6.9 标签导航栏组件实现：路由同步 (2)](https://www.quanxiaoha.com/column/10048.html)\n  - [6.10 标签导航栏组件实现：标签页关闭](https://www.quanxiaoha.com/column/10049.html)\n  - [6.11 标签导航栏组件实现：关闭其他、全部标签页](https://www.quanxiaoha.com/column/10050.html)\n  - [6.12 后台公共 Footer 页脚：样式布局](https://www.quanxiaoha.com/column/10051.html)\n  - [6.13 使用 KeepAlive 缓存组件，提高页面切换性能和响应速度](https://www.quanxiaoha.com/column/10052.html)\n  - [6.14 使用 Transition 组件添加全局过渡动画](https://www.quanxiaoha.com/column/10053.html)\n  - [6.15 修改用户密码接口开发](https://www.quanxiaoha.com/column/10054.html)\n  - [6.16 获取当前登录用户信息接口开发](https://www.quanxiaoha.com/column/10055.html)\n  - [6.17 Pinia 存储用户信息，动态显示登录用户名](https://www.quanxiaoha.com/column/10056.html)\n  - [6.18 使用 pinia-persist 插件实现 Pinia 数据持久化](https://www.quanxiaoha.com/column/10057.html)\n  - [6.19 用户修改密码、退出登录功能开发](https://www.quanxiaoha.com/column/10058.html)\n  - [6.20 小结](https://www.quanxiaoha.com/column/10059.html)\n\n  \n\n  \n- 七、管理后台：文章分类模块开发\n  - [7.1 分类模块接口分析](https://www.quanxiaoha.com/column/10060.html)\n  - [7.2 文章分类：新增接口开发](https://www.quanxiaoha.com/column/10061.html)\n  - [7.3 文章分类：分页接口开发](https://www.quanxiaoha.com/column/10062.html)\n  - [7.4 文章分类：删除接口开发](https://www.quanxiaoha.com/column/10063.html)\n  - [7.5 文章发布：分类 Select 下拉列表接口开发](https://www.quanxiaoha.com/column/10064.html)\n  - [7.6 后台分类管理页面：样式布局](https://www.quanxiaoha.com/column/10065.html)\n  - [7.7 Config Provider 全局配置: 实现组件中文化](https://www.quanxiaoha.com/column/10066.html)\n  - [7.8 文章分类：分页列表数据动态渲染](https://www.quanxiaoha.com/column/10067.html)\n  - [7.9 文章分类：新增功能开发](https://www.quanxiaoha.com/column/10068.html)\n  - [7.10 文章分类：删除功能开发](https://www.quanxiaoha.com/column/10069.html)\n  - [7.11 通用表单对话框组件封装](https://www.quanxiaoha.com/column/10070.html)\n  - [7.12 添加 Table 组件加载 Loading 、表单对话框提交按钮 Loading 动画](https://www.quanxiaoha.com/column/10071.html)\n  \n\n\n- 八、管理后台：标签模块开发\n  - [8.1 标签模块接口分析【视频讲解】](https://www.quanxiaoha.com/column/10072.html)\n  - [8.2 标签管理：新增标签接口开发【视频讲解】](https://www.quanxiaoha.com/column/10073.html)\n  - [8.3 标签管理：标签分页接口开发【视频讲解】](https://www.quanxiaoha.com/column/10074.html)\n  - [8.4 标签管理：删除标签接口开发【视频讲解】](https://www.quanxiaoha.com/column/10075.html)\n  - [8.5 标签关键词模糊查询 select 列表接口开发【视频讲解】](https://www.quanxiaoha.com/column/10076.html)\n  - [8.6 标签管理页面开发：分页列表【视频讲解】](https://www.quanxiaoha.com/column/10077.html)\n  - [8.7 标签管理页面开发：新增&删除标签功能【视频讲解】](https://www.quanxiaoha.com/column/10078.html)\n  \n  \n  \n- 九、管理后台：博客设置模块开发\n  - [9.1 博客设置模块功能分析、表设计](https://www.quanxiaoha.com/column/10079.html)\n  - [9.2 Docker 本地安装 Minio 对象存储](https://www.quanxiaoha.com/column/10080.html)\n  - [9.3 文件上传接口开发](https://www.quanxiaoha.com/column/10081.html)\n  - [9.4 博客设置: 更新接口开发](https://www.quanxiaoha.com/column/10082.html)\n  - [9.5 整合 Mapstruct : 简化属性映射](https://www.quanxiaoha.com/column/10083.html)\n  - [9.6 博客设置：获取详情接口开发](https://www.quanxiaoha.com/column/10084.html)\n  - [9.7 博客设置页面：样式布局](https://www.quanxiaoha.com/column/10085.html)\n  - [9.8 管理后台：滚动样式优化](https://www.quanxiaoha.com/column/10086.html)\n  - [9.9 博客设置页：数据渲染、图片上传](https://www.quanxiaoha.com/column/10087.html)\n  - [9.10 博客设置页：更新设置](https://www.quanxiaoha.com/column/10088.html)\n  \n\n\n\n- 十、管理后台：文章模块开发\n  - [10.1 文章管理模块功能分析、表设计](https://www.quanxiaoha.com/column/10090.html)\n  - [10.2 文章管理：文章发布接口开发（1）](https://www.quanxiaoha.com/column/10091.html)\n  - [10.3 文章管理：文章发布接口开发（2）—— SQL 注入器实现批量插入](https://www.quanxiaoha.com/column/10092.html)\n  - [10.4 文章管理：文章删除接口开发](https://www.quanxiaoha.com/column/10093.html)\n  - [10.5 文章管理：分页接口开发](https://www.quanxiaoha.com/column/10094.html)\n  - [10.6 文章管理：获取文章详情接口开发](https://www.quanxiaoha.com/column/10095.html)\n  - [10.7 文章管理：文章更新接口开发](https://www.quanxiaoha.com/column/10096.html)\n  - [10.8 文章管理：分页列表开发](https://www.quanxiaoha.com/column/10097.html)\n  - [10.9 文章管理页：删除文章开发](https://www.quanxiaoha.com/column/10098.html)\n  - [10.10 文章管理页：写文章对话框样式布局](https://www.quanxiaoha.com/column/10099.html)\n  - [10.11 文章管理页：文章发布功能开发](https://www.quanxiaoha.com/column/10100.html)\n  - [10.12 文章管理：获取所有标签 Select 列表接口开发](https://www.quanxiaoha.com/column/10101.html)\n  - [10.13 文章管理页：文章编辑功能开发](https://www.quanxiaoha.com/column/10102.html)\n  - [10.14 Bug 修复：分类、标签删除接口添加是否关联文章校验; 前端 token 过期问题 fixed](https://www.quanxiaoha.com/column/10103.html)\n  \n  \n  \n  \n  \n\n- 十一、博客前台：首页开发\n   - [11.1 前台首页、归档页接口分析](https://www.quanxiaoha.com/column/10104.html)\n   - [11.2 前台首页：文章分页接口开发](https://www.quanxiaoha.com/column/10105.html)\n   - [11.3 公共侧边栏：获取分类、标签列表接口开发](https://www.quanxiaoha.com/column/10106.html)\n   - [11.4 公共部分：获取博客设置信息接口开发](https://www.quanxiaoha.com/column/10107.html)\n   - [11.5 前台 Header 头组件封装](https://www.quanxiaoha.com/column/10108.html)   \n   - [11.6 首页样式布局设计（1）](https://www.quanxiaoha.com/column/10109.html)\n   - [11.7 首页样式布局设计（2） —— 侧边栏博主信息卡片](https://www.quanxiaoha.com/column/10110.html)\n   - [11.8 首页样式布局设计（3） —— 侧边栏分类、标签卡片](https://www.quanxiaoha.com/column/10111.html)\n   - [11.9 首页样式布局设计（4） —— Footer 组件封装](https://www.quanxiaoha.com/column/10112.html)\n   - [11.10 首页文章分页数据渲染](https://www.quanxiaoha.com/column/10113.html)\n   - [11.11 公共右边栏：博主信息卡片组件封装](https://www.quanxiaoha.com/column/10114.html)\n   - [11.12 公共右边栏：分类、标签卡片组件封装](https://www.quanxiaoha.com/column/10115.html)\n   - [11.13 公共 Header 头：跳转后台、退出登录功能开发](https://www.quanxiaoha.com/column/10116.html)\n   \n   \n\n- 十二、博客前台：归档列表页、分类列表页、标签列表页开发\n   - [12.1 归档页、分类列表页接口分析](https://www.quanxiaoha.com/column/10117.html)\n   - [12.2 文章归档分页接口开发](https://www.quanxiaoha.com/column/10118.html)\n   - [12.3 前台归档页：样式布局设计](https://www.quanxiaoha.com/column/10119.html)\n   - [12.4 前台归档页：分页列表功能开发](https://www.quanxiaoha.com/column/10120.html)\n   - [12.5 前台分类页开发](https://www.quanxiaoha.com/column/10121.html)\n   - [12.6 获取某个分类下的文章列表——分页接口开发](https://www.quanxiaoha.com/column/10122.html)\n   - [12.7 前台分类-文章列表页: 样式布局开发](https://www.quanxiaoha.com/column/10123.html)\n   - [12.8 分类-文章列表页开发](https://www.quanxiaoha.com/column/10124.html)\n   - [12.9 前台标签列表页：样式布局&功能开发](https://www.quanxiaoha.com/column/10125.html)\n   - [12.10 获取某个标签下的文章列表——分页接口开发](https://www.quanxiaoha.com/column/10130.html)\n   - [12.11 标签-文章列表页开发](https://www.quanxiaoha.com/column/10131.html)\n\n\n- 十三、博客前台：文章详情页开发\n   - [13.1 文章详情页接口分析](https://www.quanxiaoha.com/column/10126.html)\n   - [13.2 后端封装 Markdown 转换 HTML 工具类](https://www.quanxiaoha.com/column/10127.html)\n   - [13.3 获取文章详情接口开发](https://www.quanxiaoha.com/column/10128.html)\n   - [13.4 文章详情页：样式布局设计](https://www.quanxiaoha.com/column/10129.html)\n   - [13.5 文章详情页数据渲染](https://www.quanxiaoha.com/column/10132.html)\n   - [13.6 文章正文 CSS 样式美化](https://www.quanxiaoha.com/column/10133.html)\n   - [13.7 highlight.js 实现代码块高亮，v-viewer 实现图片点击放大预览](https://www.quanxiaoha.com/column/10134.html)\n   - [13.8 404 页面开发](https://www.quanxiaoha.com/column/10135.html)\n   - [13.9 返回顶部 Button 组件封装](https://www.quanxiaoha.com/column/10136.html)\n   - [13.10 文章目录 Toc 组件封装](https://www.quanxiaoha.com/column/10137.html)\n   - [13.11 自定义线程池 + Spring 事件发布订阅：实现文章阅读量+1功能](https://www.quanxiaoha.com/column/10138.html)\n   - [13.12 后端管理功能补充：文章预览跳转、前台首页跳转](https://www.quanxiaoha.com/column/10139.html)\n   \n   \n   \n   \n- 十四、管理后台：仪表盘模块开发\n   - [14.1 后台仪表盘接口分析、表设计](https://www.quanxiaoha.com/column/10140.html)\n   - [14.2 仪表盘：获取文章、分类、标签、总浏览量接口开发](https://www.quanxiaoha.com/column/10141.html)\n   - [14.3 仪表盘：获取文章发布热点接口开发](https://www.quanxiaoha.com/column/10142.html)\n   - [14.4 @Scheduled 定时任务 + 事件发布订阅：实现当日 PV 访问量累加](https://www.quanxiaoha.com/column/10143.html)\n   - [14.5 仪表盘：获取最近一周文章 PV 访问量接口开发](https://www.quanxiaoha.com/column/10144.html)\n   - [14.6 仪表盘：静态页面开发](https://www.quanxiaoha.com/column/10145.html)\n   - [14.7 仪表盘：文章数、分类数、标签数、总浏览量数据动态渲染](https://www.quanxiaoha.com/column/10146.html)\n   - [14.8 仪表盘：数字滚动动画组件封装](https://www.quanxiaoha.com/column/10147.html)\n   - [14.9 仪表盘：Echarts 实现近半年文章发布热点图](https://www.quanxiaoha.com/column/10148.html)\n   - [14.10 仪表盘：Echarts 实现近一周文章 PV 访问量折线图](https://www.quanxiaoha.com/column/10149.html)\n\n\n   \n- 十五、项目部署上线\n  - [15.1 云服务器选购及 FinalShell 工具远程登录](https://www.quanxiaoha.com/column/10150.html)\n  - [15.2 Linux 安装 JDK 1.8](https://www.quanxiaoha.com/column/10151.html)\n  - [15.3 Linux 安装 Docker 环境](https://www.quanxiaoha.com/column/10152.html)\n  - [15.4 云服务器 Docker 安装 MySQL](https://www.quanxiaoha.com/column/10153.html)\n  - [15.5 云服务器 Docker 安装 Minio](https://www.quanxiaoha.com/column/10154.html)\n  - [15.6 Spring Boot 配置 prod 生产环境参数，初始化数据库表，Shell 运行脚本编写](https://www.quanxiaoha.com/column/10155.html)\n  - [15.7 云服务器 Docker 安装 Nginx, 并配置反向代理](https://www.quanxiaoha.com/column/10156.html)\n  - [15.8 前端工程打包部署至 Nginx](https://www.quanxiaoha.com/column/10157.html)\n  - [15.9 域名选购 & 网站备案 & 配置域名解析](https://www.quanxiaoha.com/column/10158.html)\n  - [15.10 Docker Nginx 配置 SSL 证书，实现网站支持 Https 访问](https://www.quanxiaoha.com/column/10159.html)\n  - [15.11 图床（Minio）添加子域名访问，并配置 Nginx SSL 证书以及反向代理](https://www.quanxiaoha.com/column/10160.html)\n  \n- 十六、访问速度优化\n  - [16.1 性能调优：Nginx 开启 Gzip 压缩、预压缩、可视化打包分析、引入 CDN](https://www.quanxiaoha.com/column/10162.html)\n  \n## 🎯 2.0 版本专栏目录（正在更新中...）\n\n- 一、博客前台：站内中文分词检索\n  - [1.1 博主信息卡片：获取文章、分类、标签、总访问量接口开发](https://www.quanxiaoha.com/column/10163.html)\n  - [1.2 博主信息卡片：文章、分类、标签、总访问量展示以及 UI 优化](https://www.quanxiaoha.com/column/10164.html)\n  - [1.3 CountTo 数字滚动动画组件重构](https://www.quanxiaoha.com/column/10165.html)\n  - [1.4 整合全文检索引擎 Lucene: 添加站内搜索子模块](https://www.quanxiaoha.com/column/10166.html)\n  - [1.5 添加 CommandLineRunner 项目启动任务：初始化 Lucene 文章索引](https://www.quanxiaoha.com/column/10167.html)\n  - [1.6 中文分词检索接口开发（1）—— 封装 Lucene 工具类方法](https://www.quanxiaoha.com/column/10168.html)\n  - [1.7 中文分词检索接口开发（2）—— 关键词高亮](https://www.quanxiaoha.com/column/10169.html)\n  - [1.8 站内搜索：弹出框样式布局开发](https://www.quanxiaoha.com/column/10170.html)\n  - [1.9 站内搜索：动态渲染搜索结果，添加加载 Loading](https://www.quanxiaoha.com/column/10171.html)\n  - [1.10 Spring 事件发布订阅保证数据一致性：实现 Lucene 文档新增、修改、删除](https://www.quanxiaoha.com/column/10172.html)\n  - [1.11 移动端适配：搜索框](https://www.quanxiaoha.com/column/10173.html)\n  \n  \n- 二、博客前台：白天黑夜主题切换 & 代码复制功能开发\n  - [2.1 文章详情页：标题、标签、Meta 信息 UI 改造](https://www.quanxiaoha.com/column/10174.html)\n  - [2.2 文章详情接口：正则表达式统计 Markdown 正文字数、阅读时长](https://www.quanxiaoha.com/column/10175.html)\n  - [2.3 细节完善：Router 页面跳转：实现滚动到顶部 & 小屏幕仪表盘 Echart 渲染不全问题](https://www.quanxiaoha.com/column/10176.html)\n  - [2.4 自定义 Markdown 解析：实现对超链接添加跳转 svg 图标](https://www.quanxiaoha.com/column/10177.html)\n  - [2.5 博文详情页：nextTick() 方法实现代码块复制功能](https://www.quanxiaoha.com/column/10178.html)\n  - [2.6 前台主题色统一 & Header 头菜单选中样式美化](https://www.quanxiaoha.com/column/10179.html)\n  - [2.7 首页 UI 交互优化](https://www.quanxiaoha.com/column/10180.html)\n  - [2.8 白天黑夜主题切换：登录页](https://www.quanxiaoha.com/column/10181.html)\n  - [2.9 白天黑夜主题切换：前台首页](https://www.quanxiaoha.com/column/10182.html)\n  - [2.10 白天黑夜主题切换：文章详情页](https://www.quanxiaoha.com/column/10183.html)\n  - [2.11 后端：各分类下文章总数统计](https://www.quanxiaoha.com/column/10184.html)\n  - [2.12 前端：分类页 UI 美化](https://www.quanxiaoha.com/column/10185.html)\n  - [2.13 后端：各标签下文章总数统计](https://www.quanxiaoha.com/column/10186.html)\n  - [2.14 前端：标签页 UI 美化](https://www.quanxiaoha.com/column/10187.html)\n  - [2.15 前台右边栏：分类列表、标签列表卡片组件 UI 美化](https://www.quanxiaoha.com/column/10188.html)\n  \n- 三、CI / CD 持续集成与部署\n  - [3.1 Git 安装与 Gitee 代码仓库创建](https://www.quanxiaoha.com/column/10189.html)\n  - [3.2 Docker 安装 Jenkins](https://www.quanxiaoha.com/column/10190.html)\n  - [3.3 Jenkins 配置后端工程，自动拉取代码、打包与重新部署](https://www.quanxiaoha.com/column/10191.html)\n  - [3.4 Jenkins 配置前端工程，自动拉取代码、打包与上传云服务器](https://www.quanxiaoha.com/column/10192.html)\n  - [3.5 Dockerfile 构建 Spring Boot 镜像并运行服务](https://www.quanxiaoha.com/column/10193.html)\n  - [3.6 Jenkins 配置后端：自动构建 Docker 镜像、运行容器服务](https://www.quanxiaoha.com/column/10194.html)\n  - [3.7 文章置顶：表设计、更新接口开发](https://www.quanxiaoha.com/column/10195.html)\n  - [3.8 文章置顶：前后台查询接口添加 isTop 返参字段](https://www.quanxiaoha.com/column/10196.html)\n  - [3.9 文章置顶：前端页面修改](https://www.quanxiaoha.com/column/10197.html)\n\n- 四、管理后台：知识库开发\n  - [4.1 知识库接口分析、表设计](https://www.quanxiaoha.com/column/10198.html)\n  - [4.2 知识库：新增接口开发](https://www.quanxiaoha.com/column/10199.html)\n  - [4.3 知识库：删除接口开发](https://www.quanxiaoha.com/column/10200.html)\n  - [4.4 知识库：分页查询接口开发](https://www.quanxiaoha.com/column/10201.html)\n  - [4.5 知识库：更新置顶状态、更新发布状态接口开发](https://www.quanxiaoha.com/column/10202.html)\n  - [4.6 知识库：更新接口开发](https://www.quanxiaoha.com/column/10203.html)\n  - [4.7 知识库：查询知识库目录接口开发](https://www.quanxiaoha.com/column/10204.html)\n  - [4.8 知识库：更新目录接口开发](https://www.quanxiaoha.com/column/10205.html)\n  - [4.9 管理后台：知识库列表页开发](https://www.quanxiaoha.com/column/10206.html)\n  - [4.10 管理后台：新增知识库功能开发](https://www.quanxiaoha.com/column/10207.html)\n  - [4.11 管理后台：知识库置顶、更新发布状态、删除功能开发](https://www.quanxiaoha.com/column/10208.html)\n  - [4.12 管理后台：知识库编辑功能开发](https://www.quanxiaoha.com/column/10209.html)\n  - [4.13 管理后台：知识库目录编辑功能开发（1）](https://www.quanxiaoha.com/column/10210.html)\n  - [4.14 管理后台：知识库目录编辑功能开发（2）](https://www.quanxiaoha.com/column/10211.html)\n  - [4.15 管理后台：知识库目录编辑功能开发（3）—— 通过 VueDraggablePlus 实现二级目录拖拽排序](https://www.quanxiaoha.com/column/10212.html)\n  - [4.16 管理后台：知识库目录编辑功能开发（4）—— 添加目录](https://www.quanxiaoha.com/column/10213.html)\n  - [4.17 管理后台：知识库目录编辑功能开发（5）—— 添加文章](https://www.quanxiaoha.com/column/10214.html)\n  \n- 五、博客前台：知识库开发\n  - [5.1 后端：知识库前台列表接口开发 ](https://www.quanxiaoha.com/column/10215.html)\n  - [5.2 后端：知识库获取目录接口开发](https://www.quanxiaoha.com/column/10216.html)\n  - [5.3 后端：知识库获取文章上下篇接口开发](https://www.quanxiaoha.com/column/10217.html)\n  - [5.4 前台：知识库列表页开发](https://www.quanxiaoha.com/column/10218.html)\n  - [5.5 前台：知识库详情页开发（1）—— 基础布局](https://www.quanxiaoha.com/column/10220.html)\n  - [5.6 前台：知识库详情页开发（2）—— 文章详情渲染](https://www.quanxiaoha.com/column/10221.html)\n  - [5.7 前台：知识库详情页开发（3）—— 黑夜主题 CSS 适配](https://www.quanxiaoha.com/column/10222.html)\n  - [5.8 前台：知识库详情页开发（4）—— 右边栏文章目录](https://www.quanxiaoha.com/column/10223.html)\n  - [5.9 前台：知识库详情页开发（5）—— 左边栏知识库目录](https://www.quanxiaoha.com/column/10224.html)\n  - [5.10 前台：知识库详情页开发（6）—— 目录收缩展开](https://www.quanxiaoha.com/column/10225.html)\n  - [5.11 前台：知识库详情页开发（7）—— 移动端目录](https://www.quanxiaoha.com/column/10226.html)\n  \n- 六、博客前台：评论模块开发\n  - [6.1 评论模块需求分析、前台接口分析、表设计  ](https://www.quanxiaoha.com/column/10227.html)\n  - [6.2 整合 RestTemplate: 根据 QQ 号获取用户信息接口开发](https://www.quanxiaoha.com/column/10228.html)\n  - [6.3 后端：评论发布接口开发](https://www.quanxiaoha.com/column/10229.html)\n  - [6.4 后端：敏感词检测功能开发](https://www.quanxiaoha.com/column/10230.html)\n  - [6.5 后端：获取所有评论接口开发](https://www.quanxiaoha.com/column/10231.html)\n  - [6.6 Spring Boot 整合邮件：实现评论发布后通知博主、被回复人](https://www.quanxiaoha.com/column/10232.html)\n  - [6.7 前端：评论组件开发 (1) —— 评论发布样式布局](https://www.quanxiaoha.com/column/10233.html)\n  - [6.8 前端：评论组件开发（2）—— Popover 组件实现 Emoji 表情选择添加](https://www.quanxiaoha.com/column/10234.html)\n  - [6.9 前端：评论组件开发（3）—— 动态渲染 QQ 用户信息及 Pinia 全局状态存储](https://www.quanxiaoha.com/column/10235.html)\n  - [6.10 前端：评论组件开发（4）—— 评论列表样式布局](https://www.quanxiaoha.com/column/10236.html)\n  - [6.11 前端：评论组件开发（5）—— 评论发布、获取评论列表接口联调](https://www.quanxiaoha.com/column/10237.html)\n  \n  \n- 七、博客后台：评论模块开发  \n  - [7.1 后台评论管理需求分析](https://www.quanxiaoha.com/column/10238.html)\n  - [7.2 前端：后台博客设置页添加敏感词过滤、审核开关、邮箱配置选项](https://www.quanxiaoha.com/column/10239.html)\n  - [7.3 后端：评论分页查询接口开发](https://www.quanxiaoha.com/column/10240.html)\n  - [7.4 后端：评论删除接口开发](https://www.quanxiaoha.com/column/10241.html)\n  - [7.5 后端：评论状态审核接口开发](https://www.quanxiaoha.com/column/10242.html)\n  - [7.6 前端：后台评论管理页开发](https://www.quanxiaoha.com/column/10243.html)\n  - [7.7 前端：后台评论删除、查看评论详情功能开发](https://www.quanxiaoha.com/column/10244.html)\n  - [7.8 前端：后台评论审核功能开发](https://www.quanxiaoha.com/column/10245.html)\n  \n  - *持续爆肝中...*\n\n  \n\n\n\n\n## 👨🏻‍💻 适用人群\n\n- **在校学生**，有一定基础，想做毕业设计，或者为找工作准备，需要实战项目加分；\n\n  > 💡 TIP: 小白也没关系，小哈将会告诉你学习路线是啥，哪里有免费的高质量学习视频可以白嫖，学完这些技术栈后再来做实战项目，或者学一点基础边实战边学习都可以。\n\n- **已经参与工作，对前后端分离感兴趣**，想学习 Vue 3 前端，对独立上线自己网站感兴趣的童鞋；\n- **想独立接私活**，需要同时会后端、前端技术栈的童鞋；\n\n## ✊ 如何加入？\n\n小哈已经将本站的专栏模块接入了知识星球，想要查看专栏内容，需要订阅星球后，*微信扫码授权登录后即可解锁所有内容*。因为本项目实战星球主打性价比，所以价格不会太高。最开始定价是 35 元，目前领取优惠券后价格为 <font class=\"text-xl\" style=\'color: red\'><b>54 元（附 15 元的优惠券，记得扫码领取下方优惠券加入哟）</b></font>，后续随着内容持续更新，会慢慢涨上去，所以早加入更具性价比哟~ \n\n<font class=\"text-xl\" style=\'color: red\'><b>星球支持 3 天无理由全额退费</b></font>，感兴趣的小伙伴*可先加入，看看内容质量如何，不合适直接退款就行，觉得确实内容很干货，就留下来学习，无套路!*\n\n<div class=\"flex items-center justify-center text-lg text-red-500 font-bold mb-2\">扫描下方二维码加入, 星球支持 3 天无理由全额退款，可以先进去看看合不合适👇👇</div>\n\n![\"领取优惠券加入，更划算\"](https://img.quanxiaoha.com/quanxiaoha/172904121906753 \"领取优惠券加入，更划算\")\n\n<div class=\"flex items-center justify-center text-lg text-red-500 font-bold\">扫描上方二维码加入, 星球支持 3 天无理由全额退款，可以先进去看看合不合适👆👆</div>\n\n\n\n\n## ❓ 关于答疑\n\n小伙伴们如果在跟着专栏学习，手敲项目的过程中遇到问题，碰到无法解决的问题，**可在小哈的知识星球内部提问**，我会统一来解答, 如果星球说不清楚的，就加私人微信，打包发项目，亲自给你看哪一步有问题，保证跟上项目进度，不落下任何一个小伙伴，大家一起冲冲冲~\n\n## 😃 加微信咨询\n\n对专栏感兴趣的小伙伴，也可以加小哈私人微信来咨询，扫描下方二维码即可，记得备注【*咨询*】哟：\n\n![扫描二维码，添加小哈私人微信](https://img.quanxiaoha.com/quanxiaoha/169536889316499 \"扫描二维码，添加小哈私人微信\")');
INSERT INTO `t_article_content` VALUES (29, 29, '大家好，我是小哈~\n\n为了更高效率的开发 Vue 3，我们需要有个趁手的兵器，也就是开发工具。比较常见的如 VSCode 、Webstorm 等，但是官方推荐使用 VSCode， 那我们就通过 VSCode 来开发 Vue 3。\n\n## VSCode 简介\n\nVSCode 全称 Visual Studio Code，是微软出的一款轻量级代码编辑器，它具有如下特点：\n\n- 开源且免费；\n- 代码智能提示、自动补全功能；\n- 可自定义配置；\n- 支持丰富的文件格式；\n- 代码调试功能强大；\n- 各种方便的快捷键；\n- 强大的插件拓展功能；\n\n## 下载安装包\n\n前往 VSCode 官网：[https://code.visualstudio.com/](https://code.visualstudio.com/) 下载对应系统的安装包，小哈这里用 Windows 系统来演示：\n\n\n![官网下载 VSCode 安装包](https://img.quanxiaoha.com/quanxiaoha/168136203997815 \"官网下载 VSCode 安装包\")\n\n## 开始安装\n\n下载成功后，双击安装包开始安装 VSCode:\n\n![VSCode 安装包](https://img.quanxiaoha.com/quanxiaoha/168128659782959 \"VSCode 安装包\")\n\n勾选【我同意此协议】，点击下一步按钮：\n\n![同意安装协议](https://img.quanxiaoha.com/quanxiaoha/168128669924897 \"同意安装协议\")\n\n自定义安装路径，小哈这里安装在了 `D` 盘，可自行选择安装位置，继续点击下一步按钮：\n\n![自定义 VSCode 安装路径](https://img.quanxiaoha.com/quanxiaoha/168128682307134 \"自定义 VSCode 安装路径\")\n\n继续点击下一步按钮:\n\n![](https://img.quanxiaoha.com/quanxiaoha/168128697450593)\n\n勾选【创建桌面快捷方式】，点击下一步：\n\n![创建 VSCode 桌面快捷启动方式](https://img.quanxiaoha.com/quanxiaoha/168128704365752 \"创建 VSCode 桌面快捷启动方式\")\n\n点击【安装】：\n\n![开始安装 VSCode](https://img.quanxiaoha.com/quanxiaoha/168128715711838 \"开始安装 VSCode\")\n\n等待一分钟左右，即可安装成功，然后点击【完成】按钮：\n\n![VSCode 安装完成](https://img.quanxiaoha.com/quanxiaoha/168128726605058 \"VSCode 安装完成\")\n\n## 使用界面\n\n启动成功后，即可看到如下界面，至此，VSCode 就安装成功啦~\n\n![VSCode 界面](https://img.quanxiaoha.com/quanxiaoha/168128771855058 \"VSCode 界面\")');
INSERT INTO `t_article_content` VALUES (30, 30, '![](http://116.62.199.48:9000/weblog/c58c6db953d24922803a65ca4f79a0a9.png)\n\n## 目录\n\n- 一、什么是 Elasticsearch\n- 二、Elasticsearch 下载&安装\n- 三、Elasticsearch 安装&查看插件\n- 四、Elasticsearch 本地集群搭建\n\n## 一、什么是 Elasticsearch\n\nElasticsearch 是开源的分布式全文搜索引擎，它底层基于 Apache Lucene，具备高伸缩、高可靠、易管理等特点。提供搜索、分析、数据存储三大功能。特点包括分布式、RESTFul 接口、索引自动分片、副本机制、多数据源以及搜索负载等等。\n\n根据 DB-Engines 的排名显示，Elasticsearch 是最受欢迎的企业搜索引擎，其次是Apache Solr，它也是基于Lucene。\n\n今天，小哈就手摸手带着大家学会 Elasticsearch 单机、集群、插件安装步骤，附有丰富的图文哦~\n\n![](http://116.62.199.48:9000/weblog/cdef2beeed554a2ea272b89e9fc0f2af.jpg)\n\n\n\n## 二、Elasticsearch 下载&安装\n\n### 2.1 安装 Java\n\n在安装 Elasticsearch 之前，您需安装并配置好 JDK, 设置好环境变量 `$JAVA_HOME`。\n\n众所周知，Elasticsearch 版本很多，不同的版本对 Java 的依赖也有所差别:\n\n- Elasticsearch 5 需要 Java 8 以上版本；\n- Elasticsearch 6.5 开始支持 Java 11;\n- Elasticsearch 7.0 开始，内置了 Java 环境，所以说，安装 7.0+ 版本会方便很多。\n\n### 2.2 下载 Elasticsearch\n\n访问 Elasticsearch 官网 [https://www.elastic.co/cn/downloads/elasticsearch](https://www.elastic.co/cn/downloads/elasticsearch) 下载安装包:\n\n![](http://116.62.199.48:9000/weblog/86f0a43dda0e41fa9aec08a6bb98eb08.png)\n\n\n\n>  笔者这里下载的是 MAC 系统 Elasticsearch V7.1.0 版本作为演示。\n\n### 2.3 解压\n\n下载成功后，解压到指定目录：\n\n```\ntar -zxvf elasticsearch-7.1.0-darwin-x86_64.tar.gz\n```\n\n进入解压后的目录，结构如下:\n\n![](http://116.62.199.48:9000/weblog/c3560c7de3a34866a5a3299e7e709f08.png)\n\n\n\n### 2.4 Elasticsearch 目录、配置文件说明、注意点\n\n这里大概解答下各个目录、配置文件的作用:\n\n| 目录    | 配置文件         | 描述                                                     |\n| ------- | ---------------- | -------------------------------------------------------- |\n| bin     |                  | 放置脚本文件，如启动脚本 elasticsearch, 插件安装脚本等。 |\n| config  | elasticserch.yml | elasticsearch 配置文件，如集群配置、jvm 配置等。         |\n| jdk     |                  | java 运行环境                                            |\n| data    | path.data        | 数据持久化文件                                           |\n| lib     |                  | 依赖的相关类库                                           |\n| logs    | path.log         | 日志文件                                                 |\n| modules |                  | 包含的所有 ES 模块                                       |\n| plugins |                  | 包含的所有已安装的插件                                   |\n\n> 注意点:\n>\n> - 有些童鞋的机器内存可能不够，就需要修改 JVM 参数，配置文件路径为 `config/jvm.options`，ES V7.1 版本默认为 `1g`, 老版本为` 2g`, 你可以自行修改。\n> - `Xmx` 和` Xms` 数值请设置相同；\n> - `Xmx` 不要超过机器内存的 `50%`；\n> - 内存总量不要超过 30GB, 参见官方文档 [https://www.elastic.co/cn/blog/a-heap-of-trouble](https://www.elastic.co/cn/blog/a-heap-of-trouble)；\n\n### 2.5 运行 Elasticsearch\n\n执行启动命令：\n\n```\nbin/elasticsearch\n```\n\n![](http://116.62.199.48:9000/weblog/906f1005392d42fcbf1c638e775d9e00.png)\n\n\n\n看到启动日志中有 `started`关键字，就表示启动成功了。\n\n另外，我们还可以通过访问 Elasticsearch `9200`端口来实际验证一下:\n\n```\ncurl localhost：9200\n```\n\n![](http://116.62.199.48:9000/weblog/0de03e86c1d44537ad9b4f80432bc569.png)\n\n\n\n返回了 Elasticsearch 相关元数据，如版本信息 `7.1.0`，就明确表示大工告成，可以好好地玩耍了。\n\n> 之前，小哈还原创过一篇[《Docker 快速安装&搭建 Elasticsearch 环境》](https://www.exception.site/docker/docker-install-elasticserach)，其中包含如何通过 Docker 来安装 Elasticsearch, 有兴趣的小伙伴可以看下。\n\n### 2.6 Elasticsearch 关闭\n\n通过如下命令，找出正在运行的 ES 进程 PID:\n\n```\nps -ef | grep elasticsearch\n```\n\n![](http://116.62.199.48:9000/weblog/eadde145b3314079ad809141a10d17e1.png)\n\n\n\n\n执行 kill 命令，即可关闭 Elasticsearch 进程:\n\n```\nkill pid\n```\n\n## 三、Elasticsearch 安装&查看插件\n\n### 3.1 查看已安装的插件\n\n在 Elasticsearch 解压包的根目录下，通过如下命令，可以查看当前已安装的插件：\n\n```\nbin/elasticsearch-plugin list\n```\n\n![](http://116.62.199.48:9000/weblog/fd1563a2e20043a09599e66794450497.png)\n\n\n这里由于是第一次安装 Elasticsearch，还没有安装任何插件，所以显示的列表为空。\n\n### 3.2 安装插件\n\n安装插件命令格式如下:\n\n```\nbin/elasticsearch-plugin install {插件名称}\n```\n\n我们选择国际化分词插件 `analysis-icu`, 尝试去安装它：\n\n```\nbin/elasticsearch-plugin install analysis-icu\n```\n\n![](http://116.62.199.48:9000/weblog/ca39912bcb14491b8e1ff976cae15d9d.png)\n\n\n可以看到插件安装成功了。\n\n> 细心的小伙伴可能看到，控制台日志中有警告⚠️信息，这个会有影响么？\n>\n> 答案是: **不影响**！\n>\n> 小哈特意去 Elasticsearch GitHub issues 看了一下:\n>\n> ![](http://116.62.199.48:9000/weblog/e8a4fad6ed35404590007a69c81f0a64.png)\n\n\n\n接下来，再通过 `bin/elasticsearch-plugin list`命令就可以看到 `analysis-icu`插件已经显示在列表中了:\n\n![](http://116.62.199.48:9000/weblog/8e88731ea53449d382acb87e0d37cefb.png)\n\n\n除了上面这种方式外，还可以通过如下接口来查看:\n\n```\nGET /_cat/plugins\n```\n\n如图所示:\n\n![](http://116.62.199.48:9000/weblog/117ee862d6e6418f81c0d0e2b7e7c342.png)\n\n\n> 拓展：Elasticsearch 提供插件的机制，允许开发者对系统进行拓展。比如，通过插件的机制，来增加安全权限的管控，可参考开源的 ES 插件  [Search Guard](https://search-guard.com/).\n\n## 四、Elasticsearch 本地集群搭建\n\n我们将演示，如何在本机上搭建一个多节点的 Elasticsearch 集群。\n\n这个集群中会有 4 个节点，分别是 `node0`、`node1`、`node2`、`node3`。\n\n启动命令如下：\n\n```\nbin/elasticsearch -E node.name=node0 -E cluster.name=xiaoha-cluster -E path.data=node0_data -d\nbin/elasticsearch -E node.name=node1 -E cluster.name=xiaoha-cluster -E path.data=node1_data -d\nbin/elasticsearch -E node.name=node2 -E cluster.name=xiaoha-cluster -E path.data=node2_data -d\nbin/elasticsearch -E node.name=node3 -E cluster.name=xiaoha-cluster -E path.data=node3_data -d\n```\n\n\n小伙伴们可能会说：启动命令后面的参数都是啥意思？\n\n看图:\n\n![](http://116.62.199.48:9000/weblog/25c10b6d119a40e7b08d04c322c06041.jpg)\n\n\n启动成功后，我们可以通过 /_cat/nodes API 来查看集群节点信息：\n\n```\nGET /_cat/nodes\n```\n\n> 注意: 执行命令后，不要立即验证节点是否启动成功，因为启动成功需要花费一些时长，稍等片刻，就能看到被成功启动的节点了。\n\n接下来，通过 CURL 命令来查看一下节点信息：\n\n```\ncurl localhost:9200/_cat/nodes\n```\n\n![](http://116.62.199.48:9000/weblog/e9c4e5738d3a475a8ee2b27398a8babf.png)\n\n\n\n可以看到，一共 4 个节点，是 OK 的，另外，我们也可以通过 HEAD 插件来查看：\n\n![](http://116.62.199.48:9000/weblog/175949e65e1f4a50a1b74686282744ba.png)\n\n\n至此，一个 4 节点的 Elasticsearch 集群的本地环境搭建完毕。\n\n![](http://116.62.199.48:9000/weblog/5f62934f49ba424595fcf8b713488c99.jpg)\n\n\n## 五、结语\n\n本文中，小哈手摸手带着大家学会了 Elasticsearch 单机、集群、插件的安装，希望小伙伴们看完后，有所收获，下期见哦~\n');
INSERT INTO `t_article_content` VALUES (31, 31, '# 环境搭建\n## 微信小程序开发环境\n任务：注册小程序开发账号，下载安装微信小程序开发者工具\n\n> 注意：确保注册小程序开发账号的邮箱，之前没有注册过公众号开发账号、小游戏开发账号、其他微信小程序开发账号。另外，每个邮箱仅能注册一个小程序的开发账号。所以，如果之后你要开发第2个小程序，需要用新的邮箱注册，依次类推。\n\n### 开发者账号注册\n\n[点击注册](https://mp.weixin.qq.com/wxopen/waregister?action=step1)\n\n依次填写邮箱等信息、验证邮箱、手机号验证、人脸扫描验证，即可完成注册。\n\n第一步\n\n![第1步](https://img.quanxiaoha.com/quanxiaoha/49b6c4a9678c42239de52080b38b8fba.png)\n\n第二步\n\n![第2步](https://img.quanxiaoha.com/quanxiaoha/b2191c1df71d4c0d8f55443e4c01df68.png)\n\n第三步\n\n![第3步](https://img.quanxiaoha.com/quanxiaoha/6da77f22bb9c4653b95fd36f65566487.png)\n\n注册完成后，进入小程序开发和运营管理后台。\n\n![第4步](https://img.quanxiaoha.com/quanxiaoha/9f0ff76da788464bb3db8b8e8c13a9c7.png)\n\n下次便可以从微信公众平台扫码登录（注册账号时使用的微信号）\n\n![登录](https://img.quanxiaoha.com/quanxiaoha/a7a43b20c3174910b1e85b937530f05b.png)\n\n\n### 下载、安装和登录开发者工具\n\n[点击下载](https://developers.weixin.qq.com/miniprogram/dev/devtools/download.html)\n\n安装步骤就是**下一步**式的安装\n\n安装完成后运行，同样需要用注册的微信扫码登录\n\n![登录](https://img.quanxiaoha.com/quanxiaoha/823e74c6b8fc475ba42020c5693bd986.png)\n\n登录后\n\n![登录后](https://img.quanxiaoha.com/quanxiaoha/3382314f912748ddb040ccc1a148eee7.png)\n\n### 配置微信开发者工具\n\n![配置](https://img.quanxiaoha.com/quanxiaoha/32a4181bbccd44b2a5f8f6ed87e6975d.png)\n\n开发服务端口选项\n\n![开启选项](https://img.quanxiaoha.com/quanxiaoha/7e3e33a293e04ace8b08a73a6d798d63.png)\n\n\n## uni-app开发环境\n\n任务：注册dclound账号，下载安装HBuilderX\n\n### 注册 dclound 账号\n\n[点此注册](https://account.dcloud.net.cn/uni_modules/uni-id-pages/pages/register/register-by-email)\n\n填写注册信息\n\n![注册](https://img.quanxiaoha.com/quanxiaoha/d89440a2d5e547a0ad9c0f680ff97865.png)\n\n登录\n\n![登录](https://img.quanxiaoha.com/quanxiaoha/f38cb9908ed9425cb8fbc9975cf6e0b1.png)\n\n同样，登录后进入管理控制台\n\n### 下载、安装 HBuilderX\n\n[点击下载HBuilderX](https://www.dcloud.io/hbuilderx.html)\n\n同样，安装也是**下一步**式的\n\n启动 HBuilder 之后，登录账号\n\n![登录dcloud](https://img.quanxiaoha.com/quanxiaoha/a4718affd99f4847ac998de4658a7135.png)\n\n### 配置 HBuilder \n\n为了让 HBuilder 构建的小程序能够运行，需要告知 HBuilder 微信开发者工具的安装位置\n\n![配置](https://img.quanxiaoha.com/quanxiaoha/95e9722abef74c459a03e299bf6e376f.png)\n\n## 测试环境\n\n创建项目：文件 - 新建 - 项目\n\n![创建项目](https://img.quanxiaoha.com/quanxiaoha/40c5ad3cec1648eb99979ec7a4e37092.png)\n\n> HBuilderX 内置的模板以GUI的形式创建项目，比用vue项目用命令行的方式更加便捷\n\n选择模版、项目名、存储位置、使用Vue的版本\n\n![模板](https://img.quanxiaoha.com/quanxiaoha/00754e45861d43acb0308b53ea12ee36.png)\n\n运行：运行 - 运行到小程序模拟器 - 微信开发者工具\n\n![运行](https://img.quanxiaoha.com/quanxiaoha/4964eccb8949426f843a8bc7151ab7fc.png)\n\n如果HBuilderX控制台中没有错误提示、你的微信开发者工具也成功启动，并且看到了下图中的绿色大U，那么，恭喜你，你成功搭建好了环境。\n\n微信开发者工具被调起\n\n![调起](https://img.quanxiaoha.com/quanxiaoha/7ee4de14738e4e258ffeafc9d50087e9.png)\n\n成功的大U\n\n![U](https://img.quanxiaoha.com/quanxiaoha/3965b4dbfe0746e0ba0e628682621b21.png)\n\n下一篇中将介绍uni-app开发小程序的编译和运行的原理，以及开发需要提前具备的技能。\n\n\n');
INSERT INTO `t_article_content` VALUES (32, 32, '![](https://img.quanxiaoha.com/quanxiaoha/171255272716678)\n\n大家好，我是小哈~\n\n星球第二个项目开整啦，这次我们要开发一个**仿小红书项目** —— *小哈书* ！\n\n\n## 💁 项目介绍\n\n先来看一下小红书官网的对自己的介绍：\n\n> 小红书是一个年轻生活方式分享平台，由毛文超和瞿芳创立于2013年。\n>\n> 截止2019年1月，小红书用户数超过2亿，其中90后和95后是最活跃的用户群体。\n>\n> 在小红书，用户通过短视频、图文等形式记录生活的点滴。\n>\n> 社区每天产生数十亿次的笔记曝光，内容覆盖时尚、护肤、彩妆、美食、旅行、影视、读书、健身等各个生活方式领域。\n\n## 🍉 架构图\n\n本项目不再是单体架构，而是采用企业主流的 Spring Cloud Alibaba 技术栈，微服务分布式项目搞起！整体架构图如下：\n\n\n\n![](https://img.quanxiaoha.com/quanxiaoha/172386174198584)\n\n> PS : 本专栏主要讲解后端部分。前端工程后续也会提供相关源码，需要等后端相关接口开发完成后。（`uni-app` 暂不做实现，等后面再说）\n\n## 💡 你能学到什么？\n\n- 【**从 0 到 1 落地微服务架构**】，开局一个 IDEA，渐进式地将一个微服务项目搭建起来；\n- 【**学习 Spring Cloud Alibaba 微服务生态组件**】，如注册中心、配置中心 Nacos; 网关 Gateway、限流降级 Sentinel、服务间调用 Feign，以保障服务的高可用；\n- 【**微服务拆分、前后端分离**】，学会将系统拆分为多个微服务，实现服务之间低耦合，功能高内聚，以便对各服务分配不同的服务器资源；\n- 【**中间件使用**】，使用 Redis 缓存、RocketMQ 消息、XXL-JOB 调度、Cassandra 存储等中间件，提升系统性能，保障服务高性能响应；\n- 【**高并发读写设计**】，告别 CRUD, 能够根据业务场景，引入不同的机制，从而让接口支持高并发读写；\n- 【**用户认证鉴权**】，使用 SaToken 来实现用户的认证鉴权，告别 Spring Security 复杂繁琐的配置；\n- 【**需求分析，表设计，接口设计**】，通过分析 UI 原型图，来分析需求，从而进行表建模，以及接口的设计；\n- 【**分布式搜索引擎**】, 使用 Elasticsearch 提供相关中文分词搜索功能，如笔记搜索，用户名搜索等；\n- 【**对象存储**】，接入多种对象存储服务，如 Minio , 阿里云 OSS 等，实现对图片，视频的文件存储；\n- 【**接口性能压测**】，使用 Jmeter 性能压测工具，知道自己开发的接口性能如何，大概支持多少的吞吐量；\n- 【**Docker 容器化**】，使用 Docker 容器化技术快速搭建各种环境，包括微服务的容器化部署；\n- 【**运维经验: CI / CD 持续集成与部署**】，通过 Git 来做代码托管以及版本控制，以及 Jenkins 实现自动化部署，企业级项目上云，部署至生产环境，以供用户访问；\n- 更多细节，尽在项目中...\n\n\n\n## 📖 专栏大纲\n\n> 💡 TIP : 以下目录只是当前阶段更新的内容，最终**只会更多**。有兴趣的小伙伴可在 PC 端试读，访问链接：PC 端试读链接：[https://www.quanxiaoha.com/column](https://www.quanxiaoha.com/column)：\n\n- 一、[项目介绍](https://www.quanxiaoha.com/column/10247.html)\n\n- 二、本地开发环境搭建\n  - [2.1 安装与配置 JDK 17](https://www.quanxiaoha.com/column/10248.html)\n  - [2.2 安装 MySQL 8.0 数据库](https://www.quanxiaoha.com/column/10249.html)\n  - [2.3 Apipost 安装与使用](https://www.quanxiaoha.com/column/10261.html)\n  - [2.4 Docker 安装 Redis](https://www.quanxiaoha.com/column/10272.html)\n  \n  \n  \n- 三、Java 9 ~ 17 新特性讲解\n\n  - [3.1 Java 9 新特性：接口支持定义 private 方法](https://www.quanxiaoha.com/column/10252.html)\n  - [3.2 Java 11 新特性：var 局部变量类型推断](https://www.quanxiaoha.com/column/10253.html)\n  - [3.3 Java 13 新特性：增强版 switch](https://www.quanxiaoha.com/column/10251.html)\n  - [3.4 Java 14 新特性：更具体的空指针异常提示](https://www.quanxiaoha.com/column/10255.html)\n  - [3.5 Java 15 新特性：文本块](https://www.quanxiaoha.com/column/10250.html)\n  - [3.6 Java 16 新特性： instanceof 增强](https://www.quanxiaoha.com/column/10254.html)\n  - [3.7 Java 16 新特性：记录（Record）类型](https://www.quanxiaoha.com/column/10256.html)\n  - [3.8 Java 17 新特性：密封类与密封接口](https://www.quanxiaoha.com/column/10257.html)\n  \n  \n\n- 四、IDEA 搭建微服务项目\n  - [4.1 搭建微服务项目骨架：通过 Maven 多模块方式](https://www.quanxiaoha.com/column/10258.html)\n  - [4.2 添加 framework 平台基础设施模块](https://www.quanxiaoha.com/column/10259.html)\n  - [4.3 自定义 Spring Boot 3.x Starter: 封装 API 请求日志切面业务组件](https://www.quanxiaoha.com/column/10260.html)\n  - [4.4 Spring Boot 3.x 整合 MyBatis](https://www.quanxiaoha.com/column/10262.html)\n  - [4.5 Spring Boot 3.x 整合 Druid 数据库连接池（含密码加密）](https://www.quanxiaoha.com/column/10263.html)\n  - [4.6 Spring Boot 3.x 整合 MyBatis 代码生成器插件](https://www.quanxiaoha.com/column/10264.html)\n  - [4.7 自定义 Jackson 配置：支持 LocalDateTime 日期 API](https://www.quanxiaoha.com/column/10265.html)\n  - [4.8 Spring Boot 3.x 整合 Logback 日志框架（支持异步写入）](https://www.quanxiaoha.com/column/10266.html)\n  - [4.9 整合 flatten-maven-plugin 插件：解决子模块单独打包失败问题](https://www.quanxiaoha.com/column/10267.html)\n  - [4.10 Spring Boot 添加全局异常捕获、接口参数校验](https://www.quanxiaoha.com/column/10268.html)\n\n\n- 五、整合 SaToken 实现 JWT 登录功能  \n  - [5.1 原型图分析、用户表设计](https://www.quanxiaoha.com/column/10269.html)\n  - [5.2 整合 SaToken 权限认证框架，以及初步尝鲜](https://www.quanxiaoha.com/column/10270.html)\n  - [5.3 整合 RedisTemplate](https://www.quanxiaoha.com/column/10273.html)\n  - [5.4 获取手机短信验证码接口开发](https://www.quanxiaoha.com/column/10274.html)\n  - [5.5 Spring Boot 自定义线程池](https://www.quanxiaoha.com/column/10275.html)\n  - [5.6 短信发送功能开发：使用阿里云短信 SDK](https://www.quanxiaoha.com/column/10276.html)\n  - [5.7 自定义 @PhoneNumber 手机号校验注解](https://www.quanxiaoha.com/column/10277.html)\n  - [5.8 鉴权设计：RBAC 模型](https://www.quanxiaoha.com/column/10278.html)\n  - [5.9 RBAC 权限表设计、微服务鉴权架构设计](https://www.quanxiaoha.com/column/10279.html)\n  - [5.10 SaToken 整合 Redis: 解决重启项目，登录失效问题](https://www.quanxiaoha.com/column/10280.html)\n  - [5.11 用户注册/登录接口开发（1）](https://www.quanxiaoha.com/column/10281.html)\n  - [5.12 用户注册/登录接口开发（2）](https://www.quanxiaoha.com/column/10282.html)\n  - [5.13 编程式事务使用：更细粒度的事务控制](https://www.quanxiaoha.com/column/10283.html)\n  - [5.14 代码优化：Guava Preconditions 参数校验](https://www.quanxiaoha.com/column/10284.html)\n  - [5.15 同步【角色-权限集合】数据到 Redis 中](https://www.quanxiaoha.com/column/10285.html)\n  \n  \n  \n- 六、Nacos 注册中心搭建\n  - [6.1 Nacos 介绍与本地环境搭建](https://www.quanxiaoha.com/column/10286.html)\n  - [6.2 整合 Nacos 配置中心：实现动态配置刷新](https://www.quanxiaoha.com/column/10287.html)\n  - [6.3 Nacos 配置中心：动态加载 Bean](https://www.quanxiaoha.com/column/10288.html)\n  - [6.4 解决 Nacos 发布配置，导致 Druid 连接池关闭的问题](https://www.quanxiaoha.com/column/10289.html)\n  - [6.5 Nacos 命名空间的应用：项目隔离](https://www.quanxiaoha.com/column/10290.html)\n  - [6.6 服务注册：将认证服务注册到 Nacos 上](https://www.quanxiaoha.com/column/10291.html)\n \n  \n  \n- 七、Gateway 网关搭建与接口鉴权\n  - [7.1 Gateway 网关介绍与服务搭建：实现路由转发](https://www.quanxiaoha.com/column/10292.html)\n  - [7.2 网关整合 SaToken: 实现接口鉴权（1）](https://www.quanxiaoha.com/column/10293.html)\n  - [7.3 SaToken 自定义 Token 生成风格与请求格式](https://www.quanxiaoha.com/column/10294.html)\n  - [7.4 网关整合 SaToken: 实现接口鉴权（2）](https://www.quanxiaoha.com/column/10295.html)\n  - [7.5 Gataway 全局异常处理：统一出参格式](https://www.quanxiaoha.com/column/10296.html)\n  - [7.6 优化：网关登录校验失败提示信息](https://www.quanxiaoha.com/column/10297.html)\n  - [7.7 网关过滤器：实现用户 ID 透传到下游服务](https://www.quanxiaoha.com/column/10298.html)\n  - [7.8 用户退出登录接口开发](https://www.quanxiaoha.com/column/10299.html)\n  - [7.9 过滤器 + ThreadLocal 实现上下文传递：方便的获取登录用户 ID](https://www.quanxiaoha.com/column/10300.html)\n  - [7.10 使用阿里 TransmittableThreadLocal：解决异步获取上下文问题](https://www.quanxiaoha.com/column/10301.html)\n  - [7.11 密码修改接口开发: BCrypt 随机 “盐” 加密](https://www.quanxiaoha.com/column/10302.html)\n  - [7.12 账号密码登录功能开发](https://www.quanxiaoha.com/column/10303.html)\n  \n  \n  \n- 八、对象存储服务搭建与开发\n  - [8.1 Docker 本地安装 Minio 对象存储](https://www.quanxiaoha.com/column/10304.html)\n  - [8.2 对象存储微服务搭建](https://www.quanxiaoha.com/column/10305.html)\n  - [8.3 策略模式 + 工厂模式：实现文件处理可扩展](https://www.quanxiaoha.com/column/10306.html)\n  - [8.4 服务注册到 Nacos、动态配置、Minio 策略类逻辑补充](https://www.quanxiaoha.com/column/10307.html)\n  - [8.5 文件上传到阿里云 OSS 功能开发](https://www.quanxiaoha.com/column/10308.html)\n\n  \n- 九、用户服务搭建与开发\n  - [9.1 用户微服务搭建（1）](https://www.quanxiaoha.com/column/10309.html)\n  - [9.2 用户微服务搭建（2）](https://www.quanxiaoha.com/column/10310.html)\n  - [9.3 用户信息修改接口开发](https://www.quanxiaoha.com/column/10311.html)\n  - [9.4 引入 OpenFeign 组件：实现服务间调用](https://www.quanxiaoha.com/column/10312.html)\n  - [9.5 OpenFeign 支持表单请求](https://www.quanxiaoha.com/column/10313.html)\n  - [9.6 Feign 请求拦截器：实现 userId 服务间透传](https://www.quanxiaoha.com/column/10314.html)\n  - [9.7 代码重构：用户注册功能](https://www.quanxiaoha.com/column/10315.html)\n  - [9.8 代码重构：手机号查询用户信息接口开发](https://www.quanxiaoha.com/column/10316.html)\n  - [9.9 代码重构：密码更新接口](https://www.quanxiaoha.com/column/10317.html)\n \n- 十、K-V 短文本存储服务搭建与开发\n  - [10.1 短文本存储技术选型 ](https://www.quanxiaoha.com/column/10318.html)\n  - [10.2 Docker 安装 Cassandra ](https://www.quanxiaoha.com/column/10319.html)\n  - [10.3 CQL 基本命令](https://www.quanxiaoha.com/column/10320.html)\n  - [10.4 KV 键值存储微服务搭建](https://www.quanxiaoha.com/column/10321.html)\n  - [10.5 Spring Boot 3.x 整合 Cassandra](https://www.quanxiaoha.com/column/10322.html)\n  - [10.6 笔记内容新增接口开发](https://www.quanxiaoha.com/column/10323.html)\n  - [10.7 笔记内容查询接口开发](https://www.quanxiaoha.com/column/10324.html)\n  - [10.8 笔记内容删除接口开发](https://www.quanxiaoha.com/column/10325.html)\n  \n\n  \n- 十一、Jmeter 压力测试\n  - [11.1 性能测试概述](https://www.quanxiaoha.com/column/10326.html)\n  - [11.2 Jmeter 安装](https://www.quanxiaoha.com/column/10327.html)\n  - [11.3 Jmeter 压测 K-V 存储服务接口](https://www.quanxiaoha.com/column/10328.html)\n  - [11.4 Jmeter 线程组间传递 Token](https://www.quanxiaoha.com/column/10329.html)\n\n  \n- 十二、分布式 ID 生成服务搭建与开发\n  - [12.1 分布式 ID 介绍](https://www.quanxiaoha.com/column/10330.html)\n  - [12.2 美团 Leaf 本地搭建](https://www.quanxiaoha.com/column/10331.html)\n  - [12.3 Docker 安装 Zookeeper](https://www.quanxiaoha.com/column/10332.html)\n  - [12.4 美团 Leaf-snowflake 雪花算法模式测试](https://www.quanxiaoha.com/column/10333.html)\n  - [12.5 分布式 ID 生成微服务搭建](https://www.quanxiaoha.com/column/10334.html)\n  - [12.6 分布式 ID 生成服务整合 Leaf 源码](https://www.quanxiaoha.com/column/10335.html)\n  - [12.7 重构：调用分布式 ID 服务 —— 生成小哈书 ID、用户 ID](https://www.quanxiaoha.com/column/10336.html)\n  - [12.8 Bug 修复：Gateway 网关 SaToken 第一次获取 loginId 为空问题](https://www.quanxiaoha.com/column/10337.html)\n  \n\n  \n- 十三、笔记服务搭建与开发\n  - [13.1 笔记服务原型图分析、表设计](https://www.quanxiaoha.com/column/10338.html)\n  - [13.2 笔记微服务搭建（1）](https://www.quanxiaoha.com/column/10339.html)\n  - [13.3 笔记微服务搭建（2）](https://www.quanxiaoha.com/column/10340.html)\n  - [13.4 笔记发布接口开发（1）](https://www.quanxiaoha.com/column/10341.html)\n  - [13.5 笔记发布接口开发（2）](https://www.quanxiaoha.com/column/10342.html)\n  - [13.6 根据用户 ID 查询用户信息接口开发（1）](https://www.quanxiaoha.com/column/10343.html)\n  - [13.7 缓存设计（缓存雪崩、缓存穿透、缓存击穿）](https://www.quanxiaoha.com/column/10344.html)\n  - [13.8 查询用户信息接口开发（2）：引入 Redis 缓存](https://www.quanxiaoha.com/column/10345.html)\n  - [13.9 整合 Caffeine 本地缓存：引入二级缓存](https://www.quanxiaoha.com/column/10346.html)\n  - [13.10 笔记详情接口开发（1）](https://www.quanxiaoha.com/column/10347.html)\n  - [13.11 笔记详情接口开发（2）](https://www.quanxiaoha.com/column/10348.html)\n  - [13.12 优化：使用 CompletableFuture 并发调用下游服务](https://www.quanxiaoha.com/column/10349.html)\n  - [13.13 笔记更新接口发开（1）](https://www.quanxiaoha.com/column/10350.html)\n  \n  \n- 十四、消息中间件 RocketMQ\n  - [14.1 消息中间件（MQ） 介绍与技术选型](https://www.quanxiaoha.com/column/10351.html)\n  - [14.2 RocketMQ 本地环境搭建](https://www.quanxiaoha.com/column/10352.html)\n  - [14.3 IDEA 启动多个服务，本地模拟集群](https://www.quanxiaoha.com/column/10353.html)\n  - [14.4 Spring Boot 3.x 整合 RocketMQ：实现广播消息](https://www.quanxiaoha.com/column/10354.html)\n  - [14.5 笔记删除接口开发](https://www.quanxiaoha.com/column/10355.html)\n  - [14.6 笔记仅对自己可见接口开发](https://www.quanxiaoha.com/column/10356.html)\n  - [14.7 笔记置顶/取消置顶接口开发](https://www.quanxiaoha.com/column/10357.html)\n  \n \n- 十五、用户关系服务搭建与开发\n  - [15.1 用户关系服务职责说明、原型图分析、表设计](https://www.quanxiaoha.com/column/10358.html)\n  - [15.2 用户关系服务搭建（1）](https://www.quanxiaoha.com/column/10359.html)\n  - [15.3 用户关系服务搭建（2）](https://www.quanxiaoha.com/column/10360.html)\n  - [15.4 关注接口设计](https://www.quanxiaoha.com/column/10361.html)\n  - [15.5 关注接口开发（1）](https://www.quanxiaoha.com/column/10362.html)\n  - [15.6 关注接口设计（2）：Redis 流程设计以及引入 Lua 脚本](https://www.quanxiaoha.com/column/10363.html)\n  - [15.7 关注接口开发（2）](https://www.quanxiaoha.com/column/10364.html)\n  - [15.8 发送携带 Tag 标签的 MQ 消息](https://www.quanxiaoha.com/column/10365.html)\n  - [15.9 关注操作 MQ 消费者开发](https://www.quanxiaoha.com/column/10366.html)\n  - [15.10 Guava 令牌桶：实现 MQ 流量削峰](https://www.quanxiaoha.com/column/10367.html)\n  - [15.11 Bug 修复：笔记更新、删除、仅对自己可见权限校验问题](https://www.quanxiaoha.com/column/10368.html)\n  - [15.12 MQ 消费者：更新粉丝列表设计与开发](https://www.quanxiaoha.com/column/10369.html)\n  \n- 十六、用户关系服务搭建与开发（二）\n  - [16.1 取关接口开发（1）](https://www.quanxiaoha.com/column/10370.html)\n  - [16.2 取关接口开发（2）—— Redis 缓存处理](https://www.quanxiaoha.com/column/10371.html)\n  - [16.3 取关接口开发（3）—— MQ 消费者](https://www.quanxiaoha.com/column/10372.html)\n  - [16.4 RocketMQ 实现消息顺序消费](https://www.quanxiaoha.com/column/10373.html)\n  - [16.5 批量获取用户信息接口开发 —— 使用 Redis pipeline 管道同步数据](https://www.quanxiaoha.com/column/10374.html)\n  - [16.6 关注列表接口开发（1）](https://www.quanxiaoha.com/column/10375.html)\n  - [16.7 关注列表接口开发（2）](https://www.quanxiaoha.com/column/10376.html)\n  - [16.8 粉丝列表接口开发](https://www.quanxiaoha.com/column/10377.html)\n  \n- 十七、计数服务搭建与开发\n  - [17.1 计数服务职责说明、原型图分析、表设计](https://www.quanxiaoha.com/column/10378.html)\n  - [17.2 计数服务搭建（1）](https://www.quanxiaoha.com/column/10379.html)\n  - [17.3 计数服务搭建（2）](https://www.quanxiaoha.com/column/10380.html)\n  - [17.4 Bug 修复：RocketMQ 消费 MQ 慢、无法消费问题解决](https://www.quanxiaoha.com/column/10381.html)\n  - [17.5 计数方案设计：用户关注数、粉丝数](https://www.quanxiaoha.com/column/10382.html)\n  - [17.6 创建关注数、粉丝数计数 MQ 消费者](https://www.quanxiaoha.com/column/10383.html)\n  - [17.7 整合快手 BufferTrigger：实现流量聚合](https://www.quanxiaoha.com/column/10384.html)\n  - [17.8 计数开发：粉丝数写入 Redis](https://www.quanxiaoha.com/column/10385.html)\n  - [17.9 计数开发：粉丝数更新入库](https://www.quanxiaoha.com/column/10386.html)\n  - [17.10 计数开发：关注数写入 Redis、落库](https://www.quanxiaoha.com/column/10387.html)\n  \n- 十八、计数服务搭建与开发（2）\n  - [18.1 笔记点赞、点赞列表方案设计](https://www.quanxiaoha.com/column/10388.html)\n  - [18.2 Redis 安装 Bloom 布隆过滤器模块](https://www.quanxiaoha.com/column/10389.html)\n  - [18.3 笔记点赞接口开发（1）—— Bloom 布隆过滤器校验](https://www.quanxiaoha.com/column/10390.html)\n  - [18.4 笔记点赞接口开发（2）—— 布隆过滤器误判问题](https://www.quanxiaoha.com/column/10391.html)\n  - [18.5 发送携带 Tag 的顺序 MQ 消息：点赞数据落库](https://www.quanxiaoha.com/column/10393.html)\n  - [18.6 Bug 修复：Bloom 布隆过滤器不存在时，未校验是否点赞其他笔记](https://www.quanxiaoha.com/column/10394.html)\n  - [18.7 笔记取消点赞接口开发](https://www.quanxiaoha.com/column/10395.html)\n  - [18.8 发送顺序 MQ 消息：取消点赞数据更新落库](https://www.quanxiaoha.com/column/10396.html)\n  - [18.9 计数开发：笔记点赞数统计](https://www.quanxiaoha.com/column/10397.html)\n  - [18.10 笔记收藏接口开发（1）—— Bloom 布隆过滤器校验](https://www.quanxiaoha.com/column/10398.html)\n  - [18.11 笔记收藏接口开发（2）—— 布隆过滤器误判问题](https://www.quanxiaoha.com/column/10399.html)\n  - [18.12 笔记收藏接口开发（3）—— 更新 ZSET 列表](https://www.quanxiaoha.com/column/10400.html)\n  - [18.13 发送携带 Tag 的顺序 MQ 消息：收藏数据落库](https://www.quanxiaoha.com/column/10401.html)\n  - [18.14 笔记取消收藏接口开发](https://www.quanxiaoha.com/column/10402.html)\n  - [18.15 发送顺序 MQ 消息：取消收藏数据更新落库](https://www.quanxiaoha.com/column/10403.html)\n  - [18.16 计数开发：笔记收藏数统计](https://www.quanxiaoha.com/column/10404.html)\n  - [18.17 用户维度：点赞数、收藏数统计](https://www.quanxiaoha.com/column/10405.html)\n  - [18.18 计数开发：用户笔记发布数统计](https://www.quanxiaoha.com/column/10406.html)\n  \n- 十九、数据对齐服务搭建与开发\n  - [19.1 数据对齐服务职责说明、方案与表设计](https://www.quanxiaoha.com/column/10407.html)\n  - [19.2 数据对齐服务搭建](https://www.quanxiaoha.com/column/10408.html)\n  - [19.3 本地搭建 XXL-JOB 分布式任务调度平台](https://www.quanxiaoha.com/column/10409.html)\n  - [19.4 Spring Boot 3.x 整合 XXL-JOB](https://www.quanxiaoha.com/column/10410.html)\n  - [19.5 定时任务开发：预创建日增量表](https://www.quanxiaoha.com/column/10411.html)\n  - [19.6 MQ 消费者开发：日增量变更数据入库 —— 笔记点赞、取消点赞](https://www.quanxiaoha.com/column/10412.html)\n  - [19.7 MQ 消费者开发：日增量变更数据入库 —— 笔记收藏、取消收藏](https://www.quanxiaoha.com/column/10413.html)\n  - [19.8 定时任务开发：删除近一个月日增量临时表](https://www.quanxiaoha.com/column/10414.html)\n  - [19.9 MQ 消费者开发：日增量变更数据入库 —— 笔记发布、删除](https://www.quanxiaoha.com/column/10415.html)\n  - [19.10 MQ 消费者开发：日增量变更数据入库 —— 用户关注、取关](https://www.quanxiaoha.com/column/10416.html)\n  - [19.11 Spring Boot 3.x 通过 XXL-JOB 实现分片广播任务](https://www.quanxiaoha.com/column/10417.html)\n  - [19.12 Bug 修复：点赞同一用户发布的两篇不同笔记，无法保存变更记录](https://www.quanxiaoha.com/column/10418.html)\n  - [19.13 分片广播任务开发: 笔记点赞数对齐](https://www.quanxiaoha.com/column/10419.html)\n\n- 二十、Elasticsearch 分布式搜索引擎\n  - [20.1 搜索服务职责说明、原型图分析、同步方案选择](https://www.quanxiaoha.com/column/10420.html)\n  - [20.2 Docker 安装 Elasticsearch 7.x 以及 head 可视化工具](https://www.quanxiaoha.com/column/10421.html)\n  - [20.3 Elasticsearch 核心概念介绍](https://www.quanxiaoha.com/column/10422.html)\n  - [20.4 Docker 安装 Kibana](https://www.quanxiaoha.com/column/10423.html)\n  - [20.5 Elasticsearch 基础语法学习](https://www.quanxiaoha.com/column/10424.html)\n  - [20.6 Elasticsearch 数据类型](https://www.quanxiaoha.com/column/10425.html)\n  - [20.7 倒排索引介绍与常见的 Analyzer 分词器](https://www.quanxiaoha.com/column/10426.html)\n  - [20.8 Elasticsearch 安装 ik 中文分词器插件](https://www.quanxiaoha.com/column/10427.html)\n  - [20.9 笔记、用户索引构建以及 function_score 自定义文档得分](https://www.quanxiaoha.com/column/10428.html)\n  - [20.10 全量 es 索引构建：使用 logstash-input-jdbc 插件](https://www.quanxiaoha.com/column/10429.html)\n  - [20.11 增量 es 索引构建：使用 logstash-input-jdbc 插件](https://www.quanxiaoha.com/column/10430.html)\n  \n- 二十一、搜索服务搭建与开发\n  - [21.1 搜索服务搭建](https://www.quanxiaoha.com/column/10431.html)\n  - [21.2 整合 RestHighLevelClient 客户端 —— 开发用户搜索接口](https://www.quanxiaoha.com/column/10432.html)\n  - [21.3 用户昵称关键词 highlight 高亮与数量转换工具类封装](https://www.quanxiaoha.com/column/10433.html)\n  \n  - *持续更新中...*\n  \n- 项目面试\n  - [简历：小哈书项目介绍怎么写？](https://www.quanxiaoha.com/column/10392.html)\n  \n- *以上为本项目第二阶段需要更新的内容，持续爆肝中...*\n  \n  \n\n  \n\n\n\n\n\n\n## 👨🏻‍💻 适用人群\n\n- **在校学生**，有 Java  Web 单体项目开发基础，想做毕业设计，或者为找工作准备，需要实战项目加分；\n\n  > 💡 TIP: 小白也没关系，小哈将会告诉你学习路线是啥，哪里有免费的高质量学习视频可以白嫖，学完这些技术栈后再来做实战项目，或者学一点基础边实战边学习都可以。\n\n- **初级以上 Java 后端开发人群，想继续提升技术，对 Spring Cloud Alibaba 微服务感兴趣**的童鞋；\n\n## ✅ 技术储备\n\n- 具备一定的 Java 开发基础；\n- 使用过 Spring Boot 进行 Web 项目开发；\n- 了解微服务架构；\n- 了解 Redis 分布式缓存；\n\n## 🏠 环境参数\n\n- JDK 17;\n- Spring Boot 3.0.2;\n- Spring Cloud Alibaba 2022.0.0.0-RC2;\n\n## ✊ 如何加入？\n\n小哈已经将本站的专栏模块接入了知识星球，想要查看专栏内容，需要订阅星球后，*微信扫码授权登录后即可解锁所有内容*。因为本项目实战星球主打性价比，所以价格不会太高。最开始定价是 35 元，目前领取优惠券后价格为 <font class=\"text-xl\" style=\'color: red\'><b>54 元（附 15 元的优惠券，记得扫码领取下方优惠券加入哟）</b></font>，后续随着内容持续更新，会慢慢涨上去，所以早加入更具性价比哟~ \n\n<font class=\"text-xl\" style=\'color: red\'><b>星球支持 3 天无理由全额退费</b></font>，感兴趣的小伙伴*可先加入，看看内容质量如何，不合适直接退款就行，觉得确实内容很干货，就留下来学习，无套路!*\n\n<div class=\"flex items-center justify-center text-lg text-red-500 font-bold mb-2\">扫描下方二维码加入, 星球支持 3 天无理由全额退款，可以先进去看看合不合适👇👇</div>\n\n\n\n![\"领取优惠券加入，更划算\"](https://img.quanxiaoha.com/quanxiaoha/172904121906753 \"领取优惠券加入，更划算\")\n\n<div class=\"flex items-center justify-center text-lg text-red-500 font-bold\">扫描上方二维码加入, 星球支持 3 天无理由全额退款，可以先进去看看合不合适👆👆</div>\n\n\n\n\n## ❓ 关于答疑\n\n小伙伴们如果在跟着专栏学习，手敲项目的过程中遇到问题，碰到无法解决的问题，**可在小哈的知识星球内部提问**，我会统一来解答, 如果星球说不清楚的，就加私人微信，打包发项目，亲自给你看哪一步有问题，保证跟上项目进度，不落下任何一个小伙伴，大家一起冲冲冲~\n\n## 😃 加微信咨询\n\n对专栏感兴趣的小伙伴，也可以加小哈私人微信来咨询，扫描下方二维码即可，记得备注【*咨询*】哟：\n\n![扫描二维码，添加小哈私人微信](https://img.quanxiaoha.com/quanxiaoha/169536889316499 \"扫描二维码，添加小哈私人微信\")\n\n');

-- ----------------------------
-- Table structure for t_article_tag_rel
-- ----------------------------
DROP TABLE IF EXISTS `t_article_tag_rel`;
CREATE TABLE `t_article_tag_rel`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `article_id` bigint(20) UNSIGNED NOT NULL COMMENT '文章id',
  `tag_id` bigint(20) UNSIGNED NOT NULL COMMENT '标签id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_article_id`(`article_id`) USING BTREE,
  INDEX `idx_tag_id`(`tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 315 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章对应标签关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_article_tag_rel
-- ----------------------------
INSERT INTO `t_article_tag_rel` VALUES (134, 17, 43);
INSERT INTO `t_article_tag_rel` VALUES (135, 17, 44);
INSERT INTO `t_article_tag_rel` VALUES (136, 17, 47);
INSERT INTO `t_article_tag_rel` VALUES (181, 29, 44);
INSERT INTO `t_article_tag_rel` VALUES (182, 29, 39);
INSERT INTO `t_article_tag_rel` VALUES (183, 29, 38);
INSERT INTO `t_article_tag_rel` VALUES (190, 30, 49);
INSERT INTO `t_article_tag_rel` VALUES (191, 30, 50);
INSERT INTO `t_article_tag_rel` VALUES (192, 30, 51);
INSERT INTO `t_article_tag_rel` VALUES (251, 18, 42);
INSERT INTO `t_article_tag_rel` VALUES (252, 18, 46);
INSERT INTO `t_article_tag_rel` VALUES (253, 18, 48);
INSERT INTO `t_article_tag_rel` VALUES (271, 31, 51);
INSERT INTO `t_article_tag_rel` VALUES (306, 19, 38);
INSERT INTO `t_article_tag_rel` VALUES (307, 19, 39);
INSERT INTO `t_article_tag_rel` VALUES (308, 19, 40);
INSERT INTO `t_article_tag_rel` VALUES (309, 19, 41);
INSERT INTO `t_article_tag_rel` VALUES (310, 32, 38);
INSERT INTO `t_article_tag_rel` VALUES (311, 32, 39);
INSERT INTO `t_article_tag_rel` VALUES (312, 32, 40);
INSERT INTO `t_article_tag_rel` VALUES (313, 32, 41);
INSERT INTO `t_article_tag_rel` VALUES (314, 32, 52);

-- ----------------------------
-- Table structure for t_blog_settings
-- ----------------------------
DROP TABLE IF EXISTS `t_blog_settings`;
CREATE TABLE `t_blog_settings`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `logo` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '博客Logo',
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '博客名称',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '作者名',
  `introduction` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '介绍语',
  `avatar` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '作者头像',
  `github_homepage` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'GitHub 主页访问地址',
  `csdn_homepage` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'CSDN 主页访问地址',
  `gitee_homepage` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Gitee 主页访问地址',
  `zhihu_homepage` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '知乎主页访问地址',
  `mail` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '博主邮箱地址',
  `is_comment_sensi_word_open` tinyint(2) NOT NULL DEFAULT 1 COMMENT '是否开启评论敏感词过滤',
  `is_comment_examine_open` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否开启评论审核, 0: 未开启；1：开启',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '博客设置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_blog_settings
-- ----------------------------
INSERT INTO `t_blog_settings` VALUES (1, 'https://img.quanxiaoha.com/quanxiaoha/f97361c0429d4bb1bc276ab835843065.jpg', '犬小哈的演示博客', '犬小哈', '一枚程序员', 'https://img.quanxiaoha.com/quanxiaoha/1e5a7ec0c3294fdfbdbd40577ba656a2.jpg', 'https://www.quanxiaoha.com', 'https://www.quanxiaoha.com', 'https://www.quanxiaoha.com', 'https://www.quanxiaoha.com', '871361652@qq.com', 0, 0);

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `is_deleted` tinyint(2) NOT NULL DEFAULT 0 COMMENT '逻辑删除标志位：0：未删除 1：已删除',
  `articles_total` int(11) NOT NULL DEFAULT 0 COMMENT '此分类下文章总数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES (20, 'Postman', '2023-11-23 03:46:23', '2023-11-23 03:46:23', 0, 1);
INSERT INTO `t_category` VALUES (21, 'Java', '2023-11-23 03:46:29', '2023-11-23 03:46:29', 0, 3);
INSERT INTO `t_category` VALUES (22, 'Spring Boot', '2023-12-02 07:59:34', '2023-12-02 07:59:34', 0, 0);
INSERT INTO `t_category` VALUES (23, 'Spring Cloud Alibaba', '2023-12-20 11:30:16', '2023-12-20 11:30:16', 0, 1);
INSERT INTO `t_category` VALUES (24, 'Netty', '2023-12-20 11:30:36', '2023-12-20 11:30:36', 0, 0);
INSERT INTO `t_category` VALUES (25, '团队管理', '2023-12-20 11:31:15', '2023-12-20 11:31:15', 0, 0);
INSERT INTO `t_category` VALUES (26, '前端', '2024-01-22 08:58:36', '2024-01-22 08:58:36', 0, 2);
INSERT INTO `t_category` VALUES (27, '设计模式', '2024-07-20 12:48:18', '2024-07-20 12:48:18', 0, 0);

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `content` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '评论内容',
  `avatar` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `nickname` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `mail` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `website` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网站地址',
  `router_url` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '评论所属的路由',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_deleted` tinyint(2) NOT NULL DEFAULT 0 COMMENT '删除标志位：0：未删除 1：已删除',
  `reply_comment_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '回复的评论 ID',
  `parent_comment_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '父评论 ID',
  `reason` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '原因描述',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '1: 待审核；2：正常；3：审核未通过;',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_router_url`(`router_url`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE,
  INDEX `idx_reply_comment_id`(`reply_comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43624 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (20, '评论上线啦😁', 'https://q1.qlogo.cn/headimg_dl?dst_uin=871361652&spec=100', '犬小哈', '871361652@qq.com', 'www.quanxiaoha.com', '/article/30', '2024-02-23 19:22:57', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (22, '第一条评论😍😂', 'https://q1.qlogo.cn/headimg_dl?dst_uin=871361652&spec=100', '犬小哈', '871361652@qq.com', '', '/article/19', '2024-02-23 19:24:24', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (23, '第二条，是我的', '', '是小白呀', '2720513064@qq.com', 'atxbai.top', '/article/19', '2024-02-23 19:31:05', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (24, '速度贼快🙈', 'https://q1.qlogo.cn/headimg_dl?dst_uin=871361652&spec=100', '犬小哈', '871361652@qq.com', '', '/article/19', '2024-02-23 19:32:20', 0, 23, 23, '', 2);
INSERT INTO `t_comment` VALUES (25, '体验新功能😍😍😍', 'https://q2.qlogo.cn/headimg_dl?spec=100&dst_uin=2720513064', '是小白呀', '2720513064@qq.com', '', '/article/19', '2024-02-23 19:36:01', 0, 24, 23, '', 2);
INSERT INTO `t_comment` VALUES (26, '后台怎么没看到管理评论的捏🙈', '', '是小白呀', '2720513064@qq.com', '', '/article/19', '2024-02-23 19:38:54', 0, 24, 23, '', 2);
INSERT INTO `t_comment` VALUES (27, '目前只是前台加了，后台管理还没上咧，估计过两天能上，后台现在都是模板式的代码，比较好弄😜', 'https://q1.qlogo.cn/headimg_dl?dst_uin=871361652&spec=100', '犬小哈', '871361652@qq.com', '', '/article/19', '2024-02-23 19:41:31', 0, 26, 23, '', 2);
INSERT INTO `t_comment` VALUES (28, 'OK😂', '', '是小白呀', '2720513064@qq.com', '', '/article/19', '2024-02-23 19:48:56', 0, 27, 23, '', 2);
INSERT INTO `t_comment` VALUES (29, '我给你回复消息，你那边能够收到邮件提醒不', 'https://q1.qlogo.cn/headimg_dl?dst_uin=871361652&spec=100', '犬小哈', '871361652@qq.com', '', '/article/19', '2024-02-23 19:50:03', 0, 28, 23, '', 2);
INSERT INTO `t_comment` VALUES (30, '回复测试', 'https://q1.qlogo.cn/headimg_dl?dst_uin=871361652&spec=100', '犬小哈', '871361652@qq.com', '', '/article/30', '2024-02-23 19:59:03', 0, 20, 20, '', 2);
INSERT INTO `t_comment` VALUES (31, '邮件回复测试', 'https://q1.qlogo.cn/headimg_dl?dst_uin=871361652&spec=100', '犬小哈', '871361652@qq.com', '', '/article/30', '2024-02-23 20:17:42', 0, 30, 20, '', 2);
INSERT INTO `t_comment` VALUES (32, '好像没有提示 😂好像他更新也比较慢，有时候我在手机端看到了，电脑端的话还要刷新两遍才能看到', '', '是小白呀', '2720513064@qq.com', '', '/article/19', '2024-02-23 21:24:41', 0, 29, 23, '', 2);
INSERT INTO `t_comment` VALUES (33, '这次应该有回复的邮件提示了，如果你上条消息有填邮箱的话', 'https://q1.qlogo.cn/headimg_dl?dst_uin=871361652&spec=100', '犬小哈', '871361652@qq.com', '', '/article/19', '2024-02-23 21:27:31', 0, 32, 23, '', 2);
INSERT INTO `t_comment` VALUES (34, '真的有了，可以哇，有点小期待了，看看怎么实现的😍', '', '是小白呀', '2720513064@qq.com', '', '/article/19', '2024-02-23 23:08:58', 0, 33, 23, '', 2);
INSERT INTO `t_comment` VALUES (35, '666', '', '1737660383', '1737660383@qq.com', '', '/article/30', '2024-02-24 10:37:43', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (36, '999', '', '1737660383', '1737660383@qq.com', '', '/article/30', '2024-02-24 10:38:14', 0, 35, 35, '', 2);
INSERT INTO `t_comment` VALUES (37, '你好\n', '', '大白', '706716852@qq.com', '', '/article/19', '2024-02-24 17:18:42', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (38, 'haha ', '', '706716852', '706716852@qq.com', '', '/article/19', '2024-02-24 17:19:15', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (47, '1', 'https://q2.qlogo.cn/headimg_dl?spec=100&dst_uin=12345', '12345', '12345@qq.com', '', '/article/18', '2024-02-24 21:52:46', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (58, '发现这个根据 QQ 获取昵称和邮箱的第三方接口，时好时坏的😵', 'https://q1.qlogo.cn/headimg_dl?dst_uin=871361652&spec=100', '犬小哈', '871361652@qq.com', '', '/article/19', '2024-02-24 22:32:40', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (59, '我来了', 'https://q2.qlogo.cn/headimg_dl?spec=100&dst_uin=3164852886', '。', '3164852886@qq.com', '', '/article/19', '2024-02-26 11:28:44', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (60, '滴滴滴滴   哈总威武 测试邮箱回复', '', '992934818@qq.com', '992934818@qq.com', '', '/article/19', '2024-02-26 13:54:08', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (61, '1', '', '992934818@qq.com', '992934818@qq.com', '', '/article/19', '2024-02-26 13:54:15', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (67, '不防刷吗 咋能一直评论', '', '992934818@qq.com', '992934818@qq.com', '', '/article/19', '2024-02-26 13:54:43', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (68, '哈总评论加敏感词过滤了吗', 'https://q2.qlogo.cn/headimg_dl?spec=100&dst_uin=3164852886', '。', '3164852886@qq.com', '', '/article/30', '2024-02-26 17:16:16', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (69, '防刷功能还没加😂', 'https://q1.qlogo.cn/headimg_dl?dst_uin=871361652&spec=100', '犬小哈', '871361652@qq.com', '', '/article/19', '2024-02-27 10:48:54', 0, 67, 67, '', 2);
INSERT INTO `t_comment` VALUES (70, '欢迎欢迎😁', 'https://q1.qlogo.cn/headimg_dl?dst_uin=871361652&spec=100', '犬小哈', '871361652@qq.com', '', '/article/19', '2024-02-27 10:49:28', 0, 59, 59, '', 2);
INSERT INTO `t_comment` VALUES (71, '敏感词过滤肯定得整上，目前还没添加😎', 'https://q1.qlogo.cn/headimg_dl?dst_uin=871361652&spec=100', '犬小哈', '871361652@qq.com', '', '/article/30', '2024-02-27 10:51:47', 0, 68, 68, '', 2);
INSERT INTO `t_comment` VALUES (72, '不错不错😎', '', '157334473', '157334473@qq.com', '', '/article/30', '2024-02-27 11:00:49', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (73, '嗨', '', '昵称13123', 'daxiawan69@gmail.com', '', '/article/18', '2024-02-28 11:54:57', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (74, '你好', '', '123', 'daxiawan69@gmail.com', '', '/article/18', '2024-02-28 11:55:03', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (75, '嗨', '', '123', 'daxiawan69@gmail.com', '', '/article/18', '2024-02-28 11:55:10', 0, 73, 73, '', 2);
INSERT INTO `t_comment` VALUES (76, '点击头像能跳吗😃', 'https://q2.qlogo.cn/headimg_dl?spec=100&dst_uin=3164852886', '。', '3164852886@qq.com', 'https://www.xiaotianhblog.com/#/', '/article/19', '2024-02-28 16:24:35', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (77, '这边测试，点击你的头像可以跳转到你的网站的😎', 'https://qh.qlogo.cn/g?b=sdk&ek=AQAJ99lfkKA9TldbMpTOicsyfib30JOuNnqdaFehfOzYz8qEQo3f7JbY24mCKYoZ5meJibLeuDq&s=100&t=1681803828', '犬小哈', '871361652@qq.com', '', '/article/19', '2024-02-29 14:31:23', 0, 76, 76, '', 2);
INSERT INTO `t_comment` VALUES (78, '第一条知识库评论🥳🥳🥳', 'https://qh.qlogo.cn/g?b=sdk&ek=AQAJ99lfkKA9TldbMpTOicsyfib30JOuNnqdaFehfOzYz8qEQo3f7JbY24mCKYoZ5meJibLeuDq&s=100&t=1681803828', '犬小哈', '871361652@qq.com', NULL, '/wiki/6?articleId=19', '2024-02-29 16:46:19', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (79, '测试', 'https://q2.qlogo.cn/headimg_dl?spec=100&dst_uin=1905752630', '按时吃饭并不难', '1905752630@qq.com', NULL, '/article/17', '2024-03-01 09:04:38', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (80, '测试回复', 'https://q2.qlogo.cn/headimg_dl?spec=100&dst_uin=1905752630', '按时吃饭并不难', '1905752630@qq.com', NULL, '/article/17', '2024-03-01 09:05:13', 0, 79, 79, '', 2);
INSERT INTO `t_comment` VALUES (81, '测试回复回复', 'https://q2.qlogo.cn/headimg_dl?spec=100&dst_uin=1905752630', '按时吃饭并不难', '1905752630@qq.com', NULL, '/article/17', '2024-03-01 09:05:20', 0, 80, 79, '', 2);
INSERT INTO `t_comment` VALUES (82, '测试回复回复回复', 'https://q2.qlogo.cn/headimg_dl?spec=100&dst_uin=1905752630', '按时吃饭并不难', '1905752630@qq.com', NULL, '/article/17', '2024-03-01 09:05:33', 0, 81, 79, '', 2);
INSERT INTO `t_comment` VALUES (83, '测试回复回复回复回复', 'https://q2.qlogo.cn/headimg_dl?spec=100&dst_uin=1905752630', '按时吃饭并不难', '1905752630@qq.com', NULL, '/article/17', '2024-03-01 09:05:49', 0, 81, 79, '', 2);
INSERT INTO `t_comment` VALUES (86, '1', 'https://qh.qlogo.cn/g?b=sdk&ek=AQPDHzPE5aQDlosh1wS9F7oKOyCiadxicOoKiaODia766mhzKfABF9ev8Myhyyc4pQ&s=100&t=1555323417', '12345', '12345@qq.com', NULL, '/article/18', '2024-03-01 15:35:04', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39803, '111', 'https://qh.qlogo.cn/g?b=sdk&ek=AQCX0app6ia4HVeiaSRnrQBoeicQIRicAIoblSrZTZQTxFOEFPmKIdw&s=100&t=0', '王梓洋', '12036458965@qq.com', NULL, '/article/18', '2024-03-01 15:41:21', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39805, '你好', 'https://qh.qlogo.cn/g?b=sdk&ek=AQAJ99lfkKA9TldbMpTOicsyfib30JOuNnqdaFehfOzYz8qEQo3f7JbY24mCKYoZ5meJibLeuDq&s=100&t=1681803828', '犬小哈', '871361652@qq.com', NULL, '/article/19', '2024-03-01 21:32:26', 0, NULL, NULL, '', 1);
INSERT INTO `t_comment` VALUES (39806, 'hello 😁', 'https://qh.qlogo.cn/g?b=sdk&ek=AQAJ99lfkKA9TldbMpTOicsyfib30JOuNnqdaFehfOzYz8qEQo3f7JbY24mCKYoZ5meJibLeuDq&s=100&t=1681803828', '犬小哈', '871361652@qq.com', NULL, '/article/19', '2024-03-02 17:09:35', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39807, '敏感词测试: 有没有桃色电影网址推荐', 'https://qh.qlogo.cn/g?b=sdk&ek=AQAJ99lfkKA9TldbMpTOicsyfib30JOuNnqdaFehfOzYz8qEQo3f7JbY24mCKYoZ5meJibLeuDq&s=100&t=1681803828', '犬小哈', '871361652@qq.com', NULL, '/article/19', '2024-03-02 17:12:52', 0, NULL, NULL, '系统拦截，包含敏感词：[桃色, 色, 桃色电影, 色电影, 电影]', 3);
INSERT INTO `t_comment` VALUES (39808, '有没有桃色电影网址推荐', 'https://qh.qlogo.cn/g?b=sdk&ek=AQAJ99lfkKA9TldbMpTOicsyfib30JOuNnqdaFehfOzYz8qEQo3f7JbY24mCKYoZ5meJibLeuDq&s=100&t=1681803828', '犬小哈', '871361652@qq.com', NULL, '/wiki/6?articleId=19', '2024-03-04 14:45:50', 0, NULL, NULL, '系统拦截，包含敏感词：[桃色, 色, 桃色电影, 色电影, 电影]', 3);
INSERT INTO `t_comment` VALUES (39809, '嘿嘿，来学习了', 'https://qh.qlogo.cn/g?b=sdk&ek=AQIb5Iw5lb29KibtpYL3GZW65yqPmgiannWDcl0fFxJVBJRG3muia5f852xwGwtn3iatJ4tzLaGO&s=100&t=1678339190', 'Tidal Locked', '546027907@qq.com', 'www.tidallocked.cn', '/article/30', '2024-03-04 19:43:58', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39810, '欢迎欢迎😎', 'https://qh.qlogo.cn/g?b=sdk&ek=AQAJ99lfkKA9TldbMpTOicsyfib30JOuNnqdaFehfOzYz8qEQo3f7JbY24mCKYoZ5meJibLeuDq&s=100&t=1681803828', '犬小哈', '871361652@qq.com', NULL, '/article/30', '2024-03-04 21:42:54', 0, 39809, 39809, '', 2);
INSERT INTO `t_comment` VALUES (39811, '水水水水是', 'https://qh.qlogo.cn/g?b=sdk&ek=AQGsZu7ic3lRYKonjusqpUV0I8fjfTwqKgxEaoCDxicfeKz08KgbsfpicCCWF3iaCG4OWdRrpDT4&s=100&t=1666745796', '...', '1048636355@qq.com', NULL, '/article/19', '2024-03-05 15:43:41', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39812, '你好', 'https://qh.qlogo.cn/g?b=sdk&ek=AQAJ99lfkKA9TldbMpTOicsyfib30JOuNnqdaFehfOzYz8qEQo3f7JbY24mCKYoZ5meJibLeuDq&s=100&t=1681803828', '犬小哈', '871361652@qq.com', NULL, '/article/18', '2024-03-06 12:57:21', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39813, '观望🤑', 'https://qh.qlogo.cn/g?b=sdk&ek=AQDW4PNnLEibrRIicSnnZZrBD2siaNCiaiaQec1LEccHQRM7IJun9EAoLh4vU0iasibTHjTKbCFic1VC&s=100&t=1593000563', '璞暮', '2497097679@qq.com', NULL, '/article/30', '2024-03-06 13:41:56', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39814, '欢迎欢迎😎', 'https://qh.qlogo.cn/g?b=sdk&ek=AQAJ99lfkKA9TldbMpTOicsyfib30JOuNnqdaFehfOzYz8qEQo3f7JbY24mCKYoZ5meJibLeuDq&s=100&t=1681803828', '犬小哈', '871361652@qq.com', NULL, '/article/30', '2024-03-07 11:52:30', 0, 39813, 39813, '', 2);
INSERT INTO `t_comment` VALUES (39815, '你好呀', 'https://qh.qlogo.cn/g?b=sdk&ek=AQSXfx2EArIJFhANNlctKzHuVnxMmcVmrzOoicPK5wCsscok4SovmHBriccEtUgw&s=100&t=0', '大侠玩', '123123@qq.com', 'dadiaoshang.cn', '/article/19', '2024-03-07 17:27:49', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39816, '你好你好😃😃', 'https://qh.qlogo.cn/g?b=sdk&ek=AQAJ99lfkKA9TldbMpTOicsyfib30JOuNnqdaFehfOzYz8qEQo3f7JbY24mCKYoZ5meJibLeuDq&s=100&t=1681803828', '犬小哈', '871361652@qq.com', NULL, '/article/19', '2024-03-07 17:39:03', 0, 39815, 39815, '', 2);
INSERT INTO `t_comment` VALUES (39817, 'hello', NULL, 'cc', '911682038@qq.com', NULL, '/article/19', '2024-03-08 15:12:54', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39818, '头像和昵称可以自动获取了😃', 'https://qh.qlogo.cn/g?b=sdk&ek=AQCCUxlJ6SzcyLnoceicwiaOoqHLfHPDJ48xj7dsbLzfP3LPC0YFw9ibWW1UaIicy2vIIZvUpLDf&s=100&t=1690161385', '野比大雄', '157334473@qq.com', NULL, '/article/30', '2024-03-09 09:33:46', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39820, '测试', 'https://qh.qlogo.cn/g?b=sdk&ek=AQBUQKkFA7UrUL5sIP8VTibibVniayibtYhEicAe0Syp8mHx0vvMMxgUcJ5LibMYSfLg39kpoibg4BQ&s=100&t=1659602885', '　', '2114199243@qq.com', NULL, '/article/19', '2024-03-10 13:52:05', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39821, '哈喽😜', 'https://qh.qlogo.cn/g?b=sdk&ek=AQS3IEkbYQ55WlrEMibmzSWeW79E2swWJIB2DSe41RQYWb3N0wR8NRzxcU2o3O4iaP1K0mvPRp&s=100&t=1681803828', '犬小哈', '871361652@qq.com', NULL, '/article/19', '2024-03-10 13:56:56', 0, 39817, 39817, '', 2);
INSERT INTO `t_comment` VALUES (39822, '哈总太强了', 'https://qh.qlogo.cn/g?b=sdk&ek=AQQSjTPtHJy2AJA2lfaSib73WqiajxVhFQDlmRFqK6W0JEBnfcN7fiaxeKDLOwHUYMwvshQoHdia&s=100&t=1672408857', '土木三班许同学', '2652446158@qq.com', NULL, '/article/30', '2024-03-10 18:32:05', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39823, '冲冲冲😎', 'https://qh.qlogo.cn/g?b=sdk&ek=AQS3IEkbYQ55WlrEMibmzSWeW79E2swWJIB2DSe41RQYWb3N0wR8NRzxcU2o3O4iaP1K0mvPRp&s=100&t=1681803828', '犬小哈', '871361652@qq.com', NULL, '/article/30', '2024-03-10 20:09:40', 0, 39822, 39822, '', 2);
INSERT INTO `t_comment` VALUES (39824, '测试测试测试测试', 'https://qh.qlogo.cn/g?b=sdk&ek=AQM1ATzuP5Vt3vGqoJrTMLFyBickxUu3lM6tXU93tMBVNsWAGox6Ie76YBhARrg&s=100&t=0', 'ken', '123123@qq.com21321', '32132', '/article/19', '2024-03-12 16:55:58', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39825, '123', 'https://qh.qlogo.cn/g?b=sdk&ek=AQM1ATzuP5Vt3vGqoJrTMLFyBickxUu3lM6tXU93tMBVNsWAGox6Ie76YBhARrg&s=100&t=0', 'k1en', '123123@qq.com21321', '32132', '/article/19', '2024-03-12 16:56:04', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39826, '太好了，肝起来', 'https://qh.qlogo.cn/g?b=sdk&ek=AQWLmltnMzmBRaS09wFibd45TUA1dpr84SDeRs7LMuLhxpRugiaa0ITicalicgPLvUFhdO8Top7ib&s=100&t=1589598049', '程程の强哥', '3267568158@qq.com', NULL, '/article/30', '2024-03-13 09:08:20', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39832, '测试测试测试测试：我来过（证明：xxxxxx）', 'https://qh.qlogo.cn/g?b=sdk&ek=AQKDBD5mYnbtGGo4YxeMQr1ksNgHgGEmdkjk85fQegfia9p4Om0tVF5xfGfO5qqTMZic1dTtzm&s=100&t=1677412015', 'star dream', '2435556127@qq.com', NULL, '/article/19', '2024-03-14 12:35:54', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39833, '2333', NULL, '233', '1239855213@qq.com', NULL, '/wiki/8?articleId=18', '2024-03-14 13:54:04', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39851, '这么先进！！！', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2459650517&spec=100', 'horizon', '2459650517@qq.com', NULL, '/article/19', '2024-03-18 17:50:51', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39852, '太秀了', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2459650517&spec=100', 'horizon', '2459650517@qq.com', NULL, '/article/19', '2024-03-18 17:51:04', 0, 39851, 39851, '', 2);
INSERT INTO `t_comment` VALUES (39853, '哈哈😜', 'https://qh.qlogo.cn/g?b=sdk&ek=AQS3IEkbYQ55WlrEMibmzSWeW79E2swWJIB2DSe41RQYWb3N0wR8NRzxcU2o3O4iaP1K0mvPRp&s=100&t=1681803828', '犬小哈', '871361652@qq.com', NULL, '/article/19', '2024-03-18 18:06:10', 0, 39852, 39851, '', 2);
INSERT INTO `t_comment` VALUES (39854, 'test', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1061870652&spec=100', '小朋友', '1061870652@qq.com', 'www.baidu.com', '/article/19', '2024-03-19 16:18:27', 0, NULL, NULL, '系统拦截，包含敏感词：[test, test, test, test, test, test]', 3);
INSERT INTO `t_comment` VALUES (39855, '测试一下，求个回复🙏', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1061870652&spec=100', '小朋友', '1340768746@qq.com', 'www.baidu.com', '/article/19', '2024-03-19 16:19:32', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39856, '不错', 'https://q1.qlogo.cn/headimg_dl?dst_uin=751647235&spec=100', '梦想de天空', '751647235@qq.com', NULL, '/article/29', '2024-03-20 00:12:12', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39857, '也一样', 'https://q1.qlogo.cn/headimg_dl?dst_uin=751647235&spec=100', '梦想de天空', '751647235@qq.com', NULL, '/article/29', '2024-03-20 00:12:29', 0, 39856, 39856, '', 2);
INSERT INTO `t_comment` VALUES (39858, '听音乐', 'https://q1.qlogo.cn/headimg_dl?dst_uin=751647235&spec=100', '梦想de天空', '751647235@qq.com', NULL, '/article/29', '2024-03-20 00:12:40', 0, 39857, 39856, '', 2);
INSERT INTO `t_comment` VALUES (39859, '来了来了😎', 'https://qh.qlogo.cn/g?b=sdk&ek=AQS3IEkbYQ55WlrEMibmzSWeW79E2swWJIB2DSe41RQYWb3N0wR8NRzxcU2o3O4iaP1K0mvPRp&s=100&t=1681803828', '犬小哈', '871361652@qq.com', NULL, '/article/19', '2024-03-20 14:28:58', 0, 39855, 39855, '', 2);
INSERT INTO `t_comment` VALUES (39862, 'eeeee', 'https://q2.qlogo.cn/headimg_dl?dst_uin=111111&spec=100', '111111', '111111@qq.com', NULL, '/article/18', '2024-03-22 10:39:10', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39870, '11', 'https://q1.qlogo.cn/headimg_dl?dst_uin=122900975&spec=100', '玫瑰暗号', '122900975@qq.com', NULL, '/article/29', '2024-03-26 16:39:34', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39871, '测试：求个黄色网址', 'https://qh.qlogo.cn/g?b=sdk&ek=AQS3IEkbYQ55WlrEMibmzSWeW79E2swWJIB2DSe41RQYWb3N0wR8NRzxcU2o3O4iaP1K0mvPRp&s=100&t=1681803828', '犬小哈', '871361652@qq.com', NULL, '/article/17', '2024-03-27 15:35:00', 0, NULL, NULL, '系统拦截，包含敏感词：[黄色, 网址]', 3);
INSERT INTO `t_comment` VALUES (39872, '厉害了', 'https://q1.qlogo.cn/headimg_dl?dst_uin=1109409271&spec=100', 'n', '1109409271@qq.com', NULL, '/article/19', '2024-03-27 16:12:31', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39873, '牛逼', NULL, 'asd', 'asdasda@sad.com', 'adasda.com', '/article/19', '2024-03-28 14:32:09', 0, NULL, NULL, '系统拦截，包含敏感词：[牛逼]', 3);
INSERT INTO `t_comment` VALUES (39874, '测试一下', NULL, 'asd', 'asdasda@sad.com', 'adasda.com', '/article/19', '2024-03-28 14:32:21', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39875, '冲冲冲😜', 'https://qh.qlogo.cn/g?b=sdk&ek=AQS3IEkbYQ55WlrEMibmzSWeW79E2swWJIB2DSe41RQYWb3N0wR8NRzxcU2o3O4iaP1K0mvPRp&s=100&t=1681803828', '犬小哈', '871361652@qq.com', NULL, '/article/19', '2024-03-28 14:33:54', 0, 39872, 39872, '', 2);
INSERT INTO `t_comment` VALUES (39876, '加个点赞功能吧，不然不知道怎么回了😁', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1109409271&spec=100', 'n', '1109409271@qq.com', NULL, '/article/19', '2024-03-29 09:35:31', 0, 39875, 39872, '', 2);
INSERT INTO `t_comment` VALUES (39877, '测试\n🙈', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1145413114&spec=100', '沐晴', '1145413114@qq.com', NULL, '/article/17', '2024-03-29 17:40:55', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39878, '你好', 'https://q1.qlogo.cn/headimg_dl?dst_uin=122789598&spec=100', '9', '122789598@qq.com', NULL, '/article/19', '2024-03-30 14:34:01', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39879, '你好', 'https://q1.qlogo.cn/headimg_dl?dst_uin=122789598&spec=100', '9', '122789598@qq.com', NULL, '/article/19', '2024-03-30 14:34:07', 0, 39878, 39878, '', 2);
INSERT INTO `t_comment` VALUES (39880, '你好', 'https://q1.qlogo.cn/headimg_dl?dst_uin=122789598&spec=100', '9', '122789598@qq.com', NULL, '/article/19', '2024-03-30 14:34:11', 0, 39878, 39878, '', 2);
INSERT INTO `t_comment` VALUES (39881, 'hello😎', 'https://q3.qlogo.cn/headimg_dl?dst_uin=871361652&spec=100', '犬小哈', '871361652@qq.com', NULL, '/article/19', '2024-03-30 21:21:55', 0, 39880, 39878, '', 2);
INSERT INTO `t_comment` VALUES (39882, '还能这样玩', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1178041677&spec=100', '指尖年华', '1178041677@qq.com', NULL, '/article/30', '2024-04-02 12:56:47', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39883, '猜猜我是谁', 'https://q3.qlogo.cn/headimg_dl?dst_uin=12345678&spec=100', '猜猜我是谁', '12345678@qq.com', NULL, '/article/30', '2024-04-02 12:57:16', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39884, '666', 'https://q3.qlogo.cn/headimg_dl?dst_uin=3131654763&spec=100', '折扇', '3131654763@qq.com', NULL, '/article/30', '2024-04-03 15:21:39', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39885, '666', 'https://q3.qlogo.cn/headimg_dl?dst_uin=3131654763&spec=100', '折扇', '3131654763@qq.com', 'liqing.online', '/article/30', '2024-04-03 15:22:01', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39886, '2134567890-', 'https://q3.qlogo.cn/headimg_dl?dst_uin=1216621942&spec=100', '寒', '1216621942@qq.com', NULL, '/article/30', '2024-04-03 17:26:54', 0, NULL, NULL, '系统拦截，包含敏感词：[2134567890]', 3);
INSERT INTO `t_comment` VALUES (39887, '2134567890', 'https://q3.qlogo.cn/headimg_dl?dst_uin=1216621942&spec=100', '寒', '1216621942@qq.com', NULL, '/article/30', '2024-04-03 17:26:58', 0, NULL, NULL, '系统拦截，包含敏感词：[2134567890]', 3);
INSERT INTO `t_comment` VALUES (39888, '测试测试', 'https://q3.qlogo.cn/headimg_dl?dst_uin=1216621942&spec=100', '寒', '1216621942@qq.com', NULL, '/article/30', '2024-04-03 17:27:04', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39889, 'fa', NULL, 'ff', '123@qq.com', 'ff', '/article/19', '2024-04-04 11:48:56', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39890, '1231', NULL, '12345678@163.com', '12345678@163.com', '12', '/article/19', '2024-04-06 13:26:02', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39895, 'six', 'https://q3.qlogo.cn/headimg_dl?dst_uin=1099953500&spec=140', '梨㏒花香℡为谁㏑狂♡', '1099953500@qq.com', NULL, '/article/30', '2024-04-08 01:06:58', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39896, '测试评论', NULL, 'vdg', '3466691923@qq.com', NULL, '/article/19', '2024-04-08 09:35:27', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39897, '123', 'https://q4.qlogo.cn/headimg_dl?dst_uin=13123&spec=140', '321313131', '13123@qq.com', '131312', '/article/19', '2024-04-08 14:25:44', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39898, '123312', 'https://q4.qlogo.cn/headimg_dl?dst_uin=13123&spec=140', '321313131', '13123@qq.com', '131312', '/article/19', '2024-04-08 14:25:51', 0, 39897, 39897, '', 2);
INSERT INTO `t_comment` VALUES (39899, '测试', 'https://q4.qlogo.cn/headimg_dl?dst_uin=180449556&spec=140', '报雪API', '180449556@qq.com', 'www.bxcoder.cn', '/article/19', '2024-04-08 16:55:05', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39900, '测试', 'https://q4.qlogo.cn/headimg_dl?dst_uin=180449556&spec=140', '报雪API', '180449556@qq.com', 'www.bxcoder.cn', '/article/19', '2024-04-08 17:01:04', 0, 39899, 39899, '', 2);
INSERT INTO `t_comment` VALUES (39901, '666😃', NULL, 'pure love', '1457258842@qq.com', NULL, '/article/19', '2024-04-08 18:59:08', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39902, '2333', NULL, 'pure love', '1457258842@qq.com', NULL, '/article/19', '2024-04-08 18:59:22', 0, 39901, 39901, '', 2);
INSERT INTO `t_comment` VALUES (39903, '3335', NULL, 'pure love', '1457258842@qq.com', NULL, '/article/19', '2024-04-08 18:59:32', 0, 39902, 39901, '', 2);
INSERT INTO `t_comment` VALUES (39904, '测试🤏🤡🙏💯😂', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1848713053&spec=140', '在小才', '1848713053@qq.com', 'kinguo.fun', '/article/19', '2024-04-09 08:37:19', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39905, '测试', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1848713053&spec=140', '在小才', '1848713053@qq.com', 'kinguo.fun', '/article/19', '2024-04-09 08:40:19', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39906, '测试', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1848713053&spec=140', '在小才', '1848713053@qq.com', 'kinguo.fun', '/article/19', '2024-04-09 08:40:21', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39907, '测试', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1848713053&spec=140', '在小才', '1848713053@qq.com', 'kinguo.fun', '/article/19', '2024-04-09 08:40:24', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39908, '没有防刷吗？？', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1848713053&spec=140', '在小才', '1848713053@qq.com', 'kinguo.fun', '/article/19', '2024-04-09 08:40:34', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39909, '目前还没加防刷哈，后续追加一波😃', 'https://q3.qlogo.cn/headimg_dl?dst_uin=871361652&spec=100', '犬小哈', '871361652@qq.com', NULL, '/article/19', '2024-04-09 15:25:55', 0, 39908, 39908, '', 2);
INSERT INTO `t_comment` VALUES (39910, '测试', 'https://q4.qlogo.cn/headimg_dl?dst_uin=863533651&spec=140', '鍾意.', '863533651@qq.com', NULL, '/article/19', '2024-04-10 13:42:24', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39911, '这么牛啊，输入qq号自己把头像采集过来了。', 'https://q4.qlogo.cn/headimg_dl?dst_uin=863533651&spec=140', '鍾意.', '863533651@qq.com', NULL, '/article/19', '2024-04-10 13:42:47', 0, NULL, NULL, '系统拦截，包含敏感词：[qq]', 3);
INSERT INTO `t_comment` VALUES (39912, '这么牛啊，输入企鹅号自己把头像采集过来了。', 'https://q4.qlogo.cn/headimg_dl?dst_uin=863533651&spec=140', '鍾意.', '863533651@qq.com', NULL, '/article/19', '2024-04-10 13:42:56', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39913, 'wow', 'https://q3.qlogo.cn/headimg_dl?dst_uin=834872499&spec=140', '仙人掌', '834872499@qq.com', NULL, '/article/18', '2024-04-10 16:15:30', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39914, '问问', 'https://q1.qlogo.cn/headimg_dl?dst_uin=122971610&spec=140', '凯', '122971610@qq.com', '12', '/article/17', '2024-04-11 15:08:09', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39915, '测试', 'https://q1.qlogo.cn/headimg_dl?dst_uin=122971610&spec=140', '凯', '122971610@qq.com', '12', '/article/17', '2024-04-11 15:08:15', 0, 80, 79, '', 2);
INSERT INTO `t_comment` VALUES (39916, '测试发一个漂流瓶😃', NULL, 'Mr.陈', '1792242597@qq.com', NULL, '/article/30', '2024-04-12 16:37:46', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39917, '测试', 'https://qh.qlogo.cn/g?b=sdk&ek=AQTbQEPmyPmOib372gopp7lZjUiaQOlezHFMEd6r88lUhfd4aL8PVO5ZgxKlcJeRDPmLPekBG8&s=100&t=1675329160', '沐', '3388616682@qq.com', '11', '/article/19', '2024-04-12 18:39:10', 0, 23, 23, '', 2);
INSERT INTO `t_comment` VALUES (39918, '123', 'https://qh.qlogo.cn/g?b=sdk&ek=AQTbQEPmyPmOib372gopp7lZjUiaQOlezHFMEd6r88lUhfd4aL8PVO5ZgxKlcJeRDPmLPekBG8&s=100&t=1675329160', '沐', '3388616682@qq.com', '11', '/article/19', '2024-04-12 18:39:29', 0, 39917, 23, '', 2);
INSERT INTO `t_comment` VALUES (39919, '111', NULL, '22', '1656298474@qq.com', NULL, '/article/29', '2024-04-12 22:10:29', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39920, '🤡', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1656298474&spec=140', ':-D', '1656298474@qq.com', NULL, '/article/19', '2024-04-14 12:16:05', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39921, '🙈', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1296920555&spec=140', '𝐶', '1296920555@qq.com', NULL, '/article/19', '2024-04-14 19:10:46', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39922, '666', 'https://q2.qlogo.cn/headimg_dl?dst_uin=819613071&spec=140', '五哥', '819613071@qq.com', NULL, '/article/19', '2024-04-16 21:54:00', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39923, '测试测试', 'https://q1.qlogo.cn/headimg_dl?dst_uin=3126808313&spec=140', '记得恰饭', '3126808313@qq.com', 'http://xuancangmenpro.online/island', '/article/30', '2024-04-17 17:47:46', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39924, '牛逼', 'https://q1.qlogo.cn/headimg_dl?dst_uin=3126808313&spec=140', '记得恰饭', '3126808313@qq.com', 'http://xuancangmenpro.online/island', '/article/31', '2024-04-17 17:52:53', 0, NULL, NULL, '系统拦截，包含敏感词：[牛逼]', 3);
INSERT INTO `t_comment` VALUES (39925, '厉害', 'https://q1.qlogo.cn/headimg_dl?dst_uin=3126808313&spec=140', '记得恰饭', '3126808313@qq.com', 'http://xuancangmenpro.online/island', '/article/31', '2024-04-17 17:52:58', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39926, '哈哈哈', 'https://q1.qlogo.cn/headimg_dl?dst_uin=3309710178&spec=140', '卡尔斯草莓农场', '3309710178@qq.com', NULL, '/article/30', '2024-04-18 11:10:18', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39927, '回复测试', 'https://q1.qlogo.cn/headimg_dl?dst_uin=3309710178&spec=140', '卡尔斯草莓农场', '3309710178@qq.com', NULL, '/article/30', '2024-04-18 11:10:41', 0, 39926, 39926, '', 2);
INSERT INTO `t_comment` VALUES (39928, '回复一下', 'https://q1.qlogo.cn/headimg_dl?dst_uin=3309710178&spec=140', '卡尔斯草莓农场', '3309710178@qq.com', NULL, '/article/30', '2024-04-18 11:10:50', 0, 39927, 39926, '', 2);
INSERT INTO `t_comment` VALUES (39929, 'kjj', 'https://q1.qlogo.cn/headimg_dl?dst_uin=183054634&spec=140', '韩梦', '183054634@qq.com', NULL, '/article/30', '2024-04-18 23:14:45', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39930, 'wfwefe', 'https://q1.qlogo.cn/headimg_dl?dst_uin=183054634&spec=140', '韩梦', '183054634@qq.com', NULL, '/article/30', '2024-04-18 23:14:58', 0, 39929, 39929, '', 2);
INSERT INTO `t_comment` VALUES (39931, 'kkj', 'https://q1.qlogo.cn/headimg_dl?dst_uin=183054634&spec=140', '韩梦', '183054634@qq.com', NULL, '/article/30', '2024-04-18 23:15:05', 0, 39888, 39888, '', 2);
INSERT INTO `t_comment` VALUES (39932, '不错', NULL, 'HuangHun', '2319892905@qq.com', 'www.huanghun.love', '/article/17', '2024-04-19 14:19:11', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39933, '6', NULL, 'HuangHun', '2319892905@qq.com', 'www.huanghun.love', '/article/19', '2024-04-19 14:26:31', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39934, '123', NULL, 'HuangHun', '2319892905@qq.com', 'www.huanghun.love', '/article/19', '2024-04-19 14:30:44', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39935, '123', NULL, '123', '123@qq.com', NULL, '/article/19', '2024-04-20 22:38:01', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39936, '123', NULL, '1234', '123456@qq.com', NULL, '/article/19', '2024-04-24 01:31:14', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39937, '123', NULL, '1234', '123456@qq.com', NULL, '/article/19', '2024-04-24 01:31:14', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39938, '🤡', 'https://qh.qlogo.cn/g?b=sdk&ek=AQCCUxlJ6SzcyLnoceicwiaOoqHLfHPDJ48xj7dsbLzfP3LPC0YFw9ibWW1UaIicy2vIIZvUpLDf&s=100&t=1690161385', '野比大雄', '157334473@qq.com', NULL, '/article/19', '2024-04-24 14:14:03', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39939, 'CE', NULL, 'WDAWD', 'DWAD@QQ.COM', 'DWAD', '/article/30', '2024-04-25 11:57:26', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39940, '酷炫', 'https://q1.qlogo.cn/headimg_dl?dst_uin=1551477330&spec=140', '没试过怎么知道', '1551477330@qq.com', NULL, '/article/30', '2024-04-28 09:02:38', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39941, '酷炫', 'https://q1.qlogo.cn/headimg_dl?dst_uin=1551477330&spec=140', '没试过怎么知道', '1551477330@qq.com', NULL, '/article/30', '2024-04-28 09:02:38', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39942, '哈总真棒', 'https://q1.qlogo.cn/headimg_dl?dst_uin=1551477330&spec=140', '没试过怎么知道', '1551477330@qq.com', NULL, '/article/19', '2024-04-28 09:05:44', 0, 22, 22, '', 2);
INSERT INTO `t_comment` VALUES (39943, '那么神奇？', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2374234745&spec=140', '瑞幸的冰都化了', '2374234745@qq.com', NULL, '/article/18', '2024-04-28 11:37:30', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39944, '😃', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1843105341&spec=140', '陈住气💫', '1843105341@qq.com', '', '/article/19', '2024-04-28 17:10:26', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39945, '😃试一下', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1843105341&spec=140', '陈住气💫', '1843105341@qq.com', '', '/article/19', '2024-04-28 17:10:31', 0, 39944, 39944, '', 2);
INSERT INTO `t_comment` VALUES (39946, '111', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1843105341&spec=140', '陈住气💫', '1843105341@qq.com', '', '/article/19', '2024-04-28 17:10:50', 0, 39922, 39922, '', 2);
INSERT INTO `t_comment` VALUES (39947, '试一下', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1843105341&spec=140', '陈住气💫', '1843105341@qq.com', '', '/article/19', '2024-04-28 17:11:04', 0, 39935, 39935, '', 2);
INSERT INTO `t_comment` VALUES (39948, '🥳', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1843105341&spec=140', '陈住气💫', '1843105341@qq.com', '', '/article/19', '2024-04-28 17:11:16', 0, 39938, 39938, '', 2);
INSERT INTO `t_comment` VALUES (39949, 'QAQ', 'https://q1.qlogo.cn/headimg_dl?dst_uin=2073139454&spec=140', '圣光魔坍体之幻世重生', '2073139454@qq.com', NULL, '/article/18', '2024-04-29 09:42:32', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39950, '黑盒测试', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1843105341&spec=140', '陈住气💫', '1843105341@qq.com', '', '/article/19', '2024-05-05 16:18:27', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39951, '测试', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1843105341&spec=140', '陈住气💫', '1843105341@qq.com', '', '/article/30', '2024-05-05 16:24:32', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (39952, '6', 'https://q4.qlogo.cn/headimg_dl?dst_uin=916190647&spec=140', '、', '916190647@qq.com', NULL, '/article/19', '2024-05-08 14:04:02', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43123, 'ce', 'https://q3.qlogo.cn/headimg_dl?dst_uin=2434981500&spec=140', '涟漪.', '2434981500@qq.com', NULL, '/article/30', '2024-05-08 14:30:34', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43124, '11', NULL, 'fwe', '3489619487@qq.com', '222', '/article/17', '2024-05-08 16:30:17', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43125, '？👌👌👌👌👌', NULL, 'yfl', 'yfl@qq.com', NULL, '/article/30', '2024-05-08 17:40:04', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43126, 'hhhh', NULL, 'yfl', 'yfl@qq.com', NULL, '/article/30', '2024-05-08 17:40:14', 0, 43125, 43125, '', 2);
INSERT INTO `t_comment` VALUES (43127, '测试测试', 'https://q3.qlogo.cn/headimg_dl?dst_uin=2775632815&spec=140', '绳君航', '2775632815@qq.com', NULL, '/article/30', '2024-05-09 15:51:02', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43128, '的方式', NULL, '发生的', '4234@423.com', '范德萨', '/article/30', '2024-05-09 16:13:15', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43129, '厉害', 'https://q4.qlogo.cn/headimg_dl?dst_uin=3126808313&spec=140', '泓锦', '3126808313@qq.com', 'baidu.com', '/article/31', '2024-05-09 21:43:00', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43130, '测试一下', 'https://q4.qlogo.cn/headimg_dl?dst_uin=292890729&spec=140', '逗逗乐', '292890729@qq.com', NULL, '/article/30', '2024-05-10 17:06:42', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43131, '11', NULL, '111', '11@qq.com', '1', '/article/19', '2024-05-12 21:31:43', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43132, '哈老板跑去哪里偷懒了，好几天没更新了', NULL, '小鑫', '1761260896@qq.com', NULL, '/article/19', '2024-05-13 15:33:03', 0, NULL, NULL, '系统拦截，包含敏感词：[老板]', 3);
INSERT INTO `t_comment` VALUES (43133, '哈老板跑去哪里偷懒了，好几天没更新了', NULL, '小鑫', '1761260896@qq.com', NULL, '/article/19', '2024-05-13 15:33:07', 0, NULL, NULL, '系统拦截，包含敏感词：[老板]', 3);
INSERT INTO `t_comment` VALUES (43134, '哈老板跑去哪里浪了，好几天没更新了', NULL, '小鑫', '1761260896@qq.com', NULL, '/article/19', '2024-05-13 15:33:27', 0, NULL, NULL, '系统拦截，包含敏感词：[老板]', 3);
INSERT INTO `t_comment` VALUES (43135, '哈老板走丢了吗，好几天没更新了', NULL, '小鑫', '1761260896@qq.com', NULL, '/article/19', '2024-05-13 15:33:51', 0, NULL, NULL, '系统拦截，包含敏感词：[老板]', 3);
INSERT INTO `t_comment` VALUES (43136, '哈老板，好几天没更新了', NULL, '小鑫', '1761260896@qq.com', NULL, '/article/19', '2024-05-13 15:34:03', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43137, '这两天有点事，明天开更哈~😂', 'https://q3.qlogo.cn/headimg_dl?dst_uin=871361652&spec=100', '犬小哈', '871361652@qq.com', NULL, '/article/19', '2024-05-13 21:48:17', 0, 43136, 43136, '', 2);
INSERT INTO `t_comment` VALUES (43138, '测试评论', 'https://q1.qlogo.cn/headimg_dl?dst_uin=3143687356&spec=140', '快乐哈士奇', '3143687356@qq.com', NULL, '/article/30', '2024-05-14 09:40:35', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43139, '今天的更新那', 'https://q2.qlogo.cn/headimg_dl?dst_uin=3139402997&spec=140', '往日随风', '3139402997@qq.com', NULL, '/article/19', '2024-05-14 13:28:15', 0, 43137, 43136, '', 2);
INSERT INTO `t_comment` VALUES (43140, '测试评论是否存在问题', 'https://q2.qlogo.cn/headimg_dl?dst_uin=3139402997&spec=140', '往日随风', '3139402997@qq.com', NULL, '/article/19', '2024-05-14 13:30:55', 0, 43139, 43136, '', 2);
INSERT INTO `t_comment` VALUES (43141, '有评论但是没有办法删除自己发的评论', 'https://q2.qlogo.cn/headimg_dl?dst_uin=3139402997&spec=140', '往日随风', '3139402997@qq.com', NULL, '/article/19', '2024-05-14 13:31:49', 0, 43137, 43136, '', 2);
INSERT INTO `t_comment` VALUES (43142, '测试', 'https://q2.qlogo.cn/headimg_dl?dst_uin=3139402997&spec=140', '往日随风', '3139402997@qq.com', NULL, '/article/19', '2024-05-14 13:39:47', 0, 43141, 43136, '', 2);
INSERT INTO `t_comment` VALUES (43143, '目前还没有添加删评论的功能哈~', 'https://q3.qlogo.cn/headimg_dl?dst_uin=871361652&spec=100', '犬小哈', '871361652@qq.com', NULL, '/article/19', '2024-05-14 14:05:26', 0, 43141, 43136, '', 2);
INSERT INTO `t_comment` VALUES (43144, '评论功能存在BUG，已提交到知识星球上了', 'https://q2.qlogo.cn/headimg_dl?dst_uin=3139402997&spec=140', '往日随风', '3139402997@qq.com', NULL, '/article/19', '2024-05-14 14:07:33', 0, 43143, 43136, '系统拦截，包含敏感词：[论功]', 3);
INSERT INTO `t_comment` VALUES (43145, '评论功能存在问题，已提交到知识星球上了', 'https://q2.qlogo.cn/headimg_dl?dst_uin=3139402997&spec=140', '往日随风', '3139402997@qq.com', NULL, '/article/19', '2024-05-14 14:07:42', 0, 43143, 43136, '系统拦截，包含敏感词：[论功]', 3);
INSERT INTO `t_comment` VALUES (43146, '评论功能存在问题，已提交到星球上了', 'https://q2.qlogo.cn/headimg_dl?dst_uin=3139402997&spec=140', '往日随风', '3139402997@qq.com', NULL, '/article/19', '2024-05-14 14:07:48', 0, 43143, 43136, '系统拦截，包含敏感词：[论功]', 3);
INSERT INTO `t_comment` VALUES (43147, '功能存在问题，已提交到星球上了', 'https://q2.qlogo.cn/headimg_dl?dst_uin=3139402997&spec=140', '往日随风', '3139402997@qq.com', NULL, '/article/19', '2024-05-14 14:07:54', 0, 43143, 43136, '', 2);
INSERT INTO `t_comment` VALUES (43148, '太酷了', 'https://q1.qlogo.cn/headimg_dl?dst_uin=10001&spec=140', 'pony', '10001@qq.com', NULL, '/article/19', '2024-05-14 16:42:15', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43149, '测试', 'https://q4.qlogo.cn/headimg_dl?dst_uin=871361652&spec=140', '犬小哈', '871361652@qq.com', NULL, '/article/17', '2024-05-15 09:15:44', 0, 43124, 43124, '', 2);
INSERT INTO `t_comment` VALUES (43150, '1111', NULL, '799612292', '799612292@qq.com', NULL, '/article/17', '2024-05-15 11:02:28', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43151, '111', 'https://q4.qlogo.cn/headimg_dl?dst_uin=952916907&spec=140', 'kang', '952916907@qq.com', NULL, '/article/17', '2024-05-15 23:11:40', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43152, '333', 'https://q4.qlogo.cn/headimg_dl?dst_uin=952916907&spec=140', 'kang', '952916907@qq.com', NULL, '/article/17', '2024-05-15 23:11:46', 0, 43151, 43151, '', 2);
INSERT INTO `t_comment` VALUES (43153, '66', 'https://q1.qlogo.cn/headimg_dl?dst_uin=2210212006&spec=140', '``Wning.', '2210212006@qq.com', NULL, '/article/30', '2024-05-16 10:58:15', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43154, '66', 'https://q1.qlogo.cn/headimg_dl?dst_uin=2210212006&spec=140', '``Wning.', '2210212006@qq.com', NULL, '/article/30', '2024-05-16 10:58:15', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43155, '66', 'https://q1.qlogo.cn/headimg_dl?dst_uin=2210212006&spec=140', '``Wning.', '2210212006@qq.com', NULL, '/article/30', '2024-05-16 10:58:15', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43156, '留一个脚印', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1013198653&spec=140', 'Rainsliogh', '1013198653@qq.com', NULL, '/article/19', '2024-05-17 09:47:16', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43157, '333', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1852676265&spec=140', '惜欢你', '1852676265@qq.com', '', '/article/18', '2024-05-17 17:16:34', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43158, 'iii', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1852676265&spec=140', '惜欢你', '1852676265@qq.com', '', '/article/18', '2024-05-17 17:23:30', 0, 43157, 43157, '', 2);
INSERT INTO `t_comment` VALUES (43159, 'iiiv', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1852676265&spec=140', '惜欢你', '1852676265@qq.com', '', '/article/18', '2024-05-17 17:23:34', 0, 43158, 43157, '', 2);
INSERT INTO `t_comment` VALUES (43160, 'iii', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1852676265&spec=140', '惜欢你', '1852676265@qq.com', '', '/article/18', '2024-05-17 17:23:43', 0, 43159, 43157, '', 2);
INSERT INTO `t_comment` VALUES (43161, '日常', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1852676265&spec=140', '惜欢你', '1852676265@qq.com', '', '/article/18', '2024-05-17 17:23:54', 0, 43158, 43157, '', 2);
INSERT INTO `t_comment` VALUES (43162, '给他', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1852676265&spec=140', '惜欢你', '1852676265@qq.com', '', '/article/18', '2024-05-17 17:24:02', 0, 75, 73, '', 2);
INSERT INTO `t_comment` VALUES (43163, 'niaho1', NULL, '11', '1554545@qq.com', '11.com', '/article/29', '2024-05-19 16:15:58', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43164, '1111', 'https://q1.qlogo.cn/headimg_dl?dst_uin=2539302212&spec=140', '123', 'cmk0820@qq.com', 'www.baidu.com', '/article/30', '2024-05-19 21:39:59', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43165, 'hhhh', 'https://q1.qlogo.cn/headimg_dl?dst_uin=2539302212&spec=140', '不回头的人', '2539302212@qq.com', 'www.baidu.com', '/article/19', '2024-05-19 21:41:43', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43166, '😃', 'https://q1.qlogo.cn/headimg_dl?dst_uin=2539302212&spec=140', '不回头的人', '2539302212@qq.com', 'www.baidu.com', '/article/19', '2024-05-19 21:42:28', 0, 43165, 43165, '', 2);
INSERT INTO `t_comment` VALUES (43167, '121212😱', 'https://q1.qlogo.cn/headimg_dl?dst_uin=2539302212&spec=140', '不回头的人', '2539302212@qq.com', 'www.baidu.com', '/article/19', '2024-05-19 21:42:40', 0, 43166, 43165, '', 2);
INSERT INTO `t_comment` VALUES (43168, '1231', 'https://q2.qlogo.cn/headimg_dl?dst_uin=534269718&spec=140', 'cccc', '534269718@qq.com', '', '/article/19', '2024-05-19 21:45:48', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43169, '123123123', 'https://q1.qlogo.cn/headimg_dl?dst_uin=2539302212&spec=140', '00000', '2539302212@qq.com', '', '/article/19', '2024-05-19 21:49:45', 0, NULL, NULL, '系统拦截，包含敏感词：[123123123]', 3);
INSERT INTO `t_comment` VALUES (43170, 'sdasdas', 'https://q1.qlogo.cn/headimg_dl?dst_uin=2539302212&spec=140', '00000', '2539302212@qq.com', '', '/article/19', '2024-05-19 21:49:51', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43171, '测试数据', 'https://q1.qlogo.cn/headimg_dl?dst_uin=2539302212&spec=140', '00000', 'xxxxxxx@qq.com', '', '/article/19', '2024-05-19 21:50:20', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43172, 'hahahaa', 'https://q4.qlogo.cn/headimg_dl?dst_uin=952916907&spec=140', 'kang', '952916907@qq.com', NULL, '/article/17', '2024-05-21 10:24:19', 0, 43151, 43151, '', 2);
INSERT INTO `t_comment` VALUES (43173, '测试测试', 'https://q4.qlogo.cn/headimg_dl?dst_uin=952916907&spec=140', 'kang', '952916907@qq.com', NULL, '/article/17', '2024-05-21 10:49:05', 0, 43151, 43151, '', 2);
INSERT INTO `t_comment` VALUES (43174, '这个功能还不错哦', 'https://q4.qlogo.cn/headimg_dl?dst_uin=494223120&spec=140', '唯一`de.', '494223120@qq.com', NULL, '/article/30', '2024-05-21 15:51:10', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43175, '😃', 'https://q4.qlogo.cn/headimg_dl?dst_uin=954725731&spec=140', '✿͜҉予你稚初م', '954725731@qq.com', NULL, '/article/29', '2024-05-21 16:28:30', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43176, '太酷啦', 'https://q1.qlogo.cn/headimg_dl?dst_uin=17078387&spec=140', '莫离🍃', '17078387@qq.com', NULL, '/article/17', '2024-05-21 16:47:42', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43177, '66666', 'https://q1.qlogo.cn/headimg_dl?dst_uin=3126808313&spec=140', '泓锦', '3126808313@qq.com', 'http://xuancangmenpro.online/', '/wiki/7?articleId=29', '2024-05-22 14:59:16', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43178, '😱🤡😭😱🥵', 'https://q1.qlogo.cn/headimg_dl?dst_uin=3126808313&spec=140', '泓锦', '3126808313@qq.com', 'http://xuancangmenpro.online/', '/article/17', '2024-05-22 15:04:19', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43179, '测试', 'https://q3.qlogo.cn/headimg_dl?dst_uin=871361652&spec=140', '犬小哈', '871361652@qq.com', NULL, '/article/19', '2024-05-22 20:07:42', 0, 39806, 39806, '', 2);
INSERT INTO `t_comment` VALUES (43180, '11', 'https://q1.qlogo.cn/headimg_dl?dst_uin=122971610&spec=140', '凯', '122971610@qq.com', '12', '/wiki/8?articleId=18', '2024-05-24 15:00:22', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43181, '11', 'https://q1.qlogo.cn/headimg_dl?dst_uin=122971610&spec=140', '凯', '122971610@qq.com', '12', '/wiki/8?articleId=18', '2024-05-24 15:00:22', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43182, '121', 'https://q1.qlogo.cn/headimg_dl?dst_uin=122971610&spec=140', '凯', '122971610@qq.com', '12', '/wiki/8?articleId=18', '2024-05-24 15:01:52', 0, 39833, 39833, '', 2);
INSERT INTO `t_comment` VALUES (43183, '收到', 'https://q1.qlogo.cn/headimg_dl?dst_uin=122971610&spec=140', '凯', '122971610@qq.com', '12', '/wiki/8?articleId=18', '2024-05-24 15:01:58', 0, 43182, 39833, '', 2);
INSERT INTO `t_comment` VALUES (43184, '我', 'https://q1.qlogo.cn/headimg_dl?dst_uin=122971610&spec=140', '凯', '122971610@qq.com', '12', '/wiki/8?articleId=18', '2024-05-24 15:02:03', 0, 39833, 39833, '', 2);
INSERT INTO `t_comment` VALUES (43185, '123', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1965380485&spec=140', 'Daydream', '1965380485@qq.com', NULL, '/article/29', '2024-05-28 14:13:52', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43186, '测试回复回复回复回复回复回复回复回复', NULL, '按时吃饭并不难', '115254441@qq.com', NULL, '/article/17', '2024-05-28 17:18:46', 0, 83, 79, '', 2);
INSERT INTO `t_comment` VALUES (43187, '挺好的，完结撒花', NULL, '是小白呀', '2720513064@qq.com', '', '/article/18', '2024-05-29 09:44:19', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43188, '测试', NULL, 'aa da', '1212@qq.com', NULL, '/article/19', '2024-05-30 00:48:17', 0, 39876, 39872, '', 2);
INSERT INTO `t_comment` VALUES (43189, '测试', NULL, 'aa da', '1212@qq.com', NULL, '/article/19', '2024-05-30 00:48:17', 0, 39876, 39872, '', 2);
INSERT INTO `t_comment` VALUES (43190, '你干嘛🙈❤️❤️❤️❤️❤️❤️🤡🤡🤡💣💣💣💣💣💣💣💣💣', 'https://q3.qlogo.cn/headimg_dl?dst_uin=2420015932&spec=140', 'ぁ', '2420015932@qq.com', NULL, '/article/17', '2024-05-30 22:06:23', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43191, '测试发表评论', NULL, '海强', '123456789@qq.com', NULL, '/article/19', '2024-05-30 22:06:29', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43192, '🤑🤑🤑🤑🤑', 'https://q3.qlogo.cn/headimg_dl?dst_uin=2420015932&spec=140', 'ぁ', '2420015932@qq.com', NULL, '/article/17', '2024-05-30 22:07:06', 0, 43190, 43190, '', 2);
INSERT INTO `t_comment` VALUES (43193, '哈哈哈哈哈\n', NULL, '海强', '123456789@qq.com', NULL, '/article/17', '2024-05-30 22:07:09', 0, 43190, 43190, '', 2);
INSERT INTO `t_comment` VALUES (43194, '二级评论', 'https://q3.qlogo.cn/headimg_dl?dst_uin=2420015932&spec=140', 'ぁ', '2420015932@qq.com', NULL, '/article/17', '2024-05-30 22:07:45', 0, 43192, 43190, '', 2);
INSERT INTO `t_comment` VALUES (43195, 'interesting\n', 'https://q3.qlogo.cn/headimg_dl?dst_uin=2420015932&spec=140', 'ぁ', '2420015932@qq.com', NULL, '/article/17', '2024-05-30 22:08:13', 0, 43193, 43190, '', 2);
INSERT INTO `t_comment` VALUES (43196, '666', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1234567&spec=140', ' wewe', '1234567@qq.com', NULL, '/article/30', '2024-06-02 18:05:34', 0, 31, 20, '', 2);
INSERT INTO `t_comment` VALUES (43197, '999999999999', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1234567&spec=140', ' wewe', '1234567@qq.com', NULL, '/article/30', '2024-06-02 18:05:56', 0, 43196, 20, '系统拦截，包含敏感词：[999999999999]', 3);
INSERT INTO `t_comment` VALUES (43198, '评论这块写完昵称后,点击其他位置,昵称自动会消失,有点bug', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1234567&spec=140', ' wewe', '1234567@qq.com', NULL, '/article/30', '2024-06-02 18:06:34', 0, 43196, 20, '', 2);
INSERT INTO `t_comment` VALUES (43199, '枯干', NULL, 'sdf', 'asdf@sdf.com', 'asdf', '/article/19', '2024-06-02 19:46:08', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43209, '大大', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1748708592&spec=140', '🐳憨憨太胖了', '1748708592@qq.com', 'www.baidu.com', '/wiki/7?articleId=29', '2024-06-03 09:35:55', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43210, '测试', 'https://q4.qlogo.cn/headimg_dl?dst_uin=871361652&spec=140', '犬小哈', '871361652@qq.com', NULL, '/article/30', '2024-06-03 15:04:40', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43211, 'lalala', 'https://q3.qlogo.cn/headimg_dl?dst_uin=997320716&spec=140', '咏逺ヽ.啲.終', '997320716@qq.com', '', '/article/17', '2024-06-04 11:20:13', 0, 43178, 43178, '', 2);
INSERT INTO `t_comment` VALUES (43212, 'lalala', 'https://q3.qlogo.cn/headimg_dl?dst_uin=997320716&spec=140', '咏逺ヽ.啲.終', '997320716@qq.com', '', '/article/17', '2024-06-04 11:20:30', 0, 43211, 43178, '', 2);
INSERT INTO `t_comment` VALUES (43213, '·1123', 'https://q4.qlogo.cn/headimg_dl?dst_uin=3214494088&spec=140', '美团骑手王帝瓜', '3214494088@qq.com', NULL, '/article/29', '2024-06-05 09:47:52', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43214, 'aaaa', NULL, 'sfg', '632434345@qq.com', 'gsdfg', '/article/17', '2024-06-05 14:44:58', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43215, 'sfgsfgetgtt', NULL, 'sfg', '632434345@qq.com', 'gsdfg', '/article/17', '2024-06-05 14:45:04', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43216, 'tttttttttttttttt', NULL, 'sfg', '632434345@qq.com', 'gsdfg', '/article/17', '2024-06-05 14:45:08', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43217, '😃', NULL, 'sfg', '632434345@qq.com', 'gsdfg', '/article/17', '2024-06-05 14:45:23', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43218, '测试一下', 'https://q2.qlogo.cn/headimg_dl?dst_uin=3047018279&spec=140', '暗', '3047018279@qq.com', NULL, '/article/30', '2024-06-05 17:17:28', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43219, 'DataGrip是一款数据库管理客户端工具，方便连接到数据库服务器，执行sql、创建表、创建索引以及导出数据等。之前试用的客户端工具是dbvisualizer，但是在试用了DataGrip以后，我就决定抛弃dbvisualizer。🥵', 'https://q2.qlogo.cn/headimg_dl?dst_uin=230360101&spec=140', 'iFly.彼岸', '230360101@qq.com', NULL, '/article/30', '2024-06-06 11:00:07', 0, 43218, 43218, '系统拦截，包含敏感词：[数据库, 客户, 连接, 数据库, 服务器, 客户]', 3);
INSERT INTO `t_comment` VALUES (43220, '测试：求个黄色网址', 'https://q4.qlogo.cn/headimg_dl?dst_uin=704321764&spec=140', '42', '704321764@qq.com', NULL, '/wiki/6?articleId=19', '2024-06-06 15:01:10', 0, NULL, NULL, '系统拦截，包含敏感词：[黄色, 网址]', 3);
INSERT INTO `t_comment` VALUES (43221, '测试：求个黄色网址', 'https://q4.qlogo.cn/headimg_dl?dst_uin=704321764&spec=140', '42', '704321764@qq.com', NULL, '/wiki/6?articleId=19', '2024-06-06 15:01:12', 0, NULL, NULL, '系统拦截，包含敏感词：[黄色, 网址]', 3);
INSERT INTO `t_comment` VALUES (43222, '测试：求个黄色网址', 'https://q4.qlogo.cn/headimg_dl?dst_uin=704321764&spec=140', '42', '704321764@qq.com', NULL, '/wiki/6?articleId=19', '2024-06-06 15:01:14', 0, NULL, NULL, '系统拦截，包含敏感词：[黄色, 网址]', 3);
INSERT INTO `t_comment` VALUES (43223, '6的不行', NULL, '老6', '1187997529@qq.com', NULL, '/article/30', '2024-06-06 15:01:20', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43224, '测试：求个黄色😤👌网址', 'https://q4.qlogo.cn/headimg_dl?dst_uin=704321764&spec=140', '42', '704321764@qq.com', NULL, '/wiki/6?articleId=19', '2024-06-06 15:01:27', 0, NULL, NULL, '系统拦截，包含敏感词：[黄色, 网址]', 3);
INSERT INTO `t_comment` VALUES (43225, '测试：求个黄色😤👌网', 'https://q4.qlogo.cn/headimg_dl?dst_uin=704321764&spec=140', '42', '704321764@qq.com', NULL, '/wiki/6?articleId=19', '2024-06-06 15:01:35', 0, NULL, NULL, '系统拦截，包含敏感词：[黄色]', 3);
INSERT INTO `t_comment` VALUES (43226, '测试：求个黄  😤👌net🤏🙏', 'https://q4.qlogo.cn/headimg_dl?dst_uin=704321764&spec=140', '42', '704321764@qq.com', NULL, '/wiki/6?articleId=19', '2024-06-06 15:01:47', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43227, '3', 'https://q3.qlogo.cn/headimg_dl?dst_uin=2885500654&spec=140', '佩奇小助理', '2885500654@qq.com', '3', '/wiki/7?articleId=29', '2024-06-06 15:11:22', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43228, '防刷防刷防刷防刷', NULL, 'zacg', '1848713053@qq.com', 'kinguo.fun', '/article/19', '2024-06-06 15:42:03', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43229, '防刷', NULL, 'zacg', '1848713053@qq.com', 'kinguo.fun', '/article/19', '2024-06-06 15:42:06', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43230, '防刷防刷防刷防刷防刷', NULL, 'zacg', '1848713053@qq.com', 'kinguo.fun', '/article/19', '2024-06-06 15:42:08', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43231, '防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷', NULL, 'zacg', '1848713053@qq.com', 'kinguo.fun', '/article/19', '2024-06-06 15:42:10', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43232, '防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷', NULL, 'zacg', '1848713053@qq.com', 'kinguo.fun', '/article/19', '2024-06-06 15:42:13', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43233, '防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷', NULL, 'zacg', '1848713053@qq.com', 'kinguo.fun', '/article/19', '2024-06-06 15:42:15', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43234, '防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷防刷', NULL, 'zacg', '1848713053@qq.com', 'kinguo.fun', '/article/19', '2024-06-06 15:42:16', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43235, '防刷防刷防刷防刷防刷防刷防刷', NULL, 'zacg', '184848@q.com', '', '/article/19', '2024-06-06 15:42:32', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43236, '11', NULL, '111', '3684656502@qq.com', NULL, '/article/17', '2024-06-06 18:34:04', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43237, '11', NULL, '111', '1111@qq.com', NULL, '/article/17', '2024-06-06 18:34:23', 0, 43236, 43236, '', 2);
INSERT INTO `t_comment` VALUES (43238, '11\n', NULL, '111', '1111@qq.com', NULL, '/article/29', '2024-06-06 19:41:52', 0, 43213, 43213, '', 2);
INSERT INTO `t_comment` VALUES (43239, '撒的撒', NULL, '阿萨德', '3453905969@qq.com', 'www', '/article/29', '2024-06-07 08:40:55', 0, 43238, 43213, '', 2);
INSERT INTO `t_comment` VALUES (43240, '123456', NULL, '阿萨德', '3453905969@qq.com', 'www', '/article/29', '2024-06-07 08:41:07', 0, 43239, 43213, '', 2);
INSERT INTO `t_comment` VALUES (43241, '555555', NULL, '阿萨德', '3453905969@qq.com', 'www', '/article/29', '2024-06-07 08:41:23', 0, 43213, 43213, '', 2);
INSERT INTO `t_comment` VALUES (43242, '11', 'https://q3.qlogo.cn/headimg_dl?dst_uin=2546907080&spec=140', 'finghting 逸', '2546907080@qq.com', NULL, '/article/19', '2024-06-07 17:27:39', 0, 43230, 43230, '', 2);
INSERT INTO `t_comment` VALUES (43243, '好啊哈哦啊哈哦啊\n', 'https://q1.qlogo.cn/headimg_dl?dst_uin=2190210566&spec=140', '。。。', '2190210566@qq.com', NULL, '/article/19', '2024-06-08 10:23:41', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43244, '666', NULL, 'tomcat', 'tomcat@qq.com', 'tomcat.com', '/wiki/7?articleId=29', '2024-06-08 17:25:50', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43245, 'halo', NULL, '钱钱钱', '123456789@qq.com', NULL, '/article/19', '2024-06-12 11:17:29', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43246, '还可以的', 'https://q3.qlogo.cn/headimg_dl?dst_uin=1416058630&spec=140', '黎芽', '1416058630@qq.com', NULL, '/article/19', '2024-06-12 15:19:57', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43247, '很好', 'https://q1.qlogo.cn/headimg_dl?dst_uin=810346283&spec=140', '雨夜微凉', '810346283@qq.com', NULL, '/article/17', '2024-06-14 15:43:33', 0, 43237, 43236, '', 2);
INSERT INTO `t_comment` VALUES (43248, '6', 'https://q3.qlogo.cn/headimg_dl?dst_uin=1148257288&spec=140', '？？？', '1148257288@qq.com', NULL, '/article/30', '2024-06-14 16:48:54', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43249, '测试评论', 'https://q3.qlogo.cn/headimg_dl?dst_uin=2597864319&spec=140', 'm', '2597864319@qq.com', NULL, '/article/17', '2024-06-15 16:00:42', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43250, 'ces', NULL, 'ces', '398417284@qq.com', 'ces', '/article/19', '2024-06-15 19:44:25', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43251, 'cesces', NULL, 'ces', '398417284@qq.com', 'ces', '/article/19', '2024-06-15 19:44:45', 0, 43250, 43250, '', 2);
INSERT INTO `t_comment` VALUES (43252, '1111111', 'https://q3.qlogo.cn/headimg_dl?dst_uin=13471392&spec=140', 'Justice', '13471392@qq.com', NULL, '/article/19', '2024-06-16 16:33:54', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43253, '000', NULL, '0', '2222222222@qq.com', '0', '/article/30', '2024-06-16 20:40:12', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43254, '12', NULL, '0', '2222222222@qq.com', '0', '/article/30', '2024-06-16 20:41:19', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43255, '123', NULL, '0', '2222222222@qq.com', '0', '/article/30', '2024-06-16 20:41:32', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43256, '09', NULL, '0', '2222222222@qq.com', '0', '/article/30', '2024-06-16 20:41:48', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43257, '1', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2464674651&spec=140', '凝视深渊', '2464674651@qq.com', NULL, '/article/19', '2024-06-17 14:57:33', 0, 39933, 39933, '', 2);
INSERT INTO `t_comment` VALUES (43258, '6', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2464674651&spec=140', '凝视深渊', '2464674651@qq.com', NULL, '/article/19', '2024-06-17 14:57:42', 0, 43257, 39933, '', 2);
INSERT INTO `t_comment` VALUES (43259, 'asd', NULL, '钱钱钱', '123456789@qq.com', NULL, '/article/30', '2024-06-17 23:37:55', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43260, '而奋斗的', NULL, '钱钱钱', '123456789@qq.com', NULL, '/article/30', '2024-06-17 23:38:03', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43261, '1', NULL, '1', '2658675006@qq.com', '1', '/article/17', '2024-06-18 13:30:56', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43262, '1', NULL, '1', '1@1.com', NULL, '/article/18', '2024-06-18 15:01:57', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43263, '<div></div>', NULL, '1', '1@1.com', NULL, '/article/18', '2024-06-18 15:02:23', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43264, '测试', 'https://q3.qlogo.cn/headimg_dl?dst_uin=1220616544&spec=140', '黄子豪', '1220616544@qq.com', NULL, '/article/30', '2024-06-22 00:40:21', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43265, '相见时难别易难 东风无力百花残', NULL, '美国', '2232242323@qq.com', '', '/article/30', '2024-06-26 09:52:09', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43266, '666', NULL, '美国', '2232242323@qq.com', '', '/article/30', '2024-06-26 09:52:38', 0, 43265, 43265, '', 2);
INSERT INTO `t_comment` VALUES (43267, '6789', NULL, '美国', '2232242323@qq.com', '', '/article/30', '2024-06-26 09:52:46', 0, 43266, 43265, '系统拦截，包含敏感词：[89]', 3);
INSERT INTO `t_comment` VALUES (43268, '6789', NULL, '美国', '2232242323@qq.com', '', '/article/30', '2024-06-26 09:52:50', 0, 43266, 43265, '系统拦截，包含敏感词：[89]', 3);
INSERT INTO `t_comment` VALUES (43269, '1234', NULL, '美国', '2232242323@qq.com', '', '/article/30', '2024-06-26 09:52:55', 0, 43266, 43265, '', 2);
INSERT INTO `t_comment` VALUES (43270, '001 100 111 000', NULL, '美国', '2232242323@qq.com', '', '/article/30', '2024-06-26 09:54:06', 0, 43266, 43265, '', 2);
INSERT INTO `t_comment` VALUES (43271, '1111', NULL, '美国', '2232232323@qq.cn', '', '/article/30', '2024-06-26 15:32:13', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43272, '1111', NULL, '美国', '2232232323@qq.cn', '', '/article/30', '2024-06-26 15:32:13', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43273, '1111', NULL, '美国', '2232232323@qq.cn', '', '/article/30', '2024-06-26 15:32:13', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43274, '111', NULL, '美国', '2232232323@qq.cn', '', '/article/30', '2024-06-26 15:32:18', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43275, '1111', NULL, '美国', '2232232323@qq.cn', '', '/article/30', '2024-06-26 15:32:22', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43276, '123', NULL, '中国', '2232232323@qq.com', '', '/article/30', '2024-06-26 15:32:53', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43278, '知道吗', 'https://q1.qlogo.cn/headimg_dl?dst_uin=3508216698&spec=140', '大橘为重', '3508216698@qq.com', NULL, '/article/29', '2024-06-27 14:40:32', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43284, '123', NULL, '123', '2872122367@qq.com', NULL, '/article/19', '2024-07-04 20:42:39', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43285, '22\n', 'https://q3.qlogo.cn/headimg_dl?dst_uin=1841370866&spec=140', 'july', '1841370866@qq.com', NULL, '/wiki/8?articleId=18', '2024-07-07 18:48:20', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43286, '哦空空', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2092618809&spec=140', 'Cr', '2092618809@qq.com', NULL, '/article/32', '2024-07-07 21:57:45', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43287, '哈总可以再多更新更新vue的教程,从入门到精通一路打通', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1552951165&spec=140', 'Liberté et rêves', '1552951165@qq.com', NULL, '/wiki/7?articleId=29', '2024-07-07 22:40:08', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43288, '66', NULL, '66', '2282282828@qq.com', NULL, '/article/19', '2024-07-09 05:34:57', 0, 43284, 43284, '', 2);
INSERT INTO `t_comment` VALUES (43289, '下面谁这么狠毒，嘶嘶嘶的', 'https://q1.qlogo.cn/headimg_dl?dst_uin=2837121161&spec=140', '777', '777@7.7', NULL, '/article/19', '2024-07-12 09:47:23', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43290, '1', 'https://q3.qlogo.cn/headimg_dl?dst_uin=1410597573&spec=140', '王小丹', '1410597573@qq.com', NULL, '/article/32', '2024-07-12 11:41:42', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43291, '123', NULL, '多对多', 'sss@123.com', 'sss', '/article/17', '2024-07-12 15:23:12', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43292, 'sdf', NULL, '多对多', 'sss@123.com', 'sss', '/article/17', '2024-07-12 15:23:20', 0, 43291, 43291, '', 2);
INSERT INTO `t_comment` VALUES (43293, 'sdf', NULL, '多对多', 'sss@123.com', 'sss', '/article/19', '2024-07-12 15:24:53', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43294, 'sdfsd', NULL, '多对多', 'sss@123.com', 'sss', '/article/19', '2024-07-12 15:25:00', 0, 43293, 43293, '', 2);
INSERT INTO `t_comment` VALUES (43295, '求更新', 'https://q4.qlogo.cn/headimg_dl?dst_uin=2100087742&spec=140', '拾柒', '2100087742@qq.com', NULL, '/wiki/7?articleId=29', '2024-07-15 13:27:25', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43296, '你好', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2916732313&spec=140', 'peach clous', '2916732313@qq.com', NULL, '/article/17', '2024-07-16 16:59:56', 0, 43216, 43216, '', 2);
INSERT INTO `t_comment` VALUES (43297, 'test', 'https://q1.qlogo.cn/headimg_dl?dst_uin=2942894660&spec=140', 'Leo', '2942894660@qq.com', NULL, '/wiki/8?articleId=18', '2024-07-17 16:48:32', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43298, '评论完，页面关闭再打开，信息也还是没被清空。开启了审核也是一样', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1395778103&spec=140', '。', '1395778103@qq.com', NULL, '/article/19', '2024-07-17 16:55:37', 0, NULL, NULL, '系统拦截，包含敏感词：[信息]', 3);
INSERT INTO `t_comment` VALUES (43299, '评论完后，页面关闭再打开，信息也还是没被清空。开启了审核也是一样', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1395778103&spec=140', '。', '1395778103@qq.com', NULL, '/article/19', '2024-07-17 16:55:44', 0, NULL, NULL, '系统拦截，包含敏感词：[信息]', 3);
INSERT INTO `t_comment` VALUES (43300, '评论完后，页面关闭再打开，信息没被清空。开启了审核也是一样', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1395778103&spec=140', '。', '1395778103@qq.com', NULL, '/article/19', '2024-07-17 16:55:52', 0, NULL, NULL, '系统拦截，包含敏感词：[信息]', 3);
INSERT INTO `t_comment` VALUES (43301, '评论完后，页面关闭然后打开，信息没被清空。开启了审核也是一样', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1395778103&spec=140', '。', '1395778103@qq.com', NULL, '/article/19', '2024-07-17 16:55:58', 0, NULL, NULL, '系统拦截，包含敏感词：[然后, 信息]', 3);
INSERT INTO `t_comment` VALUES (43302, '评论完后，页面关闭然后打开，信息没被清空。开启审核功能也是一样的', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1395778103&spec=140', '。', '1395778103@qq.com', NULL, '/article/19', '2024-07-17 16:56:06', 0, NULL, NULL, '系统拦截，包含敏感词：[然后, 信息]', 3);
INSERT INTO `t_comment` VALUES (43303, '评论完后，页面关闭，打开，信息不会被置空。开启审核功能也是一样的', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1395778103&spec=140', '。', '1395778103@qq.com', NULL, '/article/19', '2024-07-17 16:56:54', 0, NULL, NULL, '系统拦截，包含敏感词：[信息]', 3);
INSERT INTO `t_comment` VALUES (43304, '页面关闭，打开，信息不会被置空。开启审核功能也是一样的', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1395778103&spec=140', '。', '1395778103@qq.com', NULL, '/article/19', '2024-07-17 16:57:08', 0, NULL, NULL, '系统拦截，包含敏感词：[信息]', 3);
INSERT INTO `t_comment` VALUES (43305, '信息不会被置空。开启审核功能也是一样的', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1395778103&spec=140', '。', '1395778103@qq.com', NULL, '/article/19', '2024-07-17 16:57:11', 0, NULL, NULL, '系统拦截，包含敏感词：[信息]', 3);
INSERT INTO `t_comment` VALUES (43306, '信息不会被置空', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1395778103&spec=140', '。', '1395778103@qq.com', NULL, '/article/19', '2024-07-17 16:57:13', 0, NULL, NULL, '系统拦截，包含敏感词：[信息]', 3);
INSERT INTO `t_comment` VALUES (43307, '信息不会', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1395778103&spec=140', '。', '1395778103@qq.com', NULL, '/article/19', '2024-07-17 16:57:17', 0, NULL, NULL, '系统拦截，包含敏感词：[信息]', 3);
INSERT INTO `t_comment` VALUES (43308, '信息', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1395778103&spec=140', '。', '1395778103@qq.com', NULL, '/article/19', '2024-07-17 16:57:18', 0, NULL, NULL, '系统拦截，包含敏感词：[信息]', 3);
INSERT INTO `t_comment` VALUES (43309, '信', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1395778103&spec=140', '。', '1395778103@qq.com', NULL, '/article/19', '2024-07-17 16:57:19', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43310, '评论完后，关闭再打开昵称啥的不会被清空，', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1395778103&spec=140', '。', '1395778103@qq.com', NULL, '/article/19', '2024-07-17 16:59:45', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43311, '测试', NULL, '测试', 'hackerxiao@foxmail.com', 'hackerxiao.online', '/article/29', '2024-07-21 19:37:21', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43312, '牛逼', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1063816178&spec=140', '一', '1063816178@qq.com', NULL, '/article/29', '2024-07-22 09:47:01', 0, NULL, NULL, '系统拦截，包含敏感词：[牛逼]', 3);
INSERT INTO `t_comment` VALUES (43313, '牛逼', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1063816178&spec=140', '一', '1063816178@qq.com', NULL, '/article/29', '2024-07-22 09:47:01', 0, NULL, NULL, '系统拦截，包含敏感词：[牛逼]', 3);
INSERT INTO `t_comment` VALUES (43314, '牛犇', 'https://q1.qlogo.cn/headimg_dl?dst_uin=1063816178&spec=140', '一', '1063816178@qq.com', NULL, '/article/29', '2024-07-22 09:47:08', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43315, '我看看', 'https://q3.qlogo.cn/headimg_dl?dst_uin=485965901&spec=140', '岁愿', '485965901@qq.com', NULL, '/wiki/6?articleId=19', '2024-07-24 19:36:22', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43316, '还真是', 'https://q3.qlogo.cn/headimg_dl?dst_uin=485965901&spec=140', '岁愿', '485965901@qq.com', NULL, '/wiki/6?articleId=19', '2024-07-24 19:36:33', 0, 43315, 43315, '', 2);
INSERT INTO `t_comment` VALUES (43317, '可以的，后续把 Vue 3 的基础教程再补一补~😎', 'https://q4.qlogo.cn/headimg_dl?dst_uin=871361652&spec=140', '犬小哈', '871361652@qq.com', NULL, '/wiki/7?articleId=29', '2024-07-25 15:58:21', 0, 43287, 43287, '', 2);
INSERT INTO `t_comment` VALUES (43318, '可以看这个，已经写了一部分：https://www.quanxiaoha.com/vue3/what-is-vue.html', 'https://q4.qlogo.cn/headimg_dl?dst_uin=871361652&spec=140', '犬小哈', '871361652@qq.com', NULL, '/wiki/7?articleId=29', '2024-07-25 15:59:10', 0, 43287, 43287, '系统拦截，包含敏感词：[www.quanxiaoha.com, what-is-vue.html]', 3);
INSERT INTO `t_comment` VALUES (43319, '可以看这个，已经写了一部分：https://www.quanxiaoha.com/vue3/what-is-vue.html', 'https://q4.qlogo.cn/headimg_dl?dst_uin=871361652&spec=140', '犬小哈', '871361652@qq.com', NULL, '/wiki/7?articleId=29', '2024-07-25 16:01:02', 0, 43287, 43287, '', 2);
INSERT INTO `t_comment` VALUES (43320, '可以看这个，已经写了一部分：https://www.quanxiaoha.com/vue3/what-is-vue.html', 'https://q4.qlogo.cn/headimg_dl?dst_uin=871361652&spec=140', '犬小哈', '871361652@qq.com', NULL, '/wiki/7?articleId=29', '2024-07-25 16:01:08', 0, 43295, 43295, '', 2);
INSERT INTO `t_comment` VALUES (43321, '这个是用 pinia 特意做的缓存，防止后续又得重新回填，不方便~😃', 'https://q4.qlogo.cn/headimg_dl?dst_uin=871361652&spec=140', '犬小哈', '871361652@qq.com', NULL, '/article/19', '2024-07-25 16:03:21', 0, 43310, 43310, '', 2);
INSERT INTO `t_comment` VALUES (43322, '你好', NULL, '你好', '333@qq.com', NULL, '/article/19', '2024-07-31 11:06:51', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43323, '...', NULL, '3160393235', '3160393235@qq.com', NULL, '/article/30', '2024-07-31 23:00:24', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43324, '{timestamp: \"2024-08-01 08:08:51\", status: 404, error: \"Not Found\", path: \"/api/blog/setting/detail\"}\n\n部署没成功', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1649052814&spec=140', 'এ᭄萌ꦿృ༊', '1649052814@qq.com', 'https://101.42.25.173/', '/article/19', '2024-08-01 16:13:50', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43325, 'hhh🤏', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1528489724&spec=140', '姓杨', '1528489724@qq.com', NULL, '/article/32', '2024-08-03 16:55:43', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43326, '无敌是多么寂寞~', NULL, 'wood', '100@qq.com', 'wood', '/article/19', '2024-08-04 21:21:29', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43327, '123', NULL, '1', '2443689156@qq.com', NULL, '/article/30', '2024-08-05 09:31:49', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43328, '111', NULL, '小哈', '12749913@qq.comm', '试试水', '/wiki/8?articleId=18', '2024-08-05 23:14:09', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43329, '111', NULL, '小哈', '12749913@qq.comm', '试试水', '/wiki/8?articleId=18', '2024-08-05 23:14:25', 0, 43328, 43328, '', 2);
INSERT INTO `t_comment` VALUES (43331, '看一下 nginx 的配置文件中  rewrite 配置可写正确了~', 'https://q4.qlogo.cn/headimg_dl?dst_uin=871361652&spec=140', '犬小哈', '871361652@qq.com', NULL, '/article/19', '2024-08-06 08:47:02', 0, 43324, 43324, '', 2);
INSERT INTO `t_comment` VALUES (43332, '123', NULL, '张', '478878215@qq.com', NULL, '/article/32', '2024-08-06 15:30:44', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43333, '122', NULL, '478878215', '478878215@qq.com', NULL, '/article/32', '2024-08-06 15:31:06', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43334, '扭笔！', 'https://q1.qlogo.cn/headimg_dl?dst_uin=604858986&spec=140', 'Alex', '604858986@qq.com', NULL, '/article/29', '2024-08-08 10:36:06', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43335, '1', 'https://q3.qlogo.cn/headimg_dl?dst_uin=419527534&spec=140', '.', '419527534@qq.com', NULL, '/article/19', '2024-08-11 22:26:26', 0, 43246, 43246, '', 2);
INSERT INTO `t_comment` VALUES (43336, '1', 'https://q3.qlogo.cn/headimg_dl?dst_uin=419527534&spec=140', '.', '419527534@qq.com', NULL, '/article/19', '2024-08-11 22:27:37', 0, 43335, 43246, '', 2);
INSERT INTO `t_comment` VALUES (43337, '测试', NULL, '测试', 'Zack163@126.com', NULL, '/article/19', '2024-08-12 16:43:18', 0, 39942, 22, '', 2);
INSERT INTO `t_comment` VALUES (43338, '666', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1262550372&spec=140', 'L.', '1262550372@qq.com', 'www.bxcoder.cn', '/article/32', '2024-08-14 11:54:49', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43339, '测试', 'https://q2.qlogo.cn/headimg_dl?dst_uin=30520028&spec=140', '风叶', '30520028@qq.com', NULL, '/article/29', '2024-08-14 22:07:56', 0, 43238, 43213, '', 2);
INSERT INTO `t_comment` VALUES (43340, '测试一下\n', NULL, '111', '11111@qq.com', NULL, '/article/30', '2024-08-15 08:45:02', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43341, '中国必统一', NULL, '中国必统一', '22222@qq.com', NULL, '/article/30', '2024-08-15 08:45:57', 0, NULL, NULL, '系统拦截，包含敏感词：[中国]', 3);
INSERT INTO `t_comment` VALUES (43342, '中国统一', NULL, '中国必统一', '22222@qq.com', NULL, '/article/30', '2024-08-15 08:46:06', 0, NULL, NULL, '系统拦截，包含敏感词：[中国]', 3);
INSERT INTO `t_comment` VALUES (43343, '111', NULL, '中国必统一', '22222@qq.com', NULL, '/article/30', '2024-08-15 08:46:11', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43344, '写的真好', 'https://q4.qlogo.cn/headimg_dl?dst_uin=2442357657&spec=140', 'YJ.', '2442357657@qq.com', NULL, '/article/32', '2024-08-17 11:33:09', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43345, '生日快乐', 'https://q4.qlogo.cn/headimg_dl?dst_uin=2442357657&spec=140', 'YJ.', '2442357657@qq.com', NULL, '/article/32', '2024-08-17 12:23:12', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43346, '你好', 'https://q4.qlogo.cn/headimg_dl?dst_uin=3589535340&spec=140', 'Cyan_', '3589535340@qq.com', NULL, '/article/32', '2024-08-17 22:49:26', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43347, 'qwqsdc', NULL, 'hhhhh', '2896323419@qq.com', NULL, '/article/32', '2024-08-19 12:38:18', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43348, '11111', NULL, 'hhhhh', '2896323419@qq.com', NULL, '/article/19', '2024-08-19 13:01:08', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43349, '22222', NULL, 'hhhhh', '2896323419@qq.com', NULL, '/article/19', '2024-08-19 13:01:22', 0, 43348, 43348, '', 2);
INSERT INTO `t_comment` VALUES (43350, '你好🤡', 'https://q3.qlogo.cn/headimg_dl?dst_uin=706716852&spec=140', 'nihao', '706716852@qq.com', NULL, '/article/19', '2024-08-21 14:23:26', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43351, '😤', 'https://q1.qlogo.cn/headimg_dl?dst_uin=2441276048&spec=140', 'MONSTERS', '2441276048@qq.com', NULL, '/article/19', '2024-08-21 20:38:46', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43352, '666', 'https://q4.qlogo.cn/headimg_dl?dst_uin=656565&spec=140', '雨花花', '656565@qq.com', NULL, '/article/32', '2024-08-22 11:53:41', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43353, '8888', 'https://q4.qlogo.cn/headimg_dl?dst_uin=656565&spec=140', '雨花花', '656565@qq.com', NULL, '/article/32', '2024-08-22 12:01:57', 0, 43347, 43347, '', 2);
INSERT INTO `t_comment` VALUES (43354, '这么帅吗', 'https://q3.qlogo.cn/headimg_dl?dst_uin=1477856481&spec=140', '大懒猪', '1477856481@qq.com', NULL, '/article/18', '2024-08-22 20:36:58', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43355, '测试下', NULL, '你好', '333@qq.com', NULL, '/article/17', '2024-08-23 16:22:51', 0, 43173, 43151, '', 2);
INSERT INTO `t_comment` VALUES (43356, 'vxcvx', NULL, 'lh', '112686838@qq.com', '', '/article/30', '2024-08-26 14:20:23', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43357, '去你的\n', NULL, 'lh', '112686838@qq.com', '', '/article/30', '2024-08-26 14:20:50', 0, 43356, 43356, '系统拦截，包含敏感词：[去你的]', 3);
INSERT INTO `t_comment` VALUES (43358, '去你的\n', NULL, 'lh', '112686838@qq.com', '', '/article/30', '2024-08-26 14:20:54', 0, 43356, 43356, '系统拦截，包含敏感词：[去你的]', 3);
INSERT INTO `t_comment` VALUES (43359, '去你的\n', NULL, 'lh', '112686838@qq.com', '', '/article/30', '2024-08-26 14:20:59', 0, 43356, 43356, '系统拦截，包含敏感词：[去你的]', 3);
INSERT INTO `t_comment` VALUES (43360, '11', 'https://q3.qlogo.cn/headimg_dl?dst_uin=3407119697&spec=140', '努力学习的小包子', '3407119697@qq.com', '111', '/article/31', '2024-08-27 10:28:27', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43361, '😃', NULL, 'vdg', '3466691923@qq.com', NULL, '/article/17', '2024-08-27 17:59:40', 0, 43150, 43150, '', 2);
INSERT INTO `t_comment` VALUES (43362, '傻逼，敏感词测试', NULL, 'vdg', '3466691923@qq.com', NULL, '/article/19', '2024-08-28 17:06:12', 0, NULL, NULL, '系统拦截，包含敏感词：[傻逼]', 3);
INSERT INTO `t_comment` VALUES (43363, '测试评论数据', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2149576482&spec=140', '秋', '2149576482@qq.com', NULL, '/article/19', '2024-09-02 16:01:22', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43364, '咋不用windows呢？', 'https://q3.qlogo.cn/headimg_dl?dst_uin=13696627&spec=140', 'pot', '13696627@qq.com', NULL, '/article/30', '2024-09-03 14:48:16', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43365, '<h1>老师我爱你</h1>', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2405554770&spec=140', '杀手', '2405554770@qq.com', NULL, '/article/19', '2024-09-03 18:26:26', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43366, '# 哈哈啊', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2405554770&spec=140', '杀手', '2405554770@qq.com', NULL, '/article/19', '2024-09-03 18:26:36', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43367, '以前在上家公司写的文章，公司统一发的 mac 电脑开发~', 'https://q1.qlogo.cn/headimg_dl?dst_uin=871361652&spec=140', '犬小哈', '871361652@qq.com', NULL, '/article/30', '2024-09-03 19:00:59', 0, 43364, 43364, '系统拦截，包含敏感词：[公司, 公司, 开发]', 3);
INSERT INTO `t_comment` VALUES (43368, '以前在上家宫司写的文章，统一发的 mac 电脑~', 'https://q1.qlogo.cn/headimg_dl?dst_uin=871361652&spec=140', '犬小哈', '871361652@qq.com', NULL, '/article/30', '2024-09-03 19:02:50', 0, 43364, 43364, '', 2);
INSERT INTO `t_comment` VALUES (43369, '我就试试', 'https://q1.qlogo.cn/headimg_dl?dst_uin=1059921855&spec=140', '闲听风寒', '1059921855@qq.com', NULL, '/article/19', '2024-09-04 15:43:09', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43370, '111', NULL, '1223', '1692734365@qq.com', '122', '/article/29', '2024-09-04 18:13:12', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43371, '哟吼', NULL, '厌学仔', '2660482548@qq.com', NULL, '/article/32', '2024-09-05 13:49:46', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43372, '你填百度网址啊\n', NULL, '厌学仔', '2660482548@qq.com', NULL, '/article/31', '2024-09-05 13:52:30', 0, 39925, 39925, '系统拦截，包含敏感词：[网址]', 3);
INSERT INTO `t_comment` VALUES (43373, '你填baidu网址啊\n', NULL, '厌学仔', '2660482548@qq.com', NULL, '/article/31', '2024-09-05 13:52:40', 0, 39925, 39925, '系统拦截，包含敏感词：[网址]', 3);
INSERT INTO `t_comment` VALUES (43374, '填baidu网址啊\n', NULL, '厌学仔', '2660482548@qq.com', NULL, '/article/31', '2024-09-05 13:52:47', 0, 39925, 39925, '系统拦截，包含敏感词：[网址]', 3);
INSERT INTO `t_comment` VALUES (43375, '填baidu啊\n', NULL, '厌学仔', '2660482548@qq.com', NULL, '/article/31', '2024-09-05 13:52:56', 0, 39925, 39925, '', 2);
INSERT INTO `t_comment` VALUES (43376, '不会自动获取昵称，头像啊', NULL, '12', '2660482548@qq.com', NULL, '/article/19', '2024-09-06 17:56:30', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43377, '噢，我知道了', 'https://q4.qlogo.cn/headimg_dl?dst_uin=2014502771&spec=140', '彩虹秋千', '2014502771@qq.com', NULL, '/article/19', '2024-09-06 18:05:25', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43378, '真厉害呀！这头发又得掉好多', 'https://q3.qlogo.cn/headimg_dl?dst_uin=1363378049&spec=140', '醉˙倾城', '1363378049@qq.com', NULL, '/article/32', '2024-09-09 09:42:50', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43379, '牛逼', 'https://q4.qlogo.cn/headimg_dl?dst_uin=9856132851&spec=140', 'null', '9856132851@qq.com', NULL, '/article/18', '2024-09-09 10:52:55', 0, NULL, NULL, '系统拦截，包含敏感词：[牛逼]', 3);
INSERT INTO `t_comment` VALUES (43380, '厉害', 'https://q4.qlogo.cn/headimg_dl?dst_uin=9856132851&spec=140', 'null', '9856132851@qq.com', NULL, '/article/18', '2024-09-09 10:53:01', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43381, '厉害啊', NULL, 'zzh', '1053876813@qq.com', NULL, '/article/29', '2024-09-10 22:53:35', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43382, '非常强', NULL, '臭润润', '1053876813@qq.com', NULL, '/article/29', '2024-09-10 22:54:30', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43383, '666', NULL, '臭润润', '1053876813@qq.com', NULL, '/article/29', '2024-09-10 22:54:50', 0, 43382, 43382, '', 2);
INSERT INTO `t_comment` VALUES (43384, '昵称那里输入qq号', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1053876813&spec=140', '臭润润', '1053876813@qq.com', NULL, '/article/19', '2024-09-10 23:08:45', 0, 43376, 43376, '系统拦截，包含敏感词：[qq]', 3);
INSERT INTO `t_comment` VALUES (43385, '昵称那里输入账号', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1053876813&spec=140', '臭润润', '1053876813@qq.com', NULL, '/article/19', '2024-09-10 23:08:53', 0, 43376, 43376, '系统拦截，包含敏感词：[账号]', 3);
INSERT INTO `t_comment` VALUES (43386, '账号输入', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1053876813&spec=140', '臭润润', '1053876813@qq.com', NULL, '/article/19', '2024-09-10 23:09:01', 0, 43376, 43376, '系统拦截，包含敏感词：[账号]', 3);
INSERT INTO `t_comment` VALUES (43387, '昵称用你的qq', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1053876813&spec=140', '臭润润', '1053876813@qq.com', NULL, '/article/19', '2024-09-10 23:09:11', 0, 43376, 43376, '系统拦截，包含敏感词：[qq]', 3);
INSERT INTO `t_comment` VALUES (43388, '昵称用你的q', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1053876813&spec=140', '臭润润', '1053876813@qq.com', NULL, '/article/19', '2024-09-10 23:09:14', 0, 43376, 43376, '', 2);
INSERT INTO `t_comment` VALUES (43389, '123123', NULL, 'test', '312387@qq.com', '123123123', '/article/17', '2024-09-14 22:29:41', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43390, '测试', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1752597830&spec=140', '忙里偷闲的sin', '1752597830@qq.com', NULL, '/article/19', '2024-09-17 13:20:32', 0, 39903, 39901, '', 2);
INSERT INTO `t_comment` VALUES (43391, '😃😃😃', 'https://q3.qlogo.cn/headimg_dl?dst_uin=1457258842&spec=140', 'ssss', '1457258842@qq.com', NULL, '/article/19', '2024-09-17 13:22:32', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43392, '哈哈哈', 'https://q3.qlogo.cn/headimg_dl?dst_uin=1457258842&spec=140', 'ssss', '1457258842@qq.com', NULL, '/article/19', '2024-09-17 13:22:40', 0, 43391, 43391, '', 2);
INSERT INTO `t_comment` VALUES (43393, '回复', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2405554770&spec=140', '杀手', '2405554770@qq.com', NULL, '/article/32', '2024-09-19 14:16:52', 0, 43346, 43346, '', 2);
INSERT INTO `t_comment` VALUES (43394, '111', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2498514473&spec=140', '七海碎雨', '2498514473@qq.com', 'https://www.bilibili.com/', '/article/32', '2024-09-24 14:52:56', 0, 43346, 43346, '', 2);
INSERT INTO `t_comment` VALUES (43395, '😁😁😁😁😁😁😁', NULL, 'aaaaaa', '3482007226@qq.com', NULL, '/article/19', '2024-09-27 06:12:43', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43396, '1111111111', NULL, 'aaaaaa', '3482007226@qq.com', NULL, '/article/19', '2024-09-27 06:13:02', 0, NULL, NULL, '系统拦截，包含敏感词：[1111111111]', 3);
INSERT INTO `t_comment` VALUES (43397, '测试测试测试测试测试', NULL, 'aaaaaa', '3482007226@qq.com', NULL, '/article/19', '2024-09-27 06:13:14', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43398, '😃😃😃😃😃', NULL, 'ssss', '3482007226@qq.com', NULL, '/article/19', '2024-09-27 06:13:45', 0, 43397, 43397, '', 2);
INSERT INTO `t_comment` VALUES (43399, 'test', NULL, 'emm', '2729019991@qq.com', '', '/article/17', '2024-09-27 09:27:23', 0, 43247, 43236, '', 2);
INSERT INTO `t_comment` VALUES (43400, 'test', NULL, 'test', 'test@qq.com', NULL, '/article/29', '2024-09-30 08:31:02', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43401, '23', 'https://q1.qlogo.cn/headimg_dl?dst_uin=491820004&spec=140', 'simon', '491820004@qq.com', NULL, '/article/19', '2024-10-02 10:33:06', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43402, 'test\n', NULL, '1223', '1692734365@qq.com', '122', '/article/29', '2024-10-04 23:12:06', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43403, '💢', 'https://q1.qlogo.cn/headimg_dl?dst_uin=373395568&spec=140', '撒子/aiq', '373395568@qq.com', NULL, '/article/32', '2024-10-04 23:47:58', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43404, 'lihai', 'https://q3.qlogo.cn/headimg_dl?dst_uin=1529741311&spec=140', '平安是福', '1529741311@qq.com', NULL, '/wiki/7?articleId=29', '2024-10-04 23:49:59', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43405, '好好好', NULL, '哈哈哈', '3213@163.com', '131', '/article/29', '2024-10-09 10:19:47', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43406, '测试', NULL, '哈哈哈', '3213@163.com', '131', '/article/29', '2024-10-09 10:20:14', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43407, '非常好', NULL, 'xy', '2891742948@qq.com', NULL, '/article/32', '2024-10-11 15:10:52', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43408, '11', NULL, 'hello', '1111111111@qq.com', NULL, '/article/32', '2024-10-12 11:16:16', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43409, '111', NULL, 'hello', '1111111111@qq.com', NULL, '/article/32', '2024-10-12 11:50:06', 0, 43408, 43408, '', 2);
INSERT INTO `t_comment` VALUES (43410, '测试一下🤏', NULL, '2556482879', 'fancier_fox@163.com', NULL, '/article/32', '2024-10-13 10:17:23', 0, 43409, 43408, '', 2);
INSERT INTO `t_comment` VALUES (43411, '测试', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1752597830&spec=140', '忙里偷闲的sin', '1752597830@qq.com', NULL, '/article/19', '2024-10-15 17:12:54', 0, 43398, 43397, '', 2);
INSERT INTO `t_comment` VALUES (43412, '1', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1752597830&spec=140', '忙里偷闲的sin', '1752597830@qq.com', NULL, '/article/19', '2024-10-15 17:12:59', 0, 43411, 43397, '', 2);
INSERT INTO `t_comment` VALUES (43413, '1', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1752597830&spec=140', '忙里偷闲的sin', '1752597830@qq.com', NULL, '/article/19', '2024-10-15 17:13:02', 0, 43412, 43397, '', 2);
INSERT INTO `t_comment` VALUES (43414, '1', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1752597830&spec=140', '忙里偷闲的sin', '1752597830@qq.com', NULL, '/article/19', '2024-10-15 17:13:04', 0, 43413, 43397, '', 2);
INSERT INTO `t_comment` VALUES (43415, '1', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1752597830&spec=140', '忙里偷闲的sin', '1752597830@qq.com', NULL, '/article/19', '2024-10-15 17:13:07', 0, 43414, 43397, '', 2);
INSERT INTO `t_comment` VALUES (43416, '1', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1752597830&spec=140', '忙里偷闲的sin', '1752597830@qq.com', NULL, '/article/19', '2024-10-15 17:13:10', 0, 43415, 43397, '', 2);
INSERT INTO `t_comment` VALUES (43417, '1', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1752597830&spec=140', '忙里偷闲的sin', '1752597830@qq.com', NULL, '/article/19', '2024-10-15 17:13:13', 0, 43416, 43397, '', 2);
INSERT INTO `t_comment` VALUES (43418, '1', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1752597830&spec=140', '忙里偷闲的sin', '1752597830@qq.com', NULL, '/article/19', '2024-10-15 17:13:15', 0, 43417, 43397, '', 2);
INSERT INTO `t_comment` VALUES (43419, '2', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1752597830&spec=140', '忙里偷闲的sin', '1752597830@qq.com', NULL, '/article/19', '2024-10-15 17:13:18', 0, 43418, 43397, '', 2);
INSERT INTO `t_comment` VALUES (43420, '2', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1752597830&spec=140', '忙里偷闲的sin', '1752597830@qq.com', NULL, '/article/19', '2024-10-15 17:13:20', 0, 43419, 43397, '', 2);
INSERT INTO `t_comment` VALUES (43421, '2', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1752597830&spec=140', '忙里偷闲的sin', '1752597830@qq.com', NULL, '/article/19', '2024-10-15 17:13:23', 0, 43420, 43397, '', 2);
INSERT INTO `t_comment` VALUES (43422, '2', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1752597830&spec=140', '忙里偷闲的sin', '1752597830@qq.com', NULL, '/article/19', '2024-10-15 17:13:25', 0, 43421, 43397, '', 2);
INSERT INTO `t_comment` VALUES (43423, '2', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1752597830&spec=140', '忙里偷闲的sin', '1752597830@qq.com', NULL, '/article/19', '2024-10-15 17:13:28', 0, 43422, 43397, '', 2);
INSERT INTO `t_comment` VALUES (43424, '2', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1752597830&spec=140', '忙里偷闲的sin', '1752597830@qq.com', NULL, '/article/19', '2024-10-15 17:13:33', 0, 43423, 43397, '', 2);
INSERT INTO `t_comment` VALUES (43425, '3', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1752597830&spec=140', '忙里偷闲的sin', '1752597830@qq.com', NULL, '/article/19', '2024-10-15 17:13:36', 0, 43424, 43397, '', 2);
INSERT INTO `t_comment` VALUES (43426, '这块应该加个分页好一点', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1752597830&spec=140', '忙里偷闲的sin', '1752597830@qq.com', NULL, '/article/19', '2024-10-15 17:13:54', 0, 43425, 43397, '', 2);
INSERT INTO `t_comment` VALUES (43427, '1111', 'https://q1.qlogo.cn/headimg_dl?dst_uin=673406219&spec=140', 'W', '673406219@qq.com', NULL, '/article/19', '2024-10-16 19:27:28', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43428, 'aaaaaaaaa', NULL, 'ddddddd', '123@qq.com', NULL, '/article/30', '2024-10-18 19:25:05', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43429, 'yse', NULL, '鸟', '2878430377@qq.com', 'nihao ', '/article/19', '2024-10-19 17:28:40', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43430, 'nihao \n', NULL, '鸟', '2878430377@qq.com', 'nihao ', '/article/19', '2024-10-19 17:28:54', 0, 43429, 43429, '', 2);
INSERT INTO `t_comment` VALUES (43431, '1', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2426651803&spec=140', 'pet name', '2426651803@qq.com', NULL, '/article/18', '2024-10-21 16:27:10', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43432, '测试一下', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2426651803&spec=140', 'pet name', '2426651803@qq.com', NULL, '/article/18', '2024-10-21 16:27:22', 0, 43431, 43431, '', 2);
INSERT INTO `t_comment` VALUES (43433, '测试一下', 'https://q1.qlogo.cn/headimg_dl?dst_uin=2096073575&spec=140', 'ㅤ', '2096073575@qq.com', NULL, '/article/18', '2024-10-21 16:28:06', 0, 43431, 43431, '', 2);
INSERT INTO `t_comment` VALUES (43434, '测试测试', 'https://q1.qlogo.cn/headimg_dl?dst_uin=2096073575&spec=140', 'ㅤ', '2096073575@qq.com', NULL, '/article/18', '2024-10-21 16:28:17', 0, 43433, 43431, '', 2);
INSERT INTO `t_comment` VALUES (43435, '😱', 'https://q3.qlogo.cn/headimg_dl?dst_uin=871361652&spec=140', '犬小哈', '871361652@qq.com', NULL, '/wiki/6?articleId=19', '2024-10-21 20:18:25', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43436, '厉害', NULL, '1515410403', '1515410403@qq.com', NULL, '/article/18', '2024-10-22 11:00:21', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43437, '555', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1329833074&spec=140', '┍ ⃢👁︵👁⃢┑', '1329833074@qq.com', '', '/article/30', '2024-10-23 11:10:36', 0, 43368, 43364, '', 2);
INSERT INTO `t_comment` VALUES (43438, '有真人么', NULL, '莫扎', '1186529220@qq.com', NULL, '/article/32', '2024-10-23 13:40:45', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43439, '当然😎', 'https://q3.qlogo.cn/headimg_dl?dst_uin=871361652&spec=140', '犬小哈', '871361652@qq.com', NULL, '/article/32', '2024-10-23 13:51:34', 0, 43438, 43438, '', 2);
INSERT INTO `t_comment` VALUES (43440, '哈哈哈', 'https://q1.qlogo.cn/headimg_dl?dst_uin=1019596125&spec=140', '小以同学', '1019596125@qq.com', NULL, '/article/32', '2024-10-24 15:50:57', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43441, '测试下', 'https://q3.qlogo.cn/headimg_dl?dst_uin=2406688153&spec=140', '先减十斤在改名', '2406688153@qq.com', NULL, '/article/19', '2024-10-24 22:20:15', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43442, 'test', NULL, '青桔ʕ̯•͡ˑ͓•̯᷅ʔ', '1645253@qq.com', 'https://api.qjqq.cn/', '/article/19', '2024-10-26 16:24:49', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43443, 'hi', NULL, '青桔ʕ̯•͡ˑ͓•̯᷅ʔ', '1645253@qq.com', 'https://api.qjqq.cn/', '/article/19', '2024-10-26 16:25:59', 0, 43442, 43442, '', 2);
INSERT INTO `t_comment` VALUES (43444, 'hello', NULL, '青桔ʕ̯•͡ˑ͓•̯᷅ʔ', '1645253@qq.com', 'https://api.qjqq.cn/', '/article/19', '2024-10-26 16:26:26', 0, 43443, 43442, '', 2);
INSERT INTO `t_comment` VALUES (43445, '1', 'https://q4.qlogo.cn/headimg_dl?dst_uin=2208410794&spec=140', '氼乚', '2208410794@qq.com', NULL, '/article/19', '2024-10-26 22:01:45', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43446, 'test', 'https://q4.qlogo.cn/headimg_dl?dst_uin=2984272415&spec=140', '.', '2984272415@qq.com', NULL, '/article/19', '2024-10-29 09:13:27', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43447, '666', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2742910476&spec=140', '江流', '2742910476@qq.com', NULL, '/article/29', '2024-10-29 09:37:20', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43448, '6666', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2742910476&spec=140', '江流', '2742910476@qq.com', NULL, '/article/29', '2024-10-29 09:37:26', 0, 43447, 43447, '', 2);
INSERT INTO `t_comment` VALUES (43449, '111', 'https://q4.qlogo.cn/headimg_dl?dst_uin=2984272415&spec=140', '.', '2984272415@qq.com', NULL, '/article/29', '2024-10-29 09:37:40', 0, 43447, 43447, '', 2);
INSERT INTO `t_comment` VALUES (43450, '666', 'https://q1.qlogo.cn/headimg_dl?dst_uin=739527029&spec=140', 'Gifted', '739527029@qq.com', NULL, '/article/29', '2024-10-29 09:37:57', 0, 43449, 43447, '', 2);
INSERT INTO `t_comment` VALUES (43451, 'teat', NULL, 'hh', '2311679060@qq.com', NULL, '/article/19', '2024-10-29 18:35:23', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43452, '加入星球里面之后 会有博客项目的视频吗?', 'https://q4.qlogo.cn/headimg_dl?dst_uin=2481386604&spec=140', 'Horizon', '2481386604@qq.com', NULL, '/article/29', '2024-10-30 15:34:00', 0, NULL, NULL, '系统拦截，包含敏感词：[视频]', 3);
INSERT INTO `t_comment` VALUES (43453, '加入星球里面之后 会有boke项目的视频吗?', 'https://q4.qlogo.cn/headimg_dl?dst_uin=2481386604&spec=140', 'Horizon', '2481386604@qq.com', NULL, '/article/29', '2024-10-30 15:34:11', 0, NULL, NULL, '系统拦截，包含敏感词：[视频]', 3);
INSERT INTO `t_comment` VALUES (43454, '加入xingqiu里面之后 会有boke项目的视频吗?', 'https://q4.qlogo.cn/headimg_dl?dst_uin=2481386604&spec=140', 'Horizon', '2481386604@qq.com', NULL, '/article/29', '2024-10-30 15:34:24', 0, NULL, NULL, '系统拦截，包含敏感词：[视频]', 3);
INSERT INTO `t_comment` VALUES (43455, '加入xingqiu里面之后 会有boke项目的ship吗?', 'https://q4.qlogo.cn/headimg_dl?dst_uin=2481386604&spec=140', 'Horizon', '2481386604@qq.com', NULL, '/article/29', '2024-10-30 15:34:30', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43456, '你指的是源码不', 'https://q3.qlogo.cn/headimg_dl?dst_uin=871361652&spec=140', '犬小哈', '871361652@qq.com', NULL, '/article/29', '2024-10-30 15:36:30', 0, 43455, 43455, '', 2);
INSERT INTO `t_comment` VALUES (43457, '只有文档对吗', 'https://q4.qlogo.cn/headimg_dl?dst_uin=2481386604&spec=140', 'Horizon', '2481386604@qq.com', NULL, '/article/29', '2024-10-30 15:38:48', 0, 43456, 43455, '', 2);
INSERT INTO `t_comment` VALUES (43458, '图文专栏模式哈，基本每一个关键步骤都有截图，比普通文档要详细的多哈~', 'https://q3.qlogo.cn/headimg_dl?dst_uin=871361652&spec=140', '犬小哈', '871361652@qq.com', NULL, '/article/29', '2024-10-30 15:41:22', 0, 43457, 43455, '', 2);
INSERT INTO `t_comment` VALUES (43459, '可以先加入看看，xinqiu支持 3 天无理由退款的~😎', 'https://q3.qlogo.cn/headimg_dl?dst_uin=871361652&spec=140', '犬小哈', '871361652@qq.com', NULL, '/article/29', '2024-10-30 15:42:15', 0, 43457, 43455, '', 2);
INSERT INTO `t_comment` VALUES (43460, '好的哥', 'https://q4.qlogo.cn/headimg_dl?dst_uin=2481386604&spec=140', 'Horizon', '2481386604@qq.com', NULL, '/article/29', '2024-10-30 15:43:14', 0, 43459, 43455, '', 2);
INSERT INTO `t_comment` VALUES (43461, '👌👌👌', 'https://q3.qlogo.cn/headimg_dl?dst_uin=871361652&spec=140', '犬小哈', '871361652@qq.com', NULL, '/article/29', '2024-10-30 15:44:09', 0, 43460, 43455, '', 2);
INSERT INTO `t_comment` VALUES (43462, 'lihai ', NULL, 'test', 'ngocn42840@gmail.com', NULL, '/article/29', '2024-10-31 18:45:49', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43463, 'test', 'https://q3.qlogo.cn/headimg_dl?dst_uin=3403542781&spec=140', '莪', '3403542781@qq.com', NULL, '/article/19', '2024-11-01 09:00:44', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43464, '123', NULL, '123', '123@qq.com', NULL, '/article/17', '2024-11-01 20:28:46', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43465, '欢迎访问', NULL, '123', '123@qq.com', 'http://60.204.242.251/', '/article/17', '2024-11-01 20:29:24', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43466, 'test', 'https://q3.qlogo.cn/headimg_dl?dst_uin=940657856&spec=140', '七分靠打拼~', '940657856@qq.com', '', '/article/19', '2024-11-01 21:57:06', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43467, '测试一下', 'https://q1.qlogo.cn/headimg_dl?dst_uin=1666397814&spec=140', 'xiezhr', '1666397814@qq.com', 'https://www.xiezhrspace.cn', '/article/32', '2024-11-02 17:24:27', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43468, '22', 'https://q3.qlogo.cn/headimg_dl?dst_uin=201130389&spec=140', '。', '201130389@qq.com', NULL, '/article/19', '2024-11-04 23:59:46', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43469, '2555', 'https://q4.qlogo.cn/headimg_dl?dst_uin=893474274&spec=140', '辛', '893474274@qq.com', NULL, '/wiki/6?articleId=17', '2024-11-05 14:55:59', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43470, '32333', 'https://q4.qlogo.cn/headimg_dl?dst_uin=893474274&spec=140', '辛', '893474274@qq.com', NULL, '/wiki/6?articleId=17', '2024-11-05 14:56:09', 0, 43469, 43469, '', 2);
INSERT INTO `t_comment` VALUES (43471, '122', 'https://q4.qlogo.cn/headimg_dl?dst_uin=893474274&spec=140', '辛', '893474274@qq.com', NULL, '/wiki/6?articleId=17', '2024-11-05 14:56:22', 0, 43470, 43469, '', 2);
INSERT INTO `t_comment` VALUES (43472, '2222', 'https://q4.qlogo.cn/headimg_dl?dst_uin=893474274&spec=140', '辛', '893474274@qq.com', NULL, '/wiki/6?articleId=17', '2024-11-05 14:56:25', 0, 43471, 43469, '', 2);
INSERT INTO `t_comment` VALUES (43473, '21111', 'https://q4.qlogo.cn/headimg_dl?dst_uin=893474274&spec=140', '辛', '893474274@qq.com', NULL, '/wiki/6?articleId=17', '2024-11-05 14:56:30', 0, 43472, 43469, '', 2);
INSERT INTO `t_comment` VALUES (43474, '222333', 'https://q4.qlogo.cn/headimg_dl?dst_uin=893474274&spec=140', '辛', '893474274@qq.com', NULL, '/wiki/6?articleId=17', '2024-11-05 14:56:33', 0, 43473, 43469, '', 2);
INSERT INTO `t_comment` VALUES (43475, '1112', 'https://q4.qlogo.cn/headimg_dl?dst_uin=893474274&spec=140', '辛', '893474274@qq.com', NULL, '/wiki/6?articleId=17', '2024-11-05 14:56:36', 0, 43474, 43469, '', 2);
INSERT INTO `t_comment` VALUES (43476, '222', 'https://q4.qlogo.cn/headimg_dl?dst_uin=893474274&spec=140', '辛', '893474274@qq.com', NULL, '/wiki/6?articleId=17', '2024-11-05 14:56:39', 0, 43475, 43469, '', 2);
INSERT INTO `t_comment` VALUES (43477, '333333333', 'https://q4.qlogo.cn/headimg_dl?dst_uin=893474274&spec=140', '辛', '893474274@qq.com', NULL, '/wiki/6?articleId=17', '2024-11-05 14:56:42', 0, 43476, 43469, '系统拦截，包含敏感词：[333333333]', 3);
INSERT INTO `t_comment` VALUES (43478, '31', 'https://q4.qlogo.cn/headimg_dl?dst_uin=893474274&spec=140', '辛', '893474274@qq.com', NULL, '/wiki/6?articleId=17', '2024-11-05 14:56:46', 0, 43476, 43469, '', 2);
INSERT INTO `t_comment` VALUES (43479, '3333333333333333333333333333', 'https://q4.qlogo.cn/headimg_dl?dst_uin=893474274&spec=140', '辛', '893474274@qq.com', NULL, '/wiki/6?articleId=17', '2024-11-05 14:56:50', 0, 43478, 43469, '系统拦截，包含敏感词：[3333333333333333333333333333]', 3);
INSERT INTO `t_comment` VALUES (43480, '122', 'https://q4.qlogo.cn/headimg_dl?dst_uin=893474274&spec=140', '辛', '893474274@qq.com', NULL, '/wiki/6?articleId=17', '2024-11-05 14:56:52', 0, 43478, 43469, '', 2);
INSERT INTO `t_comment` VALUES (43481, '32', 'https://q4.qlogo.cn/headimg_dl?dst_uin=893474274&spec=140', '辛', '893474274@qq.com', NULL, '/wiki/6?articleId=17', '2024-11-05 14:56:55', 0, 43480, 43469, '', 2);
INSERT INTO `t_comment` VALUES (43482, '31', 'https://q4.qlogo.cn/headimg_dl?dst_uin=893474274&spec=140', '辛', '893474274@qq.com', NULL, '/wiki/6?articleId=17', '2024-11-05 14:56:58', 0, 43481, 43469, '', 2);
INSERT INTO `t_comment` VALUES (43483, '32', 'https://q4.qlogo.cn/headimg_dl?dst_uin=893474274&spec=140', '辛', '893474274@qq.com', NULL, '/wiki/6?articleId=17', '2024-11-05 14:57:01', 0, 43482, 43469, '', 2);
INSERT INTO `t_comment` VALUES (43484, '31', 'https://q4.qlogo.cn/headimg_dl?dst_uin=893474274&spec=140', '辛', '893474274@qq.com', NULL, '/wiki/6?articleId=17', '2024-11-05 14:57:03', 0, 43483, 43469, '', 2);
INSERT INTO `t_comment` VALUES (43485, '123', NULL, 'wss', 'wushusong812@163.com', 'http://wushusong.center.takin.cc/', '/wiki/8?articleId=18', '2024-11-05 16:11:54', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43486, '帅哥', NULL, 'antidote', '1724629985@qq.com', NULL, '/article/18', '2024-11-06 16:34:00', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43487, 'test', NULL, '安安', '1008611@ikun.com', NULL, '/article/32', '2024-11-08 22:40:54', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43488, '1', NULL, 'e', '2947049762@qq.com', '1', '/article/32', '2024-11-10 13:13:28', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43489, '111', 'https://q4.qlogo.cn/headimg_dl?dst_uin=739527029&spec=140', 'Gifted', '739527029@qq.com', NULL, '/article/29', '2024-11-10 17:09:42', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43490, '11', 'https://q1.qlogo.cn/headimg_dl?dst_uin=2984272415&spec=140', '.', '2984272415@qq.com', NULL, '/article/19', '2024-11-10 21:21:22', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43491, '111', 'https://q1.qlogo.cn/headimg_dl?dst_uin=2984272415&spec=140', '.', '2984272415@qq.com', NULL, '/article/19', '2024-11-10 21:21:28', 0, 43490, 43490, '', 2);
INSERT INTO `t_comment` VALUES (43492, '111', 'https://q1.qlogo.cn/headimg_dl?dst_uin=2984272415&spec=140', '.', '2984272415@qq.com', NULL, '/article/19', '2024-11-10 21:21:31', 0, 43490, 43490, '', 2);
INSERT INTO `t_comment` VALUES (43493, '111', 'https://q1.qlogo.cn/headimg_dl?dst_uin=2984272415&spec=140', '.', '2984272415@qq.com', NULL, '/article/19', '2024-11-10 21:21:55', 0, 43468, 43468, '', 2);
INSERT INTO `t_comment` VALUES (43494, '5553', 'https://q1.qlogo.cn/headimg_dl?dst_uin=2984272415&spec=140', '.', '2984272415@qq.com', NULL, '/article/19', '2024-11-10 21:22:00', 0, 43468, 43468, '', 2);
INSERT INTO `t_comment` VALUES (43495, '585563', 'https://q1.qlogo.cn/headimg_dl?dst_uin=2984272415&spec=140', '.', '2984272415@qq.com', NULL, '/article/19', '2024-11-10 21:25:45', 0, 43468, 43468, '', 2);
INSERT INTO `t_comment` VALUES (43496, '12552', 'https://q1.qlogo.cn/headimg_dl?dst_uin=2984272415&spec=140', '.', '2984272415@qq.com', NULL, '/article/19', '2024-11-10 21:25:58', 0, 43468, 43468, '', 2);
INSERT INTO `t_comment` VALUES (43497, '2553536', 'https://q1.qlogo.cn/headimg_dl?dst_uin=2984272415&spec=140', '.', '2984272415@qq.com', NULL, '/article/19', '2024-11-10 21:26:10', 0, 43468, 43468, '', 2);
INSERT INTO `t_comment` VALUES (43498, '2252', 'https://q1.qlogo.cn/headimg_dl?dst_uin=2984272415&spec=140', '.', '2984272415@qq.com', NULL, '/article/19', '2024-11-10 21:49:34', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43499, '44452', 'https://q1.qlogo.cn/headimg_dl?dst_uin=2984272415&spec=140', '.', '2984272415@qq.com', NULL, '/article/19', '2024-11-10 21:49:40', 0, 43498, 43498, '', 2);
INSERT INTO `t_comment` VALUES (43500, '11', 'https://qh.qlogo.cn/g?b=sdk&ek=AQTbQEPmyPmOib372gopp7lZjUiaQOlezHFMEd6r88lUhfd4aL8PVO5ZgxKlcJeRDPmLPekBG8&s=100&t=1675329160', '沐', '3388616682@qq.com', '', '/article/32', '2024-11-10 23:49:12', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43501, '棒棒', 'https://q3.qlogo.cn/headimg_dl?dst_uin=994392057&spec=140', 'add oil', 'mulin996377@gmail.com', NULL, '/article/30', '2024-11-12 15:59:28', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43502, '牛逼', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2729019991&spec=140', '～', '2729019991@qq.com', 'http://www.lyk.xz.cn', '/article/19', '2024-11-12 16:52:19', 0, NULL, NULL, '系统拦截，包含敏感词：[牛逼]', 3);
INSERT INTO `t_comment` VALUES (43503, '牛b', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2729019991&spec=140', '～', '2729019991@qq.com', 'http://www.lyk.xz.cn', '/article/19', '2024-11-12 16:52:23', 0, NULL, NULL, '系统拦截，包含敏感词：[牛b]', 3);
INSERT INTO `t_comment` VALUES (43504, '强强强，棒棒棒', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2729019991&spec=140', '～', '2729019991@qq.com', 'http://www.lyk.xz.cn', '/article/19', '2024-11-12 16:52:44', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43505, '111', 'https://q4.qlogo.cn/headimg_dl?dst_uin=123123&spec=140', 'ken', '123123@qq.com', '1231231', '/article/32', '2024-11-14 12:50:15', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43506, '111', 'https://q4.qlogo.cn/headimg_dl?dst_uin=123123&spec=140', 'ken', '123123@qq.com', '1231231', '/article/32', '2024-11-14 12:50:15', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43507, 'test', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2729019991&spec=140', '～', '2729019991@qq.com', NULL, '/article/19', '2024-11-14 16:18:54', 0, 43451, 43451, '', 2);
INSERT INTO `t_comment` VALUES (43508, 't2', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2729019991&spec=140', '～', '2729019991@qq.com', NULL, '/article/19', '2024-11-14 16:19:16', 0, 43507, 43451, '', 2);
INSERT INTO `t_comment` VALUES (43509, 't1', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2729019991&spec=140', '～', '2729019991@qq.com', NULL, '/article/19', '2024-11-14 16:35:28', 0, 43504, 43504, '', 2);
INSERT INTO `t_comment` VALUES (43510, 't2', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2729019991&spec=140', '～', '2729019991@qq.com', NULL, '/article/19', '2024-11-14 16:35:41', 0, 43504, 43504, '', 2);
INSERT INTO `t_comment` VALUES (43511, 't11', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2729019991&spec=140', '～', '2729019991@qq.com', NULL, '/article/19', '2024-11-14 16:35:57', 0, 43509, 43504, '', 2);
INSERT INTO `t_comment` VALUES (43512, 't', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2729019991&spec=140', '～', '2729019991@qq.com', NULL, '/article/19', '2024-11-14 16:36:50', 0, 43509, 43504, '', 2);
INSERT INTO `t_comment` VALUES (43513, '1', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2729019991&spec=140', '～', '2729019991@qq.com', NULL, '/article/19', '2024-11-14 16:44:22', 0, 43509, 43504, '', 2);
INSERT INTO `t_comment` VALUES (43514, 'q', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2729019991&spec=140', '～', '2729019991@qq.com', NULL, '/article/29', '2024-11-14 16:45:18', 0, 43509, 43504, '', 2);
INSERT INTO `t_comment` VALUES (43515, 'a', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2729019991&spec=140', '～', '2729019991@qq.com', NULL, '/article/32', '2024-11-14 16:46:10', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43516, 'a', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2729019991&spec=140', '～', '2729019991@qq.com', NULL, '/article/32', '2024-11-14 16:46:18', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43517, 'a', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2729019991&spec=140', '～', '2729019991@qq.com', NULL, '/article/32', '2024-11-14 17:42:53', 0, 43438, 43438, '', 2);
INSERT INTO `t_comment` VALUES (43518, 'a', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2729019991&spec=140', '～', '2729019991@qq.com', NULL, '/article/32', '2024-11-14 17:43:14', 0, 43438, 43438, '', 2);
INSERT INTO `t_comment` VALUES (43519, 'a', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2729019991&spec=140', '～', '2729019991@qq.com', NULL, '/article/32', '2024-11-14 17:43:47', 0, 43438, 43438, '', 2);
INSERT INTO `t_comment` VALUES (43520, 'a', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2729019991&spec=140', '～', '2729019991@qq.com', NULL, '/article/32', '2024-11-14 17:44:13', 0, 43517, 43438, '', 2);
INSERT INTO `t_comment` VALUES (43521, 'niu', 'https://q3.qlogo.cn/headimg_dl?dst_uin=994392057&spec=140', 'add oil', 'mulin996377@gmail.com', NULL, '/article/19', '2024-11-14 21:53:08', 0, 43498, 43498, '', 2);
INSERT INTO `t_comment` VALUES (43522, '老师你博客项目中的文章目录效果是怎么实现的', 'https://q1.qlogo.cn/headimg_dl?dst_uin=1902539531&spec=140', '再见ろ、天真', '1902539531@qq.com', NULL, '/article/19', '2024-11-19 11:10:13', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43523, '你好\n', NULL, '1223', '1692734365@qq.com', '122', '/article/19', '2024-11-19 13:47:31', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43524, '拿来当毕设咯', NULL, 'on99', '123@qq.com', NULL, '/article/32', '2024-11-19 23:53:19', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43525, '草泥马\n', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2405554770&spec=140', '111', '123@163.com', NULL, '/article/32', '2024-11-22 15:41:09', 0, 43378, 43378, '系统拦截，包含敏感词：[草泥马]', 3);
INSERT INTO `t_comment` VALUES (43526, '草尼莫', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2405554770&spec=140', '111', '123@163.com', NULL, '/article/32', '2024-11-22 15:41:19', 0, 43378, 43378, '', 2);
INSERT INTO `t_comment` VALUES (43527, '尼莫笔', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2405554770&spec=140', '111', '123@163.com', NULL, '/article/32', '2024-11-22 15:41:56', 0, 43378, 43378, '', 2);
INSERT INTO `t_comment` VALUES (43528, '666', NULL, 'efefe', '110@ikun.com', NULL, '/article/18', '2024-11-22 20:31:59', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43529, '😤', NULL, 'efefe', '110@ikun.com', NULL, '/article/18', '2024-11-22 20:32:48', 0, 43528, 43528, '', 2);
INSERT INTO `t_comment` VALUES (43530, '666', NULL, '666', '666@666.com', NULL, '/article/19', '2024-11-25 21:10:22', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43531, '667', NULL, '666', '666@666.com', NULL, '/article/19', '2024-11-25 21:10:35', 0, 43530, 43530, '', 2);
INSERT INTO `t_comment` VALUES (43532, '555', NULL, '555', '555@666.com', NULL, '/article/19', '2024-11-25 21:10:53', 0, 43531, 43530, '', 2);
INSERT INTO `t_comment` VALUES (43533, '666555', NULL, '555', '555@666.com', NULL, '/article/19', '2024-11-25 21:11:05', 0, 43532, 43530, '', 2);
INSERT INTO `t_comment` VALUES (43534, '6', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2011196913&spec=140', '1', '1@qq.com', '', '/article/32', '2024-11-27 13:36:48', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43535, 'cs', NULL, 'aka', '212312@qq.com', NULL, '/article/19', '2024-11-28 19:50:06', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43536, 'aa', NULL, 'aka', '212312@qq.com', NULL, '/article/19', '2024-11-28 19:50:13', 0, 43535, 43535, '', 2);
INSERT INTO `t_comment` VALUES (43537, '666', NULL, '204745726', '204745726@qq.com', NULL, '/article/30', '2024-11-28 19:54:04', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43538, '111', NULL, '1', '1211834809@qq.com', '1', '/article/32', '2024-12-03 14:06:39', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43539, '1111111111111111', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1211834809&spec=140', '莫胜吕', '1211834809@qq.com', '1', '/article/19', '2024-12-03 14:31:15', 0, NULL, NULL, '系统拦截，包含敏感词：[1111111111111111]', 3);
INSERT INTO `t_comment` VALUES (43540, 'aaaa', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1211834809&spec=140', 'test', '1211834809@qq.com', '1', '/article/19', '2024-12-03 14:31:28', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43541, '211', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1211834809&spec=140', 'test', '1211834809@qq.com', '1', '/article/18', '2024-12-03 14:41:27', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43542, '12', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1211834809&spec=140', 'test', '1211834809@qq.com', '1', '/article/19', '2024-12-03 15:22:53', 0, 43540, 43540, '', 2);
INSERT INTO `t_comment` VALUES (43543, 'nice！！！', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1421073512&spec=140', '强哥の程程', '1421073512@qq.com', NULL, '/article/19', '2024-12-05 10:43:05', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43544, '1231', 'https://q1.qlogo.cn/headimg_dl?dst_uin=2658305471&spec=140', '奉承', '2658305471@qq.com', NULL, '/article/32', '2024-12-07 00:52:24', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43545, '123121', 'https://q1.qlogo.cn/headimg_dl?dst_uin=2658305471&spec=140', '奉承', '2658305471@qq.com', NULL, '/article/32', '2024-12-07 00:52:37', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43546, '测试', 'https://q4.qlogo.cn/headimg_dl?dst_uin=2336731730&spec=140', '__', '2336731730@qq.com', NULL, '/article/32', '2024-12-09 15:13:52', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43547, '666', 'https://q4.qlogo.cn/headimg_dl?dst_uin=2336731730&spec=140', '__', '2336731730@qq.com', NULL, '/article/30', '2024-12-09 15:15:35', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43548, '123123', NULL, '123', '123@qq.com', '123', '/article/30', '2024-12-09 20:36:16', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43549, '哈总，去年加入的星球。怎么现在只能看文章，不能进星球了？提示没权限', NULL, '小鑫', '1761260896@qq.com', NULL, '/article/32', '2024-12-10 09:53:29', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43550, 'dsa', 'https://q3.qlogo.cn/headimg_dl?dst_uin=201130389&spec=140', '。', '201130389@qq.com', NULL, '/article/32', '2024-12-11 16:07:10', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43551, '123', 'https://q4.qlogo.cn/headimg_dl?dst_uin=20235&spec=140', '2592039806', '20235@qq.com123', '123', '/article/17', '2024-12-12 10:08:42', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43552, '非常好', 'https://q4.qlogo.cn/headimg_dl?dst_uin=123456&spec=140', '腾讯视频', '123456@qq.com', NULL, '/article/19', '2024-12-13 13:27:59', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43553, '123', 'https://q3.qlogo.cn/headimg_dl?dst_uin=123123&spec=140', 'ken', '123123@qq.com', '', '/article/29', '2024-12-13 13:58:01', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43554, '测试一波', 'https://q3.qlogo.cn/headimg_dl?dst_uin=871361652&spec=140', '犬小哈', '871361652@qq.com', NULL, '/article/19', '2024-12-15 15:31:12', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43555, '后续补上😎', 'https://q3.qlogo.cn/headimg_dl?dst_uin=871361652&spec=140', '犬小哈', '871361652@qq.com', NULL, '/article/19', '2024-12-15 16:45:37', 0, 43426, 43397, '', 2);
INSERT INTO `t_comment` VALUES (43556, '可以参考专栏里面的《文章目录 Toc 组件封装》小节：https://www.quanxiaoha.com/column/10137.html', 'https://q3.qlogo.cn/headimg_dl?dst_uin=871361652&spec=140', '犬小哈', '871361652@qq.com', NULL, '/article/19', '2024-12-15 16:47:07', 0, 43522, 43522, '系统拦截，包含敏感词：[www.quanxiaoha.com, 10137.html]', 3);
INSERT INTO `t_comment` VALUES (43557, '可以参考这小节：https://www.quanxiaoha.com/column/10137.html', 'https://q3.qlogo.cn/headimg_dl?dst_uin=871361652&spec=140', '犬小哈', '871361652@qq.com', NULL, '/article/19', '2024-12-15 16:47:19', 0, 43522, 43522, '系统拦截，包含敏感词：[www.quanxiaoha.com, 10137.html]', 3);
INSERT INTO `t_comment` VALUES (43558, '可以参考这节：https://www.quanxiaoha.com/column/10137.html', 'https://q3.qlogo.cn/headimg_dl?dst_uin=871361652&spec=140', '犬小哈', '871361652@qq.com', NULL, '/article/19', '2024-12-15 16:47:25', 0, 43522, 43522, '系统拦截，包含敏感词：[www.quanxiaoha.com, 10137.html]', 3);
INSERT INTO `t_comment` VALUES (43559, '星球专栏里面有讲解哈，前台文章详情页那章节~', 'https://q3.qlogo.cn/headimg_dl?dst_uin=871361652&spec=140', '犬小哈', '871361652@qq.com', NULL, '/article/19', '2024-12-15 16:48:32', 0, 43522, 43522, '', 2);
INSERT INTO `t_comment` VALUES (43560, '666777666777', NULL, '无聊啊无聊', 'wuliao@163.com', NULL, '/article/19', '2024-12-17 09:23:25', 0, NULL, NULL, '系统拦截，包含敏感词：[666777666777]', 3);
INSERT INTO `t_comment` VALUES (43561, '666666', NULL, '无聊啊无聊', 'wuliao@163.com', NULL, '/article/19', '2024-12-17 09:23:34', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43562, '我的也完成了', 'https://q4.qlogo.cn/headimg_dl?dst_uin=2014502771&spec=140', '彩虹秋千', '2014502771@qq.com', 'yanxuezai.top', '/article/32', '2024-12-17 21:03:47', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43563, '测试', NULL, 'aa', '1580209086@qq.com', NULL, '/article/19', '2024-12-18 08:29:36', 0, 43235, 43235, '', 2);
INSERT INTO `t_comment` VALUES (43564, '666', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1329833074&spec=140', '┍ ⃢👁︵👁⃢┑', '1329833074@qq.com', '', '/wiki/6?articleId=19', '2024-12-18 10:11:36', 0, 43316, 43315, '', 2);
INSERT INTO `t_comment` VALUES (43565, '66666', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1329833074&spec=140', '┍ ⃢👁︵👁⃢┑', '1329833074@qq.com', '', '/wiki/6?articleId=19', '2024-12-18 10:11:41', 0, 43564, 43315, '', 2);
INSERT INTO `t_comment` VALUES (43566, '666', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1329833074&spec=140', '┍ ⃢👁︵👁⃢┑', '1329833074@qq.com', '', '/wiki/6?articleId=17', '2024-12-18 10:12:32', 0, 43483, 43469, '', 2);
INSERT INTO `t_comment` VALUES (43567, '65', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1329833074&spec=140', '┍ ⃢👁︵👁⃢┑', '1329833074@qq.com', '', '/wiki/6?articleId=19', '2024-12-18 10:13:09', 0, 43226, 43226, '', 2);
INSERT INTO `t_comment` VALUES (43568, '55', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1329833074&spec=140', '┍ ⃢👁︵👁⃢┑', '1329833074@qq.com', '', '/wiki/6?articleId=19', '2024-12-18 10:13:14', 0, 43567, 43226, '', 2);
INSERT INTO `t_comment` VALUES (43569, 'fefrf', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1329833074&spec=140', '┍ ⃢👁︵👁⃢┑', '1329833074@qq.com', '', '/wiki/6?articleId=19', '2024-12-18 15:33:02', 0, 43565, 43315, '', 2);
INSERT INTO `t_comment` VALUES (43570, '666', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1329833074&spec=140', '┍ ⃢👁︵👁⃢┑', '1329833074@qq.com', '', '/wiki/6?articleId=19', '2024-12-18 15:38:39', 0, 43568, 43226, '', 2);
INSERT INTO `t_comment` VALUES (43571, '测试游戏', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2464674651&spec=140', '凝视深渊', '2464674651@qq.com', NULL, '/article/32', '2024-12-20 15:47:39', 0, 43410, 43408, '', 2);
INSERT INTO `t_comment` VALUES (43572, '666', 'https://q2.qlogo.cn/headimg_dl?dst_uin=3115885094&spec=140', '萍湘乃古東**', '3115885094@qq.com', NULL, '/wiki/7?articleId=29', '2024-12-20 18:28:05', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43573, '留言', 'https://q2.qlogo.cn/headimg_dl?dst_uin=3115885094&spec=140', '萍湘乃古東**', '3115885094@qq.com', NULL, '/article/19', '2024-12-20 18:45:05', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43574, '<h1>1</h1>', 'https://q4.qlogo.cn/headimg_dl?dst_uin=568625226&spec=140', 'aasa', 'saS@163.com', NULL, '/article/32', '2024-12-20 20:51:49', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43575, '222', 'https://q4.qlogo.cn/headimg_dl?dst_uin=568625226&spec=140', '<h1>1</h1>', 'saS@qq.com', NULL, '/article/32', '2024-12-20 20:52:45', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43576, '123456', 'https://q1.qlogo.cn/headimg_dl?dst_uin=962217620&spec=140', 'عيون النجوم', '962217620@qq.com', NULL, '/article/19', '2024-12-24 20:05:24', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43577, '3242', NULL, '方法', '11@qq.com', NULL, '/article/30', '2024-12-25 15:12:58', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43578, '888', 'https://q4.qlogo.cn/headimg_dl?dst_uin=88888&spec=140', '88888', '88888@qq.com', NULL, '/article/17', '2024-12-25 16:49:03', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43579, '111', 'https://q1.qlogo.cn/headimg_dl?dst_uin=952718932&spec=140', '七十二', '952718932@qq.com', NULL, '/article/32', '2024-12-28 14:03:40', 0, 43575, 43575, '', 2);
INSERT INTO `t_comment` VALUES (43580, '1111', 'https://q1.qlogo.cn/headimg_dl?dst_uin=952718932&spec=140', '七十二', '952718932@qq.com', NULL, '/article/30', '2024-12-28 16:42:03', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43581, '1111', 'https://q1.qlogo.cn/headimg_dl?dst_uin=952718932&spec=140', '七十二', '952718932@qq.com', NULL, '/article/30', '2024-12-28 16:42:13', 0, 43580, 43580, '', 2);
INSERT INTO `t_comment` VALUES (43582, '666', 'https://q3.qlogo.cn/headimg_dl?dst_uin=2222222&spec=140', '何鸿燊', '2222222@qq.com', '222', '/wiki/7?articleId=29', '2024-12-28 18:01:27', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43583, '哈哈哈哈哈', NULL, '小冀同学', '1479839568@qq.com', NULL, '/article/19', '2024-12-29 22:31:20', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43584, '666', NULL, 'QAQ', '2500397907@qq.com', NULL, '/article/17', '2024-12-30 10:27:26', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43585, '1111', NULL, 'aa', '1580209086@qq.com', NULL, '/article/32', '2024-12-31 14:02:32', 0, 43519, 43438, '', 2);
INSERT INTO `t_comment` VALUES (43586, '这个学完需要多久？', 'https://q1.qlogo.cn/headimg_dl?dst_uin=123456777&spec=140', '禅心语', '123456777@qq.com', NULL, '/article/19', '2025-01-02 15:06:41', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43587, '看你基础和每天花费的时间哈，有快的小伙伴，一周干到第八章的~', 'https://q2.qlogo.cn/headimg_dl?dst_uin=871361652&spec=140', '犬小哈', '871361652@qq.com', NULL, '/article/19', '2025-01-02 15:23:09', 0, 43586, 43586, '系统拦截，包含敏感词：[干到]', 3);
INSERT INTO `t_comment` VALUES (43588, '看你基础和每天花费的时间哈，有快的小伙伴，一周学到第八章的~', 'https://q2.qlogo.cn/headimg_dl?dst_uin=871361652&spec=140', '犬小哈', '871361652@qq.com', NULL, '/article/19', '2025-01-02 15:24:23', 0, 43586, 43586, '', 2);
INSERT INTO `t_comment` VALUES (43589, 'xxx', NULL, '111', '1609230800@qq.com', '111', '/article/19', '2025-01-02 16:58:47', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43590, 'ss', NULL, '111', '22@qq.com', '111', '/article/19', '2025-01-06 09:55:20', 0, 43589, 43589, '', 2);
INSERT INTO `t_comment` VALUES (43591, '😃', NULL, '111', '22@qq.com', '111', '/article/19', '2025-01-06 09:55:46', 0, 43589, 43589, '', 2);
INSERT INTO `t_comment` VALUES (43592, '测试', 'https://q3.qlogo.cn/headimg_dl?dst_uin=1021385407&spec=140', 'WmmHumYxs', '1021385407@qq.com', '111', '/article/30', '2025-01-06 09:59:58', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43593, '测试2', 'https://q3.qlogo.cn/headimg_dl?dst_uin=1021385407&spec=140', 'WmmHumYxs', '1021385407@qq.com', '111', '/article/30', '2025-01-06 10:00:56', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43594, '测试3\n', 'https://q3.qlogo.cn/headimg_dl?dst_uin=1021385407&spec=140', 'WmmHumYxs', '1021385407@qq.com', '111', '/article/30', '2025-01-06 10:01:09', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43595, '少时诵诗书少时诵诗书是撒是撒是撒', NULL, 'aa', '1580209086@qq.com', NULL, '/article/17', '2025-01-06 14:23:00', 0, 39915, 79, '', 2);
INSERT INTO `t_comment` VALUES (43596, '111', 'https://q2.qlogo.cn/headimg_dl?dst_uin=3441805535&spec=140', '苍钺山', '3441805535@qq.com', NULL, '/article/17', '2025-01-06 20:30:55', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43597, '123', 'https://q2.qlogo.cn/headimg_dl?dst_uin=3441805535&spec=140', '苍钺山', '3441805535@qq.com', NULL, '/article/17', '2025-01-06 20:31:01', 0, 43596, 43596, '', 2);
INSERT INTO `t_comment` VALUES (43598, 'nihao', 'https://q2.qlogo.cn/headimg_dl?dst_uin=1242420764&spec=140', '驭◇飞★', '1242420764@qq.com', NULL, '/article/31', '2025-01-07 23:48:29', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43599, '111111111111111111111111', NULL, '1111111111111111', '1111111111@1.1', '116.62.199.48', '/article/32', '2025-01-08 14:34:26', 0, NULL, NULL, '系统拦截，包含敏感词：[111111111111111111111111]', 3);
INSERT INTO `t_comment` VALUES (43600, '111', NULL, '1111111111111111', '1111111111@1.1', '116.62.199.48', '/article/32', '2025-01-08 14:34:32', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43601, '哇哦！！！沙发沙发！', 'https://q1.qlogo.cn/headimg_dl?dst_uin=977470281&spec=140', '小羊', '977470281@qq.com', NULL, '/article/29', '2025-01-08 15:28:19', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43602, '你好呀。', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1500521074&spec=140', '剩者为王', '1500521074@qq.com', NULL, '/article/29', '2025-01-08 20:55:38', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43603, 'wr', 'https://q1.qlogo.cn/headimg_dl?dst_uin=1754619519&spec=140', '*', '1754619519@qq.com', NULL, '/article/32', '2025-01-08 23:54:53', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43604, '3333', NULL, 'sdfsdfs', '15010065540@163.com', NULL, '/article/29', '2025-01-09 10:42:29', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43605, '色情', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1500521074&spec=140', '剩者为王', '1500521074@qq.com', NULL, '/article/29', '2025-01-09 11:15:54', 0, NULL, NULL, '系统拦截，包含敏感词：[色情]', 3);
INSERT INTO `t_comment` VALUES (43606, '色情', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1500521074&spec=140', '剩者为王', '1500521074@qq.com', NULL, '/article/29', '2025-01-09 11:15:58', 0, NULL, NULL, '系统拦截，包含敏感词：[色情]', 3);
INSERT INTO `t_comment` VALUES (43607, '色情', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1500521074&spec=140', '剩者为王', '1500521074@qq.com', NULL, '/article/29', '2025-01-09 11:16:00', 0, NULL, NULL, '系统拦截，包含敏感词：[色情]', 3);
INSERT INTO `t_comment` VALUES (43608, '测试下，哈', NULL, 'www飞', '11@11.com', '22', '/article/32', '2025-01-10 18:41:47', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43609, 'niu', 'https://q4.qlogo.cn/headimg_dl?dst_uin=1455358849&spec=140', '噼里啪啦先生', '1455358849@qq.com', NULL, '/article/31', '2025-01-11 11:14:49', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43610, '大佬这个weblog用户中心在哪~', 'https://q4.qlogo.cn/headimg_dl?dst_uin=395907941&spec=140', ',,Ծ‸Ծ,,', '395907941@qq.com', '', '/article/19', '2025-01-15 10:43:29', 0, NULL, NULL, '系统拦截，包含敏感词：[用户]', 3);
INSERT INTO `t_comment` VALUES (43611, '大佬，geete这个weblog用户在哪~', 'https://q4.qlogo.cn/headimg_dl?dst_uin=395907941&spec=140', ',,Ծ‸Ծ,,', '395907941@qq.com', '', '/article/19', '2025-01-15 10:45:01', 0, NULL, NULL, '系统拦截，包含敏感词：[用户]', 3);
INSERT INTO `t_comment` VALUES (43612, '大佬，gitee开源版本里  这个weBlog怎么注册账号呀', 'https://q4.qlogo.cn/headimg_dl?dst_uin=395907941&spec=140', ',,Ծ‸Ծ,,', '395907941@qq.com', '', '/article/19', '2025-01-15 10:45:46', 0, NULL, NULL, '系统拦截，包含敏感词：[账号]', 3);
INSERT INTO `t_comment` VALUES (43613, '大佬，gitee开源版本里  这个weBlog怎么注册账号呀', 'https://q4.qlogo.cn/headimg_dl?dst_uin=395907941&spec=140', ',,Ծ‸Ծ,,', '395907941@qq.com', '', '/article/19', '2025-01-15 10:45:50', 0, NULL, NULL, '系统拦截，包含敏感词：[账号]', 3);
INSERT INTO `t_comment` VALUES (43614, '大佬，开源版本里  这个weBlog怎么注册账号呀', 'https://q4.qlogo.cn/headimg_dl?dst_uin=395907941&spec=140', ',,Ծ‸Ծ,,', '395907941@qq.com', '', '/article/19', '2025-01-15 10:45:57', 0, NULL, NULL, '系统拦截，包含敏感词：[账号]', 3);
INSERT INTO `t_comment` VALUES (43615, '大佬，开源版本里  这个weBlog怎么', 'https://q4.qlogo.cn/headimg_dl?dst_uin=395907941&spec=140', ',,Ծ‸Ծ,,', '395907941@qq.com', '', '/article/19', '2025-01-15 10:46:00', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43616, '注册账号呀', 'https://q4.qlogo.cn/headimg_dl?dst_uin=395907941&spec=140', ',,Ծ‸Ծ,,', '395907941@qq.com', '', '/article/19', '2025-01-15 10:46:07', 0, 43615, 43615, '系统拦截，包含敏感词：[账号]', 3);
INSERT INTO `t_comment` VALUES (43617, '注册zhanghao呀', 'https://q4.qlogo.cn/headimg_dl?dst_uin=395907941&spec=140', ',,Ծ‸Ծ,,', '395907941@qq.com', '', '/article/19', '2025-01-15 10:46:12', 0, 43615, 43615, '', 2);
INSERT INTO `t_comment` VALUES (43618, '这个是个人博客，未开放注册功能，系统初始化完成后，会有个默认账号，登录后台，修改密码即可', 'https://q2.qlogo.cn/headimg_dl?dst_uin=871361652&spec=140', '犬小哈', '871361652@qq.com', NULL, '/article/19', '2025-01-15 14:50:51', 0, 43617, 43615, '系统拦截，包含敏感词：[开放, 账号, 密码]', 3);
INSERT INTO `t_comment` VALUES (43619, '这个是个人博客，未开放注册功能，系统初始化完成后，会有个默认账号，登录后台，修改密码即可', 'https://q2.qlogo.cn/headimg_dl?dst_uin=871361652&spec=140', '犬小哈', '871361652@qq.com', NULL, '/article/19', '2025-01-15 14:51:42', 0, 43617, 43615, '', 2);
INSERT INTO `t_comment` VALUES (43620, '111', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2764117299&spec=140', '。。。。', '2764117299@qq.com', NULL, '/article/17', '2025-01-15 16:39:26', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43621, '111', 'https://q2.qlogo.cn/headimg_dl?dst_uin=2764117299&spec=140', '。。。。', '2764117299@qq.com', NULL, '/article/17', '2025-01-15 16:39:46', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43622, '在线演示地址是无效了吗', NULL, '1739954617', '1739954617@qq.com', NULL, '/article/19', '2025-01-20 18:36:41', 0, NULL, NULL, '', 2);
INSERT INTO `t_comment` VALUES (43623, 'hhhh', NULL, '！', '1604064505@qq.cm', NULL, '/article/17', '2025-01-20 19:04:56', 0, NULL, NULL, '', 2);

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `content` varchar(460) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '公告内容',
  `is_show` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否展示：0：不展示 1：展示',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `is_deleted` tinyint(2) NOT NULL DEFAULT 0 COMMENT '删除标志位：0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES (1, '<b>新项目</b>: <a href=\"https://www.quanxiaoha.com/column/10247.html\" target=\"_blank\" class=\"hover:underline text-sky-600\">仿小红书</a>（微服务架构）正在更新中... 。博客项目 2 期已经完结 🎉🎉🎉，目前星球内部<a class=\"hover:underline text-sky-600\" href=\"https://www.quanxiaoha.com/column/\" target=\"_blank\">专栏</a>已更新 80w+ 字，讲解图 3365+， 欢迎<a class=\"hover:underline text-sky-600\" href=\"https://www.quanxiaoha.com/column/\" target=\"_blank\">点击试读</a>，单体项目和微服务项目都能学习 ！', 1, '2024-03-09 13:09:54', '2025-01-19 20:11:55', 0);
INSERT INTO `t_notice` VALUES (2, '测试公告1', 0, '2024-03-10 20:08:21', '2024-03-10 20:08:21', 0);
INSERT INTO `t_notice` VALUES (3, '测试公告2', 0, '2024-03-10 20:08:25', '2024-03-10 20:08:25', 0);
INSERT INTO `t_notice` VALUES (4, '测试公告3', 0, '2024-03-10 20:08:31', '2024-03-10 20:08:31', 0);
INSERT INTO `t_notice` VALUES (5, '测试公告4', 0, '2024-03-10 20:08:38', '2024-03-10 20:08:38', 0);

-- ----------------------------
-- Table structure for t_statistics_article_pv
-- ----------------------------
DROP TABLE IF EXISTS `t_statistics_article_pv`;
CREATE TABLE `t_statistics_article_pv`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pv_date` date NOT NULL COMMENT '被统计的日期',
  `pv_count` bigint(20) UNSIGNED NOT NULL COMMENT 'pv浏览量',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_pv_date`(`pv_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 443 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '统计表 - 文章 PV (浏览量)' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_statistics_article_pv
-- ----------------------------
INSERT INTO `t_statistics_article_pv` VALUES (5, '2023-11-19', 0, '2023-11-18 23:00:00', '2023-11-18 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (6, '2023-11-20', 0, '2023-11-19 23:00:00', '2023-11-19 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (7, '2023-11-21', 0, '2023-11-20 23:00:00', '2023-11-20 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (8, '2023-11-22', 0, '2023-11-21 23:00:00', '2023-11-21 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (9, '2023-11-23', 96, '2023-11-22 23:00:00', '2023-11-22 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (10, '2023-11-24', 47, '2023-11-23 23:00:00', '2023-11-23 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (12, '2023-11-25', 44, '2023-11-24 23:00:00', '2023-11-24 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (14, '2023-11-26', 62, '2023-11-25 23:00:00', '2023-11-25 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (15, '2023-11-27', 76, '2023-11-26 23:00:00', '2023-11-26 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (17, '2023-11-28', 98, '2023-11-27 23:00:00', '2023-11-27 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (19, '2023-11-29', 138, '2023-11-28 23:00:00', '2023-11-28 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (20, '2023-11-30', 56, '2023-11-29 23:00:00', '2023-11-29 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (21, '2023-12-01', 68, '2023-11-30 23:00:00', '2023-11-30 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (22, '2023-12-02', 161, '2023-12-01 23:00:00', '2023-12-01 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (23, '2023-12-03', 69, '2023-12-02 23:00:00', '2023-12-02 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (24, '2023-12-04', 83, '2023-12-03 23:00:00', '2023-12-03 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (25, '2023-12-05', 61, '2023-12-04 23:00:00', '2023-12-04 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (26, '2023-12-06', 50, '2023-12-05 23:00:00', '2023-12-05 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (27, '2023-12-07', 47, '2023-12-06 23:00:00', '2023-12-06 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (28, '2023-12-08', 68, '2023-12-07 23:00:00', '2023-12-07 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (29, '2023-12-09', 89, '2023-12-08 23:00:00', '2023-12-08 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (30, '2023-12-10', 33, '2023-12-09 23:00:00', '2023-12-09 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (31, '2023-12-11', 138, '2023-12-10 23:00:00', '2023-12-10 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (32, '2023-12-12', 251, '2023-12-11 23:00:00', '2023-12-11 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (33, '2023-12-13', 188, '2023-12-12 23:00:00', '2023-12-12 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (35, '2023-12-14', 215, '2023-12-13 23:00:00', '2023-12-13 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (36, '2023-12-15', 182, '2023-12-14 23:00:00', '2023-12-14 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (37, '2023-12-16', 100, '2023-12-15 23:00:00', '2023-12-15 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (38, '2023-12-17', 79, '2023-12-16 23:00:00', '2023-12-16 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (39, '2023-12-18', 176, '2023-12-17 23:00:00', '2023-12-17 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (40, '2023-12-19', 188, '2023-12-18 23:00:00', '2023-12-18 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (41, '2023-12-20', 176, '2023-12-19 23:00:00', '2023-12-19 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (42, '2023-12-21', 239, '2023-12-20 23:00:00', '2023-12-20 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (43, '2023-12-22', 246, '2023-12-21 23:00:00', '2023-12-21 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (44, '2023-12-23', 81, '2023-12-22 23:00:00', '2023-12-22 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (45, '2023-12-24', 113, '2023-12-23 23:00:00', '2023-12-23 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (47, '2023-12-25', 198, '2023-12-24 23:00:00', '2023-12-24 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (48, '2023-12-26', 182, '2023-12-25 23:00:00', '2023-12-25 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (49, '2023-12-27', 187, '2023-12-26 23:00:00', '2023-12-26 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (50, '2023-12-28', 148, '2023-12-27 23:00:00', '2023-12-27 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (52, '2023-12-29', 179, '2023-12-28 23:00:00', '2023-12-28 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (53, '2023-12-30', 88, '2023-12-29 23:00:00', '2023-12-29 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (54, '2023-12-31', 88, '2023-12-30 23:00:00', '2023-12-30 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (55, '2024-01-01', 65, '2023-12-31 23:00:00', '2023-12-31 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (56, '2024-01-02', 131, '2024-01-01 23:00:00', '2024-01-01 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (57, '2024-01-03', 168, '2024-01-02 23:00:00', '2024-01-02 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (58, '2024-01-04', 208, '2024-01-03 23:00:00', '2024-01-03 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (59, '2024-01-05', 338, '2024-01-04 23:00:00', '2024-01-04 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (60, '2024-01-06', 326, '2024-01-05 23:00:00', '2024-01-05 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (61, '2024-01-07', 137, '2024-01-06 23:00:00', '2024-01-06 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (63, '2024-01-08', 197, '2024-01-07 23:00:00', '2024-01-07 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (64, '2024-01-09', 245, '2024-01-08 23:00:00', '2024-01-08 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (66, '2024-01-10', 668, '2024-01-09 23:00:00', '2024-01-09 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (67, '2024-01-11', 235, '2024-01-10 23:00:00', '2024-01-10 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (68, '2024-01-12', 269, '2024-01-11 23:00:00', '2024-01-11 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (69, '2024-01-13', 93, '2024-01-12 23:00:00', '2024-01-12 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (70, '2024-01-14', 101, '2024-01-13 23:00:00', '2024-01-13 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (71, '2024-01-15', 204, '2024-01-14 23:00:00', '2024-01-14 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (72, '2024-01-16', 222, '2024-01-15 23:00:00', '2024-01-15 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (73, '2024-01-17', 160, '2024-01-16 23:00:00', '2024-01-16 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (74, '2024-01-18', 190, '2024-01-17 23:00:00', '2024-01-17 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (75, '2024-01-19', 205, '2024-01-18 23:00:00', '2024-01-18 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (76, '2024-01-20', 94, '2024-01-19 23:00:00', '2024-01-19 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (77, '2024-01-21', 104, '2024-01-20 23:00:00', '2024-01-20 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (78, '2024-01-22', 226, '2024-01-21 23:00:00', '2024-01-21 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (79, '2024-01-23', 366, '2024-01-22 23:00:00', '2024-01-22 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (81, '2024-01-24', 240, '2024-01-23 23:00:00', '2024-01-23 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (82, '2024-01-25', 149, '2024-01-24 23:00:00', '2024-01-24 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (83, '2024-01-26', 191, '2024-01-25 23:00:00', '2024-01-25 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (84, '2024-01-27', 72, '2024-01-26 23:00:00', '2024-01-26 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (85, '2024-01-28', 112, '2024-01-27 23:00:00', '2024-01-27 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (86, '2024-01-29', 262, '2024-01-28 23:00:00', '2024-01-28 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (87, '2024-01-30', 279, '2024-01-29 23:00:00', '2024-01-29 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (88, '2024-01-31', 155, '2024-01-30 23:00:00', '2024-01-30 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (89, '2024-02-01', 300, '2024-01-31 23:00:00', '2024-01-31 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (90, '2024-02-02', 182, '2024-02-01 23:00:00', '2024-02-01 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (91, '2024-02-03', 113, '2024-02-02 23:00:00', '2024-02-02 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (92, '2024-02-04', 273, '2024-02-03 23:00:00', '2024-02-03 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (93, '2024-02-05', 220, '2024-02-04 23:00:00', '2024-02-04 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (94, '2024-02-06', 130, '2024-02-05 23:00:00', '2024-02-05 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (95, '2024-02-07', 116, '2024-02-06 23:00:00', '2024-02-06 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (96, '2024-02-08', 72, '2024-02-07 23:00:00', '2024-02-07 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (97, '2024-02-09', 37, '2024-02-08 23:00:00', '2024-02-08 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (98, '2024-02-10', 36, '2024-02-09 23:00:00', '2024-02-09 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (99, '2024-02-11', 51, '2024-02-10 23:00:00', '2024-02-10 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (100, '2024-02-12', 30, '2024-02-11 23:00:00', '2024-02-11 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (101, '2024-02-13', 35, '2024-02-12 23:00:00', '2024-02-12 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (102, '2024-02-14', 48, '2024-02-13 23:00:00', '2024-02-13 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (103, '2024-02-15', 74, '2024-02-14 23:00:00', '2024-02-14 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (104, '2024-02-16', 63, '2024-02-15 23:00:00', '2024-02-15 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (105, '2024-02-17', 131, '2024-02-16 23:00:00', '2024-02-16 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (106, '2024-02-18', 278, '2024-02-17 23:00:00', '2024-02-17 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (107, '2024-02-19', 256, '2024-02-18 23:00:00', '2024-02-18 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (108, '2024-02-20', 299, '2024-02-19 23:00:00', '2024-02-19 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (109, '2024-02-21', 262, '2024-02-20 23:00:00', '2024-02-20 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (110, '2024-02-22', 206, '2024-02-21 23:00:00', '2024-02-21 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (111, '2024-02-23', 298, '2024-02-22 23:00:00', '2024-02-22 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (112, '2024-02-24', 133, '2024-02-23 23:00:00', '2024-02-23 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (113, '2024-02-25', 99, '2024-02-24 23:00:00', '2024-02-24 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (114, '2024-02-26', 242, '2024-02-25 23:00:00', '2024-02-25 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (115, '2024-02-27', 176, '2024-02-26 23:00:00', '2024-02-26 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (116, '2024-02-28', 186, '2024-02-27 23:00:00', '2024-02-27 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (117, '2024-02-29', 234, '2024-02-28 23:00:00', '2024-02-28 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (118, '2024-03-01', 173, '2024-02-29 23:00:00', '2024-02-29 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (119, '2024-03-02', 140, '2024-03-01 23:00:00', '2024-03-01 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (120, '2024-03-03', 133, '2024-03-02 23:00:00', '2024-03-02 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (121, '2024-03-04', 274, '2024-03-03 23:00:00', '2024-03-03 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (122, '2024-03-05', 264, '2024-03-04 23:00:00', '2024-03-04 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (123, '2024-03-06', 170, '2024-03-05 23:00:00', '2024-03-05 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (124, '2024-03-07', 214, '2024-03-06 23:00:00', '2024-03-06 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (125, '2024-03-08', 190, '2024-03-07 23:00:00', '2024-03-07 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (126, '2024-03-09', 92, '2024-03-08 23:00:00', '2024-03-08 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (127, '2024-03-10', 85, '2024-03-09 23:00:00', '2024-03-09 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (128, '2024-03-11', 215, '2024-03-10 23:00:00', '2024-03-10 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (129, '2024-03-12', 241, '2024-03-11 23:00:00', '2024-03-11 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (130, '2024-03-13', 250, '2024-03-12 23:00:00', '2024-03-12 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (131, '2024-03-14', 222, '2024-03-13 23:00:00', '2024-03-13 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (132, '2024-03-15', 119, '2024-03-14 23:00:00', '2024-03-14 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (133, '2024-03-16', 97, '2024-03-15 23:00:00', '2024-03-15 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (134, '2024-03-17', 78, '2024-03-16 23:00:00', '2024-03-16 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (135, '2024-03-18', 177, '2024-03-17 23:00:00', '2024-03-17 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (136, '2024-03-19', 230, '2024-03-18 23:00:00', '2024-03-18 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (137, '2024-03-20', 167, '2024-03-19 23:00:00', '2024-03-19 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (138, '2024-03-21', 133, '2024-03-20 23:00:00', '2024-03-20 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (139, '2024-03-22', 183, '2024-03-21 23:00:00', '2024-03-21 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (140, '2024-03-23', 111, '2024-03-22 23:00:00', '2024-03-22 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (141, '2024-03-24', 86, '2024-03-23 23:00:00', '2024-03-23 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (142, '2024-03-25', 207, '2024-03-24 23:00:00', '2024-03-24 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (143, '2024-03-26', 321, '2024-03-25 23:00:00', '2024-03-25 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (144, '2024-03-27', 256, '2024-03-26 23:00:00', '2024-03-26 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (145, '2024-03-28', 250, '2024-03-27 23:00:00', '2024-03-27 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (146, '2024-03-29', 220, '2024-03-28 23:00:00', '2024-03-28 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (147, '2024-03-30', 134, '2024-03-29 23:00:00', '2024-03-29 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (148, '2024-03-31', 141, '2024-03-30 23:00:00', '2024-03-30 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (149, '2024-04-01', 183, '2024-03-31 23:00:00', '2024-03-31 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (150, '2024-04-02', 164, '2024-04-01 23:00:00', '2024-04-01 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (151, '2024-04-03', 273, '2024-04-02 23:00:00', '2024-04-02 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (152, '2024-04-04', 81, '2024-04-03 23:00:00', '2024-04-03 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (153, '2024-04-05', 125, '2024-04-04 23:00:00', '2024-04-04 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (154, '2024-04-06', 160, '2024-04-05 23:00:00', '2024-04-05 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (155, '2024-04-07', 296, '2024-04-06 23:00:00', '2024-04-06 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (156, '2024-04-08', 339, '2024-04-07 23:00:00', '2024-04-07 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (157, '2024-04-09', 179, '2024-04-08 23:00:00', '2024-04-08 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (158, '2024-04-10', 220, '2024-04-09 23:00:00', '2024-04-09 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (159, '2024-04-11', 203, '2024-04-10 23:00:00', '2024-04-10 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (160, '2024-04-12', 179, '2024-04-11 23:00:00', '2024-04-11 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (161, '2024-04-13', 108, '2024-04-12 23:00:00', '2024-04-12 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (162, '2024-04-14', 93, '2024-04-13 23:00:00', '2024-04-13 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (163, '2024-04-15', 198, '2024-04-14 23:00:00', '2024-04-14 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (164, '2024-04-17', 198, '2024-04-16 23:00:00', '2024-04-16 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (165, '2024-04-18', 178, '2024-04-17 23:00:00', '2024-04-17 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (166, '2024-04-19', 223, '2024-04-18 23:00:00', '2024-04-18 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (167, '2024-04-20', 131, '2024-04-19 23:00:00', '2024-04-19 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (168, '2024-04-21', 20, '2024-04-20 23:00:00', '2024-04-20 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (169, '2024-04-22', 114, '2024-04-22 05:12:31', '2024-04-22 05:12:31');
INSERT INTO `t_statistics_article_pv` VALUES (170, '2024-04-23', 249, '2024-04-22 23:00:00', '2024-04-22 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (171, '2024-04-24', 194, '2024-04-23 23:00:00', '2024-04-23 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (172, '2024-04-25', 218, '2024-04-24 23:00:00', '2024-04-24 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (173, '2024-04-26', 129, '2024-04-25 23:00:00', '2024-04-25 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (174, '2024-04-27', 116, '2024-04-26 23:00:00', '2024-04-26 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (175, '2024-04-28', 212, '2024-04-27 23:00:00', '2024-04-27 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (176, '2024-04-29', 110, '2024-04-28 23:00:00', '2024-04-28 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (177, '2024-04-30', 163, '2024-04-29 23:00:00', '2024-04-29 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (178, '2024-05-01', 91, '2024-04-30 23:00:00', '2024-04-30 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (179, '2024-05-02', 71, '2024-05-01 23:00:00', '2024-05-01 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (180, '2024-05-03', 86, '2024-05-02 23:00:00', '2024-05-02 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (181, '2024-05-04', 89, '2024-05-03 23:00:00', '2024-05-03 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (182, '2024-05-05', 113, '2024-05-04 23:00:00', '2024-05-04 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (183, '2024-05-06', 195, '2024-05-05 23:00:00', '2024-05-05 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (184, '2024-05-07', 259, '2024-05-06 23:00:00', '2024-05-06 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (185, '2024-05-08', 502, '2024-05-07 23:00:00', '2024-05-07 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (186, '2024-05-09', 359, '2024-05-08 23:00:00', '2024-05-08 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (187, '2024-05-10', 145, '2024-05-09 23:00:00', '2024-05-09 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (188, '2024-05-11', 226, '2024-05-10 23:00:00', '2024-05-10 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (189, '2024-05-12', 115, '2024-05-11 23:00:00', '2024-05-11 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (190, '2024-05-13', 229, '2024-05-12 23:00:00', '2024-05-12 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (191, '2024-05-14', 196, '2024-05-13 23:00:00', '2024-05-13 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (192, '2024-05-15', 167, '2024-05-14 23:00:00', '2024-05-14 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (193, '2024-05-16', 149, '2024-05-15 23:00:00', '2024-05-15 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (194, '2024-05-17', 170, '2024-05-16 23:00:00', '2024-05-16 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (195, '2024-05-18', 156, '2024-05-17 23:00:00', '2024-05-17 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (196, '2024-05-19', 101, '2024-05-18 23:00:00', '2024-05-18 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (197, '2024-05-20', 215, '2024-05-19 23:00:00', '2024-05-19 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (198, '2024-05-21', 248, '2024-05-20 23:00:00', '2024-05-20 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (199, '2024-05-22', 183, '2024-05-21 23:00:00', '2024-05-21 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (200, '2024-05-23', 143, '2024-05-22 23:00:00', '2024-05-22 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (201, '2024-05-24', 193, '2024-05-23 23:00:00', '2024-05-23 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (202, '2024-05-25', 57, '2024-05-24 23:00:00', '2024-05-24 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (203, '2024-05-26', 111, '2024-05-25 23:00:00', '2024-05-25 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (204, '2024-05-27', 150, '2024-05-26 23:00:00', '2024-05-26 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (205, '2024-05-28', 232, '2024-05-27 23:00:00', '2024-05-27 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (206, '2024-05-29', 231, '2024-05-28 23:00:00', '2024-05-28 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (207, '2024-05-30', 166, '2024-05-29 23:00:00', '2024-05-29 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (208, '2024-05-31', 180, '2024-05-30 23:00:00', '2024-05-30 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (209, '2024-06-01', 109, '2024-05-31 23:00:00', '2024-05-31 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (210, '2024-06-02', 93, '2024-06-01 23:00:00', '2024-06-01 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (211, '2024-06-03', 231, '2024-06-02 23:00:00', '2024-06-02 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (212, '2024-06-04', 245, '2024-06-03 23:00:00', '2024-06-03 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (213, '2024-06-05', 255, '2024-06-04 23:00:00', '2024-06-04 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (214, '2024-06-06', 172, '2024-06-05 23:00:00', '2024-06-05 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (215, '2024-06-07', 163, '2024-06-06 23:00:00', '2024-06-06 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (216, '2024-06-08', 81, '2024-06-07 23:00:00', '2024-06-07 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (217, '2024-06-09', 91, '2024-06-08 23:00:00', '2024-06-08 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (218, '2024-06-10', 89, '2024-06-09 23:00:00', '2024-06-09 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (219, '2024-06-11', 201, '2024-06-10 23:00:00', '2024-06-10 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (220, '2024-06-12', 257, '2024-06-11 23:00:00', '2024-06-11 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (221, '2024-06-13', 146, '2024-06-12 23:00:00', '2024-06-12 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (222, '2024-06-14', 189, '2024-06-13 23:00:00', '2024-06-13 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (223, '2024-06-15', 164, '2024-06-14 23:00:00', '2024-06-14 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (224, '2024-06-16', 128, '2024-06-15 23:00:00', '2024-06-15 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (225, '2024-06-17', 272, '2024-06-16 23:00:00', '2024-06-16 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (226, '2024-06-18', 198, '2024-06-17 23:00:00', '2024-06-17 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (227, '2024-06-19', 216, '2024-06-18 23:00:00', '2024-06-18 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (228, '2024-06-20', 151, '2024-06-19 23:00:00', '2024-06-19 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (229, '2024-06-21', 216, '2024-06-20 23:00:00', '2024-06-20 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (230, '2024-06-22', 160, '2024-06-21 23:00:00', '2024-06-21 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (231, '2024-06-23', 64, '2024-06-22 23:00:00', '2024-06-22 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (232, '2024-06-24', 182, '2024-06-23 23:00:00', '2024-06-23 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (233, '2024-06-25', 122, '2024-06-24 23:00:00', '2024-06-24 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (234, '2024-06-26', 135, '2024-06-25 23:00:00', '2024-06-25 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (235, '2024-06-27', 130, '2024-06-26 23:00:00', '2024-06-26 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (236, '2024-06-28', 121, '2024-06-27 23:00:00', '2024-06-27 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (237, '2024-06-29', 96, '2024-06-28 23:00:00', '2024-06-28 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (238, '2024-06-30', 80, '2024-06-29 23:00:00', '2024-06-29 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (239, '2024-07-01', 169, '2024-06-30 23:00:00', '2024-06-30 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (240, '2024-07-02', 124, '2024-07-01 23:00:00', '2024-07-01 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (241, '2024-07-03', 164, '2024-07-02 23:00:00', '2024-07-02 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (242, '2024-07-04', 170, '2024-07-03 23:00:00', '2024-07-03 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (243, '2024-07-05', 99, '2024-07-04 23:00:00', '2024-07-04 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (244, '2024-07-06', 114, '2024-07-05 23:00:00', '2024-07-05 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (245, '2024-07-07', 99, '2024-07-06 23:00:00', '2024-07-06 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (246, '2024-07-08', 138, '2024-07-07 23:00:00', '2024-07-07 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (247, '2024-07-09', 158, '2024-07-08 23:00:00', '2024-07-08 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (248, '2024-07-10', 191, '2024-07-09 23:00:00', '2024-07-09 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (249, '2024-07-11', 195, '2024-07-10 23:00:00', '2024-07-10 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (250, '2024-07-12', 108, '2024-07-11 23:00:00', '2024-07-11 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (251, '2024-07-13', 58, '2024-07-12 23:00:00', '2024-07-12 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (252, '2024-07-14', 68, '2024-07-13 23:00:00', '2024-07-13 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (253, '2024-07-15', 138, '2024-07-14 23:00:00', '2024-07-14 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (254, '2024-07-16', 171, '2024-07-15 23:00:00', '2024-07-15 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (255, '2024-07-17', 156, '2024-07-16 23:00:00', '2024-07-16 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (256, '2024-07-18', 114, '2024-07-17 23:00:00', '2024-07-17 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (257, '2024-07-19', 146, '2024-07-18 23:00:00', '2024-07-18 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (258, '2024-07-20', 68, '2024-07-19 23:00:00', '2024-07-19 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (259, '2024-07-21', 65, '2024-07-20 23:00:00', '2024-07-20 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (260, '2024-07-22', 180, '2024-07-21 23:00:00', '2024-07-21 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (261, '2024-07-23', 141, '2024-07-22 23:00:00', '2024-07-22 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (262, '2024-07-24', 171, '2024-07-23 23:00:00', '2024-07-23 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (263, '2024-07-25', 111, '2024-07-24 23:00:00', '2024-07-24 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (264, '2024-07-26', 117, '2024-07-25 23:00:00', '2024-07-25 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (265, '2024-07-27', 56, '2024-07-26 23:00:00', '2024-07-26 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (266, '2024-07-28', 77, '2024-07-27 23:00:00', '2024-07-27 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (267, '2024-07-29', 104, '2024-07-28 23:00:00', '2024-07-28 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (268, '2024-07-30', 149, '2024-07-29 23:00:00', '2024-07-29 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (269, '2024-07-31', 135, '2024-07-30 23:00:00', '2024-07-30 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (270, '2024-08-01', 110, '2024-07-31 23:00:00', '2024-07-31 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (271, '2024-08-02', 115, '2024-08-01 23:00:00', '2024-08-01 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (272, '2024-08-03', 92, '2024-08-02 23:00:00', '2024-08-02 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (273, '2024-08-04', 54, '2024-08-03 23:00:00', '2024-08-03 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (274, '2024-08-05', 148, '2024-08-04 23:00:00', '2024-08-04 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (275, '2024-08-06', 149, '2024-08-05 23:00:00', '2024-08-05 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (276, '2024-08-07', 157, '2024-08-06 23:00:00', '2024-08-06 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (277, '2024-08-08', 107, '2024-08-07 23:00:00', '2024-08-07 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (278, '2024-08-09', 164, '2024-08-08 23:00:00', '2024-08-08 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (279, '2024-08-10', 98, '2024-08-09 23:00:00', '2024-08-09 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (280, '2024-08-11', 86, '2024-08-10 23:00:00', '2024-08-10 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (281, '2024-08-12', 122, '2024-08-11 23:00:00', '2024-08-11 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (282, '2024-08-13', 123, '2024-08-12 23:00:00', '2024-08-12 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (283, '2024-08-14', 135, '2024-08-13 23:00:00', '2024-08-13 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (284, '2024-08-15', 109, '2024-08-14 23:00:00', '2024-08-14 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (285, '2024-08-16', 143, '2024-08-15 23:00:00', '2024-08-15 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (286, '2024-08-17', 75, '2024-08-16 23:00:00', '2024-08-16 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (287, '2024-08-18', 67, '2024-08-17 23:00:00', '2024-08-17 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (288, '2024-08-19', 158, '2024-08-18 23:00:00', '2024-08-18 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (289, '2024-08-20', 162, '2024-08-19 23:00:00', '2024-08-19 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (290, '2024-08-21', 149, '2024-08-20 23:00:00', '2024-08-20 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (291, '2024-08-22', 110, '2024-08-21 23:00:00', '2024-08-21 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (292, '2024-08-23', 125, '2024-08-22 23:00:00', '2024-08-22 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (293, '2024-08-24', 54, '2024-08-23 23:00:00', '2024-08-23 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (294, '2024-08-25', 94, '2024-08-24 23:00:00', '2024-08-24 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (295, '2024-08-26', 6468, '2024-08-25 23:00:00', '2024-08-25 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (296, '2024-08-27', 10435, '2024-08-26 23:00:00', '2024-08-26 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (297, '2024-08-28', 136, '2024-08-27 23:00:00', '2024-08-27 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (298, '2024-08-29', 117, '2024-08-28 23:00:00', '2024-08-28 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (299, '2024-08-30', 50, '2024-08-29 23:00:00', '2024-08-29 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (300, '2024-08-31', 51, '2024-08-30 23:00:00', '2024-08-30 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (301, '2024-09-01', 63, '2024-08-31 23:00:00', '2024-08-31 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (302, '2024-09-02', 130, '2024-09-01 23:00:00', '2024-09-01 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (303, '2024-09-03', 142, '2024-09-02 23:00:00', '2024-09-02 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (304, '2024-09-04', 143, '2024-09-03 23:00:00', '2024-09-03 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (305, '2024-09-05', 144, '2024-09-04 23:00:00', '2024-09-04 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (306, '2024-09-06', 111, '2024-09-05 23:00:00', '2024-09-05 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (307, '2024-09-07', 65, '2024-09-06 23:00:00', '2024-09-06 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (308, '2024-09-08', 50, '2024-09-07 23:00:00', '2024-09-07 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (309, '2024-09-09', 92, '2024-09-08 23:00:00', '2024-09-08 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (310, '2024-09-10', 171, '2024-09-09 23:00:00', '2024-09-09 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (311, '2024-09-11', 149, '2024-09-10 23:00:00', '2024-09-10 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (312, '2024-09-12', 139, '2024-09-11 23:00:00', '2024-09-11 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (313, '2024-09-13', 144, '2024-09-12 23:00:00', '2024-09-12 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (314, '2024-09-14', 125, '2024-09-13 23:00:00', '2024-09-13 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (315, '2024-09-15', 42, '2024-09-14 23:00:00', '2024-09-14 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (316, '2024-09-16', 47, '2024-09-15 23:00:00', '2024-09-15 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (317, '2024-09-17', 50, '2024-09-16 23:00:00', '2024-09-16 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (318, '2024-09-18', 142, '2024-09-17 23:00:00', '2024-09-17 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (319, '2024-09-19', 182, '2024-09-18 23:00:00', '2024-09-18 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (320, '2024-09-20', 133, '2024-09-19 23:00:00', '2024-09-19 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (321, '2024-09-21', 112, '2024-09-20 23:00:00', '2024-09-20 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (322, '2024-09-22', 87, '2024-09-21 23:00:00', '2024-09-21 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (323, '2024-09-23', 117, '2024-09-22 23:00:00', '2024-09-22 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (324, '2024-09-24', 154, '2024-09-23 23:00:00', '2024-09-23 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (325, '2024-09-25', 147, '2024-09-24 23:00:00', '2024-09-24 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (326, '2024-09-26', 168, '2024-09-25 23:00:00', '2024-09-25 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (327, '2024-09-27', 96, '2024-09-26 23:00:00', '2024-09-26 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (328, '2024-09-28', 71, '2024-09-27 23:00:00', '2024-09-27 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (329, '2024-09-29', 124, '2024-09-28 23:00:00', '2024-09-28 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (330, '2024-09-30', 87, '2024-09-29 23:00:00', '2024-09-29 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (331, '2024-10-01', 56, '2024-09-30 23:00:00', '2024-09-30 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (332, '2024-10-02', 64, '2024-10-01 23:00:00', '2024-10-01 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (333, '2024-10-03', 37, '2024-10-02 23:00:00', '2024-10-02 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (334, '2024-10-04', 53, '2024-10-03 23:00:00', '2024-10-03 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (335, '2024-10-05', 50, '2024-10-04 23:00:00', '2024-10-04 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (336, '2024-10-06', 56, '2024-10-05 23:00:00', '2024-10-05 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (337, '2024-10-07', 72, '2024-10-06 23:00:00', '2024-10-06 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (338, '2024-10-08', 163, '2024-10-07 23:00:00', '2024-10-07 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (339, '2024-10-09', 132, '2024-10-08 23:00:00', '2024-10-08 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (340, '2024-10-10', 146, '2024-10-09 23:00:00', '2024-10-09 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (341, '2024-10-11', 185, '2024-10-10 23:00:00', '2024-10-10 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (342, '2024-10-12', 126, '2024-10-11 23:00:00', '2024-10-11 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (343, '2024-10-13', 97, '2024-10-12 23:00:00', '2024-10-12 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (344, '2024-10-14', 144, '2024-10-13 23:00:00', '2024-10-13 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (345, '2024-10-15', 158, '2024-10-14 23:00:00', '2024-10-14 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (346, '2024-10-16', 118, '2024-10-15 23:00:00', '2024-10-15 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (347, '2024-10-17', 158, '2024-10-16 23:00:00', '2024-10-16 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (348, '2024-10-18', 132, '2024-10-17 23:00:00', '2024-10-17 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (349, '2024-10-19', 70, '2024-10-18 23:00:00', '2024-10-18 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (350, '2024-10-20', 110, '2024-10-19 23:00:00', '2024-10-19 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (351, '2024-10-21', 156, '2024-10-20 23:00:00', '2024-10-20 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (352, '2024-10-22', 131, '2024-10-21 23:00:00', '2024-10-21 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (353, '2024-10-23', 179, '2024-10-22 23:00:00', '2024-10-22 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (354, '2024-10-24', 159, '2024-10-23 23:00:00', '2024-10-23 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (355, '2024-10-25', 164, '2024-10-24 23:00:00', '2024-10-24 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (356, '2024-10-26', 87, '2024-10-25 23:00:00', '2024-10-25 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (357, '2024-10-27', 110, '2024-10-26 23:00:00', '2024-10-26 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (358, '2024-10-28', 141, '2024-10-27 23:00:00', '2024-10-27 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (359, '2024-10-29', 140, '2024-10-28 23:00:00', '2024-10-28 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (360, '2024-10-30', 130, '2024-10-29 23:00:00', '2024-10-29 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (361, '2024-10-31', 201, '2024-10-30 23:00:00', '2024-10-30 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (362, '2024-11-01', 162, '2024-10-31 23:00:00', '2024-10-31 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (363, '2024-11-02', 105, '2024-11-01 23:00:00', '2024-11-01 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (364, '2024-11-03', 79, '2024-11-02 23:00:00', '2024-11-02 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (365, '2024-11-04', 168, '2024-11-03 23:00:00', '2024-11-03 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (366, '2024-11-05', 173, '2024-11-04 23:00:00', '2024-11-04 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (367, '2024-11-06', 142, '2024-11-05 23:00:00', '2024-11-05 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (368, '2024-11-07', 127, '2024-11-06 23:00:00', '2024-11-06 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (369, '2024-11-08', 150, '2024-11-07 23:00:00', '2024-11-07 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (370, '2024-11-09', 103, '2024-11-08 23:00:00', '2024-11-08 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (371, '2024-11-10', 95, '2024-11-09 23:00:00', '2024-11-09 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (372, '2024-11-11', 149, '2024-11-10 23:00:00', '2024-11-10 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (373, '2024-11-12', 262, '2024-11-11 23:00:00', '2024-11-11 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (374, '2024-11-13', 163, '2024-11-12 23:00:00', '2024-11-12 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (375, '2024-11-14', 146, '2024-11-13 23:00:00', '2024-11-13 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (376, '2024-11-15', 98, '2024-11-14 23:00:00', '2024-11-14 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (377, '2024-11-16', 61, '2024-11-15 23:15:05', '2024-11-15 23:15:07');
INSERT INTO `t_statistics_article_pv` VALUES (378, '2024-11-17', 16, '2024-11-16 23:00:00', '2024-11-16 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (379, '2024-11-19', 115, '2024-11-18 12:06:50', '2024-11-18 12:06:50');
INSERT INTO `t_statistics_article_pv` VALUES (380, '2024-11-20', 167, '2024-11-19 23:00:00', '2024-11-19 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (381, '2024-11-21', 110, '2024-11-20 23:00:00', '2024-11-20 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (382, '2024-11-22', 144, '2024-11-21 23:00:00', '2024-11-21 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (383, '2024-11-23', 78, '2024-11-22 23:00:00', '2024-11-22 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (384, '2024-11-24', 88, '2024-11-23 23:00:00', '2024-11-23 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (385, '2024-11-25', 177, '2024-11-24 23:00:00', '2024-11-24 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (386, '2024-11-26', 156, '2024-11-25 23:00:00', '2024-11-25 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (387, '2024-11-27', 128, '2024-11-26 23:00:00', '2024-11-26 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (388, '2024-11-28', 143, '2024-11-27 23:00:00', '2024-11-27 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (389, '2024-11-29', 133, '2024-11-28 23:00:00', '2024-11-28 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (390, '2024-11-30', 65, '2024-11-29 23:00:00', '2024-11-29 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (391, '2024-12-01', 92, '2024-11-30 23:00:00', '2024-11-30 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (392, '2024-12-02', 145, '2024-12-01 23:00:00', '2024-12-01 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (393, '2024-12-03', 145, '2024-12-02 23:00:00', '2024-12-02 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (394, '2024-12-04', 126, '2024-12-03 23:00:00', '2024-12-03 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (395, '2024-12-05', 149, '2024-12-04 23:00:00', '2024-12-04 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (396, '2024-12-06', 100, '2024-12-05 23:00:00', '2024-12-05 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (397, '2024-12-07', 59, '2024-12-06 23:00:00', '2024-12-06 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (398, '2024-12-08', 81, '2024-12-07 23:00:00', '2024-12-07 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (399, '2024-12-09', 173, '2024-12-08 23:00:00', '2024-12-08 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (400, '2024-12-10', 160, '2024-12-09 23:00:00', '2024-12-09 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (401, '2024-12-11', 185, '2024-12-10 23:00:00', '2024-12-10 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (402, '2024-12-12', 162, '2024-12-11 23:00:00', '2024-12-11 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (403, '2024-12-13', 147, '2024-12-12 23:00:00', '2024-12-12 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (404, '2024-12-14', 42, '2024-12-13 23:00:00', '2024-12-13 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (405, '2024-12-15', 80, '2024-12-14 23:00:00', '2024-12-14 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (406, '2024-12-16', 76, '2024-12-15 23:00:00', '2024-12-15 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (407, '2024-12-17', 108, '2024-12-16 23:00:00', '2024-12-16 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (408, '2024-12-18', 147, '2024-12-17 23:00:00', '2024-12-17 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (409, '2024-12-19', 135, '2024-12-18 23:00:00', '2024-12-18 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (410, '2024-12-20', 136, '2024-12-19 23:00:00', '2024-12-19 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (411, '2024-12-21', 70, '2024-12-20 23:00:00', '2024-12-20 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (412, '2024-12-22', 98, '2024-12-21 23:00:00', '2024-12-21 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (413, '2024-12-23', 166, '2024-12-22 23:00:00', '2024-12-22 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (414, '2024-12-24', 175, '2024-12-23 23:00:00', '2024-12-23 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (415, '2024-12-25', 152, '2024-12-24 23:00:00', '2024-12-24 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (416, '2024-12-26', 139, '2024-12-25 23:00:00', '2024-12-25 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (417, '2024-12-27', 132, '2024-12-26 23:00:00', '2024-12-26 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (418, '2024-12-28', 109, '2024-12-27 23:00:00', '2024-12-27 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (419, '2024-12-29', 98, '2024-12-28 23:00:00', '2024-12-28 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (420, '2024-12-30', 165, '2024-12-29 23:00:00', '2024-12-29 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (421, '2024-12-31', 153, '2024-12-30 23:00:00', '2024-12-30 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (422, '2025-01-01', 72, '2024-12-31 23:00:00', '2024-12-31 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (423, '2025-01-02', 168, '2025-01-01 23:00:00', '2025-01-01 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (424, '2025-01-03', 114, '2025-01-02 23:00:00', '2025-01-02 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (425, '2025-01-04', 73, '2025-01-03 23:00:00', '2025-01-03 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (426, '2025-01-05', 86, '2025-01-04 23:00:00', '2025-01-04 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (427, '2025-01-06', 141, '2025-01-05 23:00:00', '2025-01-05 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (428, '2025-01-07', 165, '2025-01-06 23:00:00', '2025-01-06 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (429, '2025-01-08', 149, '2025-01-07 23:00:00', '2025-01-07 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (430, '2025-01-09', 100, '2025-01-08 23:00:00', '2025-01-08 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (431, '2025-01-10', 115, '2025-01-09 23:00:00', '2025-01-09 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (432, '2025-01-11', 103, '2025-01-10 23:00:00', '2025-01-10 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (433, '2025-01-12', 76, '2025-01-11 23:00:00', '2025-01-11 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (434, '2025-01-13', 158, '2025-01-12 23:00:00', '2025-01-12 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (435, '2025-01-14', 123, '2025-01-13 23:00:00', '2025-01-13 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (436, '2025-01-15', 129, '2025-01-14 23:00:00', '2025-01-14 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (437, '2025-01-16', 129, '2025-01-15 23:00:00', '2025-01-15 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (438, '2025-01-17', 93, '2025-01-16 23:00:00', '2025-01-16 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (439, '2025-01-18', 67, '2025-01-17 23:00:00', '2025-01-17 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (440, '2025-01-19', 73, '2025-01-18 23:00:00', '2025-01-18 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (441, '2025-01-20', 86, '2025-01-19 23:00:00', '2025-01-19 23:00:00');
INSERT INTO `t_statistics_article_pv` VALUES (442, '2025-01-21', 38, '2025-01-20 23:00:00', '2025-01-20 23:00:00');

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `is_deleted` tinyint(2) NOT NULL DEFAULT 0 COMMENT '逻辑删除标志位：0：未删除 1：已删除',
  `articles_total` int(11) NOT NULL DEFAULT 0 COMMENT '此标签下文章总数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章标签表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_tag
-- ----------------------------
INSERT INTO `t_tag` VALUES (38, '专栏', '2023-11-23 11:46:07', '2023-11-23 11:46:07', 0, 3);
INSERT INTO `t_tag` VALUES (39, '知识星球', '2023-11-23 11:46:07', '2023-11-23 11:46:07', 0, 3);
INSERT INTO `t_tag` VALUES (40, '项目实战', '2023-11-23 11:46:07', '2023-11-23 11:46:07', 0, 2);
INSERT INTO `t_tag` VALUES (41, '从 0 到 1', '2023-11-23 11:46:07', '2023-11-23 11:46:07', 0, 2);
INSERT INTO `t_tag` VALUES (42, 'Python', '2023-11-23 11:46:07', '2023-11-23 11:46:07', 0, 1);
INSERT INTO `t_tag` VALUES (43, 'API 调试', '2023-11-23 11:46:07', '2023-11-23 11:46:07', 0, 1);
INSERT INTO `t_tag` VALUES (44, '工具', '2023-11-23 11:46:07', '2023-11-23 11:46:07', 0, 2);
INSERT INTO `t_tag` VALUES (45, '多模块工程', '2023-12-02 16:01:04', '2023-12-02 16:01:04', 0, 0);
INSERT INTO `t_tag` VALUES (46, '脚本', '2023-12-02 19:38:10', '2023-12-02 19:38:10', 0, 1);
INSERT INTO `t_tag` VALUES (47, '汉化', '2023-12-02 19:41:52', '2023-12-02 19:41:52', 0, 1);
INSERT INTO `t_tag` VALUES (48, '跨语言', '2023-12-02 19:43:42', '2023-12-02 19:43:42', 0, 1);
INSERT INTO `t_tag` VALUES (49, 'Elasticsearch', '2024-01-28 16:16:50', '2024-01-28 16:16:50', 0, 1);
INSERT INTO `t_tag` VALUES (50, '搜索引擎', '2024-01-28 16:16:50', '2024-01-28 16:16:50', 0, 1);
INSERT INTO `t_tag` VALUES (51, '图文教程', '2024-01-28 16:28:59', '2024-01-28 16:28:59', 0, 2);
INSERT INTO `t_tag` VALUES (52, '微服务', '2024-07-06 12:48:12', '2024-07-06 12:48:12', 0, 1);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `is_deleted` tinyint(2) NOT NULL DEFAULT 0 COMMENT '删除标志位：0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE,
  INDEX `idx_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'admin', '$2a$10$09BvXlqaPvp4YWaypfB4L.Aihs6ePpewvDcD6cuKLGEDEQ8dkZE6G', '2023-07-03 11:57:18', '2023-09-24 16:23:29', 0);
INSERT INTO `t_user` VALUES (2, 'test', '$2a$10$L6ce4rQsyJ1k7ZCOfN6X4e5dHLyvg2X0t9JFEZBezDq0lds79Pxja', '2023-07-07 01:22:05', '2023-07-07 01:22:05', 0);

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `role` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (1, 'admin', 'ROLE_ADMIN', '2023-07-07 01:21:15');
INSERT INTO `t_user_role` VALUES (2, 'test', 'ROLE_VISITOR', '2023-07-07 01:23:33');
INSERT INTO `t_user_role` VALUES (3, 'chenchen', 'ROLE_ADMIN', '2024-04-07 04:00:54');

-- ----------------------------
-- Table structure for t_wiki
-- ----------------------------
DROP TABLE IF EXISTS `t_wiki`;
CREATE TABLE `t_wiki`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `cover` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '封面',
  `summary` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '摘要',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `is_deleted` tinyint(2) NOT NULL DEFAULT 0 COMMENT '删除标志位：0：未删除 1：已删除',
  `weight` int(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '权重，用于是否置顶（0: 未置顶；>0: 参与置顶，权重值越高越靠前）',
  `is_publish` tinyint(2) NOT NULL DEFAULT 1 COMMENT '是否发布：0：未发布 1：已发布',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '知识库表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_wiki
-- ----------------------------
INSERT INTO `t_wiki` VALUES (6, 'Docker 教程', 'http://116.62.199.48:9000/weblog/d814632efadc4e0c8a40753938a1a8d8.png', '从零学习 Docker 容器', '2024-01-22 16:24:40', '2024-01-22 16:24:40', 0, 3, 1);
INSERT INTO `t_wiki` VALUES (7, 'Vue 3.x 教程', 'http://116.62.199.48:9000/weblog/aeda2bba892d4b2c80b8a5fbb3182957.png', '从零学习 Vue 3.x 前端框架', '2024-01-22 16:54:07', '2024-01-22 16:54:07', 0, 2, 1);
INSERT INTO `t_wiki` VALUES (8, 'IDEA 使用教程', 'http://116.62.199.48:9000/weblog/fc9017ff885447e594baa37ac9c655a6.png', '从零学习 Java 开发工具', '2024-01-28 16:09:37', '2024-01-28 16:09:37', 0, 0, 1);

-- ----------------------------
-- Table structure for t_wiki_catalog
-- ----------------------------
DROP TABLE IF EXISTS `t_wiki_catalog`;
CREATE TABLE `t_wiki_catalog`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `wiki_id` bigint(20) UNSIGNED NOT NULL COMMENT '知识库id',
  `article_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '文章id',
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `level` tinyint(2) NOT NULL DEFAULT 1 COMMENT '目录层级',
  `parent_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '父目录id',
  `sort` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `is_deleted` tinyint(2) NOT NULL DEFAULT 0 COMMENT '删除标志位：0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_article_id`(`article_id`) USING BTREE,
  INDEX `idx_sort`(`sort`) USING BTREE,
  INDEX `idx_wiki_id`(`wiki_id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1996 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '知识库目录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_wiki_catalog
-- ----------------------------
INSERT INTO `t_wiki_catalog` VALUES (1948, 7, NULL, '<svg t=\"1705914193628\" class=\"icon inline-block w-5 h-5 mr-2\" viewBox=\"0 0 1024 1024\" version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\" p-id=\"25162\" width=\"200\" height=\"200\"><path d=\"M204.8 860.842667h568.832\" fill=\"#FFFFFF\" p-id=\"25163\"></path><path d=\"M136.533333 217.429333h705.365334a34.133333 34.133333 0 0 1 34.133333 34.133334v432.469333A22.698667 22.698667 0 0 1 853.333333 706.730667H125.098667A22.698667 22.698667 0 0 1 102.4 684.032V251.562667a34.133333 34.133333 0 0 1 34.133333-34.133334z\" fill=\"#FCFEFF\" p-id=\"25164\"></path><path d=\"M876.032 251.562667v432.298666A22.698667 22.698667 0 0 1 853.333333 706.730667H474.453333l178.176-489.301334h189.269334a34.133333 34.133333 0 0 1 34.133333 34.133334z\" fill=\"#EDF4FF\" p-id=\"25165\"></path><path d=\"M716.8 860.842667H261.632a57.002667 57.002667 0 0 1 57.002667-56.832h341.333333A56.832 56.832 0 0 1 716.8 860.842667z\" fill=\"#FFFFFF\" p-id=\"25166\"></path><path d=\"M598.528 706.730667h-218.453333l-27.306667 97.28h273.066667l-27.306667-97.28z\" fill=\"#C3CFDE\" p-id=\"25167\"></path><path d=\"M876.032 251.562667v68.266666H102.4v-68.266666a34.133333 34.133333 0 0 1 34.133333-34.133334h705.365334a34.133333 34.133333 0 0 1 34.133333 34.133334z\" fill=\"#96DDFF\" p-id=\"25168\"></path><path d=\"M841.898667 217.429333H652.629333l-37.205333 102.4h260.608v-68.266666a34.133333 34.133333 0 0 0-34.133333-34.133334z\" fill=\"#69BAF9\" p-id=\"25169\"></path><path d=\"M716.8 860.842667H261.632a57.002667 57.002667 0 0 1 57.002667-56.832h341.333333A56.832 56.832 0 0 1 716.8 860.842667z\" fill=\"#EDF4FF\" p-id=\"25170\"></path><path d=\"M782.165333 903.168a158.549333 158.549333 0 0 0 25.6-2.048 21.845333 21.845333 0 0 1 22.698667 10.581333 22.016 22.016 0 0 0 30.208 8.021334l36.010667-20.821334a22.186667 22.186667 0 0 0 7.850666-30.037333 22.186667 22.186667 0 0 1 2.048-25.088 160.256 160.256 0 0 0 25.6-44.544 22.016 22.016 0 0 1 21.162667-14.165333 22.186667 22.186667 0 0 0 22.186667-22.186667v-41.642667a22.186667 22.186667 0 0 0-22.186667-22.186666 22.016 22.016 0 0 1-20.650667-14.336 162.645333 162.645333 0 0 0-25.6-44.544 21.845333 21.845333 0 0 1-2.56-24.917334 22.357333 22.357333 0 0 0-8.192-30.378666l-36.010666-20.821334a22.016 22.016 0 0 0-30.208 8.192 22.016 22.016 0 0 1-22.698667 10.752 148.821333 148.821333 0 0 0-51.2 0 22.016 22.016 0 0 1-22.357333-10.752 22.186667 22.186667 0 0 0-30.208-8.192l-36.010667 20.821334a22.357333 22.357333 0 0 0-8.192 30.378666 21.845333 21.845333 0 0 1-2.048 24.917334A162.645333 162.645333 0 0 0 631.466667 684.714667a22.016 22.016 0 0 1-20.48 15.018666 22.186667 22.186667 0 0 0-22.186667 22.186667v40.96a22.186667 22.186667 0 0 0 22.186667 22.186667 22.016 22.016 0 0 1 20.650666 14.165333 160.256 160.256 0 0 0 25.6 44.544 22.186667 22.186667 0 0 1 2.048 25.088 22.186667 22.186667 0 0 0 8.192 30.208l36.010667 20.821333a22.016 22.016 0 0 0 30.378667-8.021333 21.845333 21.845333 0 0 1 22.698666-10.581333 158.549333 158.549333 0 0 0 25.6 1.877333z\" fill=\"#79DEB4\" p-id=\"25171\"></path><path d=\"M975.530667 721.066667v41.642666a22.186667 22.186667 0 0 1-22.186667 22.186667 22.186667 22.186667 0 0 0-20.650667 14.336 162.645333 162.645333 0 0 1-25.6 44.544 22.528 22.528 0 0 0-4.949333 13.994667 20.992 20.992 0 0 0 2.901333 10.922666 22.357333 22.357333 0 0 1-8.192 30.378667l-36.010666 20.821333a22.016 22.016 0 0 1-30.208-8.192 22.016 22.016 0 0 0-22.698667-10.752 148.821333 148.821333 0 0 1-51.2 0 22.016 22.016 0 0 0-22.698667 10.752 22.186667 22.186667 0 0 1-30.208 8.192l-36.010666-20.821333a22.357333 22.357333 0 0 1-8.192-30.378667 20.821333 20.821333 0 0 0 2.389333-6.144l240.64-241.152a21.674667 21.674667 0 0 0 4.437333 18.773334 162.645333 162.645333 0 0 1 25.6 44.544 22.186667 22.186667 0 0 0 20.650667 14.336 22.186667 22.186667 0 0 1 22.186667 22.016z\" fill=\"#62CCA1\" p-id=\"25172\"></path><path d=\"M782.165333 742.058667m-60.416 0a60.416 60.416 0 1 0 120.832 0 60.416 60.416 0 1 0-120.832 0Z\" fill=\"#FCFEFF\" p-id=\"25173\"></path><path d=\"M159.232 268.629333m-17.066667 0a17.066667 17.066667 0 1 0 34.133334 0 17.066667 17.066667 0 1 0-34.133334 0Z\" fill=\"#3D3D63\" p-id=\"25174\"></path><path d=\"M273.066667 268.629333m-17.066667 0a17.066667 17.066667 0 1 0 34.133333 0 17.066667 17.066667 0 1 0-34.133333 0Z\" fill=\"#3D3D63\" p-id=\"25175\"></path><path d=\"M216.234667 268.629333m-17.066667 0a17.066667 17.066667 0 1 0 34.133333 0 17.066667 17.066667 0 1 0-34.133333 0Z\" fill=\"#3D3D63\" p-id=\"25176\"></path><path d=\"M341.333333 516.266667l51.2-51.2a17.066667 17.066667 0 1 0-24.234666-24.234667l-63.488 63.658667a17.066667 17.066667 0 0 0 0 24.064l63.488 63.658666a17.066667 17.066667 0 0 0 24.234666 0 17.066667 17.066667 0 0 0 0-24.064zM585.728 591.872a17.066667 17.066667 0 0 0 24.064 0L673.450667 529.066667a17.066667 17.066667 0 0 0 0-24.064l-63.658667-63.658667a17.066667 17.066667 0 0 0-24.064 24.234667l51.2 51.2-51.2 51.2a17.066667 17.066667 0 0 0 0 23.893333zM529.066667 446.293333a17.066667 17.066667 0 0 0-23.381334 6.314667L442.709333 563.2a17.066667 17.066667 0 1 0 29.525334 17.066667l63.658666-110.08a17.066667 17.066667 0 0 0-6.826666-23.893334z\" fill=\"#3D3D63\" p-id=\"25177\"></path><path d=\"M953.344 682.666667a4.949333 4.949333 0 0 1-4.608-3.242667 178.005333 178.005333 0 0 0-28.501333-49.322667 4.949333 4.949333 0 0 1 0-5.632 39.253333 39.253333 0 0 0-14.336-53.589333l-12.8-7.68V251.562667a51.2 51.2 0 0 0-51.2-51.2H136.533333a51.2 51.2 0 0 0-51.2 51.2v432.469333a39.936 39.936 0 0 0 39.765334 39.765333H358.4l-17.066667 63.146667h-22.698666a73.898667 73.898667 0 0 0-71.850667 56.832H204.8a17.066667 17.066667 0 0 0 0 34.133333h434.688a36.181333 36.181333 0 0 0 1.194667 12.117334 38.4 38.4 0 0 0 18.261333 23.893333l36.010667 20.821333a39.253333 39.253333 0 0 0 53.589333-14.506666 5.290667 5.290667 0 0 1 5.290667-2.389334 166.229333 166.229333 0 0 0 56.661333 0 5.12 5.12 0 0 1 5.290667 2.56 39.253333 39.253333 0 0 0 34.133333 19.456 38.741333 38.741333 0 0 0 19.626667-5.12l36.010666-20.821333a39.082667 39.082667 0 0 0 18.261334-23.893333 38.570667 38.570667 0 0 0-3.925334-29.696 5.12 5.12 0 0 1 0-5.802667 179.541333 179.541333 0 0 0 28.501334-49.152 4.778667 4.778667 0 0 1 4.608-3.242667 39.424 39.424 0 0 0 39.253333-39.253333v-41.642667A39.253333 39.253333 0 0 0 953.344 682.666667zM119.466667 251.562667a17.066667 17.066667 0 0 1 17.066666-17.066667h705.365334a17.066667 17.066667 0 0 1 17.066666 17.066667v51.2H119.466667z m5.632 438.101333a5.632 5.632 0 0 1-5.632-5.632V336.896h739.498666V546.133333a39.082667 39.082667 0 0 0-43.178666 17.066667 4.949333 4.949333 0 0 1-5.12 2.218667 175.274667 175.274667 0 0 0-56.661334 0 4.778667 4.778667 0 0 1-5.12-2.218667 39.082667 39.082667 0 0 0-53.589333-14.336l-36.010667 20.821333a38.229333 38.229333 0 0 0-18.261333 23.722667 39.594667 39.594667 0 0 0 3.754667 29.866667 4.608 4.608 0 0 1 0 5.632 178.005333 178.005333 0 0 0-28.501334 49.322666 4.949333 4.949333 0 0 1-4.608 3.242667 39.082667 39.082667 0 0 0-23.210666 7.68zM580.266667 786.944H375.466667l17.066666-63.146667h179.2v39.082667a39.594667 39.594667 0 0 0 8.533334 24.064z m-261.461334 34.133333h303.786667a187.733333 187.733333 0 0 0 13.312 22.698667H282.794667a39.765333 39.765333 0 0 1 35.84-22.698667z m639.658667-58.197333a5.12 5.12 0 0 1-5.12 5.12 39.424 39.424 0 0 0-36.693333 25.258667 144.384 144.384 0 0 1-22.869334 39.765333 39.424 39.424 0 0 0-3.584 44.373333 4.437333 4.437333 0 0 1 0 3.754667 4.949333 4.949333 0 0 1-2.389333 3.242667L852.309333 904.533333a5.12 5.12 0 0 1-6.997333-2.048 39.424 39.424 0 0 0-40.448-18.944 135.168 135.168 0 0 1-45.397333 0 39.424 39.424 0 0 0-40.448 19.114667 5.290667 5.290667 0 0 1-6.997334 1.877333l-36.010666-20.821333a4.949333 4.949333 0 0 1-2.389334-3.242667 4.437333 4.437333 0 0 1 0-3.754666 39.765333 39.765333 0 0 0-3.584-44.373334 142.506667 142.506667 0 0 1-23.04-39.765333A38.912 38.912 0 0 0 610.986667 768a5.12 5.12 0 0 1-5.12-5.12v-41.642667a4.949333 4.949333 0 0 1 5.12-5.12 39.253333 39.253333 0 0 0 36.522666-25.258666 140.117333 140.117333 0 0 1 23.04-39.765334 39.765333 39.765333 0 0 0 3.584-44.373333 4.778667 4.778667 0 0 1 0-3.925333 4.437333 4.437333 0 0 1 2.389334-3.072l36.010666-20.821334a4.778667 4.778667 0 0 1 2.56 0 5.12 5.12 0 0 1 4.266667 2.389334 39.594667 39.594667 0 0 0 40.448 19.114666 135.168 135.168 0 0 1 45.397333 0A39.765333 39.765333 0 0 0 845.312 580.266667a4.949333 4.949333 0 0 1 6.826667-1.706667l36.010666 20.821333a4.437333 4.437333 0 0 1 2.389334 3.072 4.778667 4.778667 0 0 1 0 3.925334 39.253333 39.253333 0 0 0 3.584 44.202666 145.237333 145.237333 0 0 1 22.869333 39.936A39.594667 39.594667 0 0 0 953.344 716.8a4.949333 4.949333 0 0 1 5.12 5.12z\" fill=\"#3D3D63\" p-id=\"25178\"></path><path d=\"M782.165333 664.576a77.482667 77.482667 0 1 0 77.482667 77.482667 77.482667 77.482667 0 0 0-77.482667-77.482667z m0 120.832a43.349333 43.349333 0 1 1 43.349334-43.349333A43.349333 43.349333 0 0 1 782.165333 785.066667z\" fill=\"#3D3D63\" p-id=\"25179\"></path></svg>环境搭建', 1, NULL, 1, '2024-01-22 11:03:34', '2024-01-22 11:03:34', 0);
INSERT INTO `t_wiki_catalog` VALUES (1949, 7, 29, '1、VSCode 安装', 2, 1948, 1, '2024-01-22 19:03:34', '2024-01-22 19:03:34', 0);
INSERT INTO `t_wiki_catalog` VALUES (1950, 7, NULL, '<svg t=\"1705914608699\" class=\"icon inline-block w-4 h-4 mr-2\" viewBox=\"0 0 1024 1024\" version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\" p-id=\"33958\" width=\"200\" height=\"200\"><path d=\"M467.2 726.556444h256v65.024h-256v-65.024zM192 414.435556H256v65.024H192v-65.024zM256 479.488h64v65.024H256v-65.024z m-64 195.043556H256V739.555556H192v-65.024zM256 609.564444h64v64.995556H256V609.564444z m64-65.024h64v65.024h-64v-65.024z\" fill=\"#707070\" p-id=\"33959\"></path><path d=\"M921.6 56.888889H102.4C44.8 56.888889 0 102.4 0 160.910222v702.179556C0 921.6 44.8 967.111111 102.4 967.111111h819.2c57.6 0 102.4-45.511111 102.4-104.021333V160.910222C1024 102.4 979.2 56.888889 921.6 56.888889zM768 141.397333h64v65.024H768V141.397333z m-128 0h64v65.024H640V141.397333z m320 721.692445c0 19.512889-19.2 38.997333-38.4 38.997333H102.4c-19.2 0-38.4-19.484444-38.4-38.997333V355.953778c0-19.484444 19.2-38.997333 38.4-38.997334h819.2c19.2 0 38.4 19.512889 38.4 38.997334v507.136z m0-656.668445H896V141.397333h64v65.024z\" fill=\"#707070\" p-id=\"33960\"></path></svg>常用指令', 1, NULL, 2, '2024-01-22 11:03:34', '2024-01-22 11:03:34', 0);
INSERT INTO `t_wiki_catalog` VALUES (1951, 7, NULL, '<svg t=\"1705915003761\" class=\"icon inline-block w-5 h-5 mr-2\" viewBox=\"0 0 1024 1024\" version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\" p-id=\"39532\" width=\"200\" height=\"200\"><path d=\"M873.813333 232.106667l-47.786666-47.786667-95.573334 95.573333 47.786667 47.786667 95.573333-95.573333zM170.666667 512H34.133333v68.266667h136.533334v-68.266667zM546.133333 68.266667h-68.266666v136.533333h68.266666V68.266667zM293.546667 279.893333L197.973333 184.32 150.186667 232.106667l95.573333 95.573333 47.786667-47.786667z m283.306666 180.906667l-58.026666-34.133333-126.293334 211.626666 136.533334 34.133334-78.506667 129.706666 58.026667 34.133334 126.293333-211.626667-136.533333-34.133333 78.506666-129.706667zM853.333333 512v68.266667h136.533334v-68.266667h-136.533334z m-68.266666 34.133333c0-150.186667-122.88-273.066667-273.066667-273.066666s-273.066667 122.88-273.066667 273.066666v341.333334H136.533333v68.266666h750.933334v-68.266666h-102.4V546.133333z m-68.266667 341.333334H307.2V546.133333c0-112.64 92.16-204.8 204.8-204.8s204.8 92.16 204.8 204.8v341.333334z\" p-id=\"39533\" fill=\"#707070\"></path></svg>事件处理', 1, NULL, 3, '2024-01-22 11:03:34', '2024-01-22 11:03:34', 0);
INSERT INTO `t_wiki_catalog` VALUES (1952, 7, NULL, '<svg t=\"1705915241815\" class=\"icon inline-block w-4 h-4 mr-2\" viewBox=\"0 0 1024 1024\" version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\" p-id=\"40689\" width=\"200\" height=\"200\"><path d=\"M924.115413 935.003037H100.143528A99.996588 99.996588 0 0 1 0.14694 835.006449V619.013819a99.996588 99.996588 0 0 1 99.996588-99.996588h823.971885a99.996588 99.996588 0 0 1 99.996588 99.996588v215.99263a99.996588 99.996588 0 0 1-99.996588 99.996588zM100.143528 599.014501a19.999318 19.999318 0 0 0-19.999318 19.999318v215.99263a19.999318 19.999318 0 0 0 19.999318 19.999317h823.971885a19.999318 19.999318 0 0 0 19.999318-19.999317V619.013819a19.999318 19.999318 0 0 0-19.999318-19.999318z\" fill=\"#707070\" p-id=\"40690\"></path><path d=\"M219.139468 1024h-9.999659a99.996588 99.996588 0 0 1-99.996588-99.996588v-11.999591a39.998635 39.998635 0 0 1 79.99727 0v11.999591a19.999318 19.999318 0 0 0 19.999318 19.999318h9.999659a19.999318 19.999318 0 0 0 19.999317-19.999318v-11.999591a39.998635 39.998635 0 0 1 79.997271 0v11.999591a99.996588 99.996588 0 0 1-99.996588 99.996588zM814.119166 1024h-9.999658a99.996588 99.996588 0 0 1-99.996588-99.996588v-11.999591a39.998635 39.998635 0 0 1 79.99727 0v11.999591a19.999318 19.999318 0 0 0 19.999318 19.999318h9.999658a19.999318 19.999318 0 0 0 19.999318-19.999318v-11.999591a39.998635 39.998635 0 0 1 79.99727 0v11.999591a99.996588 99.996588 0 0 1-99.996588 99.996588zM861.117563 787.008086a54.998123 54.998123 0 1 1 54.998123-53.998157 54.998123 54.998123 0 0 1-54.998123 53.998157zM729.122067 787.008086a54.998123 54.998123 0 1 1 54.998123-53.998157 54.998123 54.998123 0 0 1-54.998123 53.998157zM598.126536 787.008086a54.998123 54.998123 0 1 1 54.998124-53.998157 54.998123 54.998123 0 0 1-54.998124 53.998157zM304.136568 591.014774a39.998635 39.998635 0 0 1-35.998772-21.999249L4.146804 58.03296a40.248627 40.248627 0 0 1 71.997543-35.998772l263.990992 510.982565a39.998635 39.998635 0 0 1-35.998771 57.998021zM720.122374 591.014774a39.998635 39.998635 0 0 1-35.998772-57.998021L948.114594 22.034188a40.029634 40.029634 0 1 1 70.997578 36.998738L756.121145 569.015525a39.998635 39.998635 0 0 1-35.998771 21.999249zM480.130562 440.019926a39.998635 39.998635 0 0 1-27.999044-67.99768 84.9971 84.9971 0 0 1 119.995905 0 40.303625 40.303625 0 1 1-56.998055 56.998055h-6.999761a39.998635 39.998635 0 0 1-27.999045 10.999625z\" fill=\"#707070\" p-id=\"40691\"></path><path d=\"M390.133633 349.023031a39.998635 39.998635 0 0 1-27.999044-67.99768c82.997168-82.997168 217.992562-82.997168 300.989729 0a40.303625 40.303625 0 1 1-56.998055 56.998055c-51.998226-51.998226-135.99536-51.998226-187.993585 0a39.998635 39.998635 0 0 1-27.999045 10.999625z\" fill=\"#707070\" p-id=\"40692\"></path><path d=\"M730.122032 254.026272a39.998635 39.998635 0 0 1-27.999044-11.99959c-103.996452-103.996452-274.990617-103.996452-378.987069 0a40.303625 40.303625 0 0 1-56.998055-56.998055 347.988126 347.988126 0 0 1 491.983213 0 39.998635 39.998635 0 0 1-27.999045 67.997679z\" fill=\"#707070\" p-id=\"40693\"></path></svg>路由', 1, NULL, 4, '2024-01-22 11:03:34', '2024-01-22 11:03:34', 0);
INSERT INTO `t_wiki_catalog` VALUES (1982, 8, NULL, '概述', 1, NULL, 1, '2024-01-28 09:01:56', '2024-01-28 09:01:56', 0);
INSERT INTO `t_wiki_catalog` VALUES (1983, 8, 18, 'Java 执行 Python 脚本', 2, 1982, 1, '2024-01-28 17:01:57', '2024-01-28 17:01:57', 0);
INSERT INTO `t_wiki_catalog` VALUES (1984, 8, NULL, '基础', 1, NULL, 2, '2024-01-28 09:01:56', '2024-01-28 09:01:56', 0);
INSERT INTO `t_wiki_catalog` VALUES (1985, 8, NULL, '高级进阶', 1, NULL, 3, '2024-01-28 09:01:56', '2024-01-28 09:01:56', 0);
INSERT INTO `t_wiki_catalog` VALUES (1991, 6, NULL, '<svg t=\"1705912761689\" class=\"icon inline-block w-4 h-4 mr-2\" viewBox=\"0 0 1024 1024\" version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\" p-id=\"22962\" width=\"200\" height=\"200\"><path d=\"M847.071607 84.271534a11.877883 11.877883 0 0 0-3.583844-8.49883 12.594652 12.594652 0 0 0-8.806017-3.583844H189.282621a12.594652 12.594652 0 0 0-8.75482 3.583844 11.877883 11.877883 0 0 0-3.635041 8.49883v844.712055l284.557221-197.418612a89.084125 89.084125 0 0 1 101.064404 0l284.557222 197.418612V84.271534z m-327.870538 706.017288a12.748245 12.748245 0 0 0-14.437772 0l-323.825913 224.707026a50.941784 50.941784 0 0 1-51.607355 3.583844A48.023511 48.023511 0 0 1 102.4 975.829551V84.271534C102.4 61.898107 111.564401 40.497438 127.845293 24.677327 144.126185 8.857215 166.243623 0 189.282621 0h645.399125c23.038998 0 45.156436 8.857215 61.437327 24.677327 16.280892 15.820112 25.445293 37.220781 25.445293 59.594207v891.50682a48.023511 48.023511 0 0 1-26.930028 42.852536 50.941784 50.941784 0 0 1-51.607355-3.635042l-323.825914-224.655828zM313.334824 337.137335h397.192322a36.708803 36.708803 0 0 0 37.220781-36.145628 36.708803 36.708803 0 0 0-37.220781-36.09443H313.334824a36.708803 36.708803 0 0 0-37.220781 36.09443c0 19.967131 16.690474 36.145628 37.220781 36.145628z m0 192.606021h397.192322a36.708803 36.708803 0 0 0 37.220781-36.09443 36.708803 36.708803 0 0 0-37.220781-36.145627H313.334824a36.708803 36.708803 0 0 0-37.220781 36.145627c0 19.967131 16.690474 36.09443 37.220781 36.09443z\" fill=\"#707070\" p-id=\"22963\"></path></svg>概述', 1, NULL, 1, '2024-01-31 10:43:09', '2024-01-31 10:43:09', 0);
INSERT INTO `t_wiki_catalog` VALUES (1992, 6, 19, '从零手撸前后端分离博客', 2, 1991, 1, '2024-01-31 18:43:09', '2024-01-31 18:43:09', 0);
INSERT INTO `t_wiki_catalog` VALUES (1993, 6, NULL, '<svg t=\"1705912688739\" class=\"icon inline-block w-5 h-5 mr-2\" viewBox=\"0 0 1024 1024\" version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\" p-id=\"20142\" width=\"200\" height=\"200\"><path d=\"M964.8 268.4c0-14.5-4.2-27.7-12.5-39.6-8.3-11.9-19.3-20.4-33.1-25.5L537.4 64.5c-8-2.9-15.9-4.3-23.9-4.3-8 0-15.9 1.4-23.9 4.3L107.9 203.3c-13.7 5.1-24.8 13.6-33.1 25.5s-12.5 25.1-12.5 39.6v416.5c0 12.7 3.3 24.4 9.8 35.3 6.5 10.8 15.4 19.3 26.6 25.5l381.8 208.2c10.1 5.8 21.2 8.7 33.1 8.7s23-2.9 33.1-8.7l381.8-208.2c11.2-6.1 20.1-14.6 26.6-25.5 6.5-10.8 9.8-22.6 9.8-35.3l-0.1-416.5zM513.6 405L135.1 267.3l378.5-137.7 378.5 137.7L513.6 405z m381.8 279.8L548.3 874.1V466.3l347.1-126.4v344.9z\" fill=\"#707070\" p-id=\"20143\"></path></svg>基础', 1, NULL, 2, '2024-01-31 10:43:09', '2024-01-31 10:43:09', 0);
INSERT INTO `t_wiki_catalog` VALUES (1994, 6, 17, '<svg t=\"1705912625274\" class=\"icon inline-block w-4 h-4 mr-2\" viewBox=\"0 0 1024 1024\" version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\" p-id=\"19154\" width=\"200\" height=\"200\"><path d=\"M577.16491 4.216164C296.74428-31.752019 40.196107 166.39648 4.227924 446.84711c-35.968183 280.42063 162.146317 536.936804 442.598946 572.936986 280.45263 35.968183 537.064801-162.178316 572.936986-442.630946 35.999182-280.42063-162.082318-536.936804-442.598946-572.936986z m105.441605 319.365746a36.466172 36.466172 0 0 0-25.310425 10.655758L467.307405 524.224352l-40.545079-40.545079c187.266746-186.722759 221.026979-188.514718 255.844189-160.130362z m-207.495287 207.395289l189.446697-189.443697a26.469399 26.469399 0 1 1 36.192178 38.528125l-0.032 0.031999L500.235657 556.097628z m14.08868 29.632327l-46.948934 10.143769a2.870935 2.870935 0 0 1-0.575987 0.063999 2.63194 2.63194 0 0 1-2.299947-1.407968 2.476944 2.476944 0 0 1-0.351992-1.279971 2.510943 2.510943 0 0 1 0.767982-1.823959l27.516375-27.517374z m-119.622283-19.584555l50.016864-50.016864 37.506148 37.472149-84.449082 18.176587a3.044931 3.044931 0 0 1-0.799982 0.099998 3.09993 3.09993 0 0 1-2.815936-1.759961v-0.031999a2.978932 2.978932 0 0 1-0.479989-1.663962 3.162928 3.162928 0 0 1 1.023977-2.299948zM214.023159 799.4931a3.237926 3.237926 0 0 1-2.943934-3.231927v-0.319993a3.299925 3.299925 0 0 1 0.927979-1.951955h0.099998l40.353083-40.353084 52.128816 52.128816z m103.457649-53.598783a9.763778 9.763778 0 0 0-5.24788 8.639804 9.344788 9.344788 0 0 0 0.287993 2.335947v-0.063999l8.671803 36.899162a5.327879 5.327879 0 0 1-5.188882 6.61985 5.26288 5.26288 0 0 1-3.807913-1.599964h-0.127998l-52.38481-52.448809L420.201475 585.921951l77.665236-16.768619 37.280153 37.280153c-53.536784 47.008932-126.754121 93.921867-217.603057 139.425833z m225.251884-146.244678h-0.099998l-35.808186-35.808187 200.486446-176.003002a41.607055 41.607055 0 0 0 5.023885-5.343878l0.063999-0.099998c-6.299857 57.376697-86.561034 138.465855-169.696145 217.219066zM698.767148 323.992901l-0.127997-0.099998A77.753234 77.753234 0 0 1 803.692764 209.467502l-0.127997-0.099998-68.705439 68.833437a5.099884 5.099884 0 0 0 0 7.231835l53.216791 53.216792a77.457241 77.457241 0 0 1-89.280972-14.619668z m109.985501 0a72.269358 72.269358 0 0 1-11.299743 9.119792l-0.287993 0.159997h-0.032l-51.48883-51.488831 65.409514-65.408514A77.776233 77.776233 0 0 1 808.752649 323.992901z m-4.259903-65.852505a6.090862 6.090862 0 0 0-2.527943 4.927888 6.376855 6.376855 0 0 0 0.255995 1.79196v-0.032a17.774596 17.774596 0 0 1-2.299948 19.232564l0.031999-0.032a5.973864 5.973864 0 0 0 0.991978 8.38381 6.022863 6.022863 0 0 0 3.583918 1.279971 5.999864 5.999864 0 0 0 4.511898-2.111952 29.450331 29.450331 0 0 0 3.615918-32.192269l0.063998 0.159996a5.885866 5.885866 0 0 0-8.287812-1.407968h0.032z\" fill=\"#FF6C37\" p-id=\"19155\"></path></svg>Postman 汉化教程', 2, 1993, 1, '2024-01-31 18:43:09', '2024-01-31 18:43:09', 0);
INSERT INTO `t_wiki_catalog` VALUES (1995, 6, NULL, '<svg t=\"1705912556336\" class=\"icon inline-block w-5 h-5 mr-2\" viewBox=\"0 0 1024 1024\" version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\" p-id=\"18025\" width=\"200\" height=\"200\"><path d=\"M307 568.4v261.4h123V568.4l-61.5-51.3zM512 635v194.8h123V573.5l-97.4 82zM225 629.9l-123 97.4v102.5h123zM717 829.8h123V404.4L717 506.9z\" p-id=\"18026\" fill=\"#707070\"></path><path d=\"M537.6 583.8L840 337.7l82 76.9V194.2H686.2l97.4 92.3-251.1 205-164-138.4L102 563.2v92.3l266.5-210.1z\" p-id=\"18027\" fill=\"#707070\"></path></svg>高级进阶', 1, NULL, 3, '2024-01-31 10:43:09', '2024-01-31 10:43:09', 0);

SET FOREIGN_KEY_CHECKS = 1;
