
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
