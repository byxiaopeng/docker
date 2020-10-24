
 ### 客户端使用简要
> **务必替换所有的appname.us-south.cf.appdomain.cloud为IBM分配的项目域名，按需替换其它自定义参数**  
  
  
1. [v2ray](https://github.com/2dust/v2rayN/releases)  
* 代理协议：vmess
* 地址：appname.us-south.cf.appdomain.cloud
* 端口：443
* 默认UUID：ad806487-2d26-4636-98b6-ab85cc8521f7
* "alterId": 4 
* 加密：none
* 传输协议：ws
* 伪装类型：none
* 路径：/ws
* 底层传输安全：tls
  
2. [shadowsocks](https://github.com/shadowsocks/shadowsocks-windows/releases/)   
* 服务器地址: appname.us-south.cf.appdomain.cloud
* 端口: 443
* 密码：password
* 加密：chacha20-ietf-poly1305
* 插件程序：D:\APP\v2ray-plugin_windows_amd64.exe  //此处要填[v2ray-plugin插件](https://github.com/shadowsocks/v2ray-plugin/releases)下载解压后在电脑上的绝对路径
* 插件选项: tls;host=appname.herokuapp.com;path=/peng
  
3. [gost](https://github.com/ginuerzh/gost/releases)  
* 选择`gost-windows-amd64-*.zip`下载解压后复制gost的exe文件在电脑中的绝对路径，新建run.bat文件编辑内容如下保存后双击运行：      
```bash
C:\Users\Administrator\App\gost\gost-windows-amd64.exe -L :1080 -F wss://appname.us-south.cf.appdomain.cloud:443?path=/gows
```
  
4. [brook](https://github.com/txthinking/brook/releases)  
* 选择`Brook.exe`下载运行，配置`wsserver`内容`wss://appname.us-south.cf.appdomain.cloud:443/brook`以及密码`password`  
  
<details>
<summary>cloudflare workers example</summary>

```js
const SingleDay = 'appname.us-south.cf.appdomain.cloud'
const DoubleDay = 'appname.us-south.cf.appdomain.cloud'
addEventListener(
    "fetch",event => {
    
        let nd = new Date();
        if (nd.getDate()%2) {
            host = SingleDay
        } else {
            host = DoubleDay
        }
        
        let url=new URL(event.request.url);
        url.hostname=host;
        let request=new Request(url,event.request);
        event. respondWith(
            fetch(request)
        )
    }
)
```
</details>
