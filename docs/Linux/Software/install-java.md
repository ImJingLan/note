# Linux 安装 Java 17

## Step 1：下载 JDK

官方下载链接：

`https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html`

![Java版本列表](_static/install-java/javaList.png)

注意：下载与 Linux 系统对应的版本

查看 Linux 版本
`uname -a`

## Step 2：上传到 Linux

将下载的 压缩包 上传至 Linux 服务器，这里选择的是 /software/java 文件夹

## Step 3：解压缩

解压缩到指定目录

`mkdir /usr/local/java/`

`tar -xzvf /software/java/jdk-17.0.2_linux-x64_bin.tar.gz -C /usr/local/java/`

## Step 4：配置环境变量

`vim /etc/profile`

贴上如下内容：

```
export JAVA_HOME=/usr/local/java/jdk-17.0.2

export PATH=$PATH:$JAVA_HOME/bin;

export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar;
```

## Step 5：测试

### 加载配置

`source /etc/profile`

> 转载自 [**Linux 安装 Java 17 - ChaosMoor - 博客园**](https://www.cnblogs.com/chaosmoor/p/15897693.html)
