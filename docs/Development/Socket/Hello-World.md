# 搭建第一个 Socket 服务

### 服务端

```python
import socket
# 创建一个socket对象，默认TCP套接字
s = socket.socket()
# 绑定端口
s.bind(('127.0.0.1',9006))
# 监听端口
s.listen(5)
print("正在连接中……")

# 建立连接之后，持续等待连接
while 1:
    # 阻塞等待连接
    sock,addr = s.accept()
    print(sock,addr)
    # 一直保持发送和接收数据的状态
    while 1:
        text = sock.recv(1024)
        # 客户端发送的数据为空的无效数据
        if len(text.strip()) == 0:
            print("服务端接收到客户端的数据为空")
        else:
            print("收到客户端发送的数据为：{}".format(text.decode()))
            content = input("请输入发送给客户端的信息：")
            # 返回服务端发送的信息
            sock.send(content.encode())

    sock.close()
```

### 客户端

```python
import socket
# 创建一个socket对象
s1 = socket.socket()
s1.connect(('127.0.0.1', 9006))
# 不断发送和接收数据
while 1:
    send_data = input("客户端要发送的信息：")
    # socket传递的都是bytes类型的数据,需要转换一下
    s1.send(send_data.encode())
    # 接收数据，最大字节数1024,对返回的二进制数据进行解码
    text = s1.recv(1024).decode()
    print("服务端发送的数据：{}".format(text))
    print("------------------------------")
```

> From:[Python 网络编程之 Socket 通信简单实现（文末赠书）](https://cloud.tencent.com/developer/article/1882149)

## ChatGPT

### 服务端

```python
import socket

# 创建一个 socket 对象
server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# 获取本地主机名
host = socket.gethostname()

port = 12345

# 绑定端口
server_socket.bind((host, port))

# 设置最大连接数，超过后排队
server_socket.listen(5)

while True:
   # 建立客户端连接
   client_socket, addr = server_socket.accept()

   print("连接地址: %s" % str(addr))

   msg = '欢迎来到聊天室！' + "\r\n"
   client_socket.send(msg.encode('utf-8'))
   client_socket.close()

```

### 客户端

```python
import socket

# 创建一个 socket 对象
client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# 获取本地主机名
host = socket.gethostname()

port = 12345

# 连接服务，指定主机和端口
client_socket.connect((host, port))

# 接收小于 1024 字节的数据
msg = client_socket.recv(1024)

client_socket.close()

print (msg.decode('utf-8'))

```
