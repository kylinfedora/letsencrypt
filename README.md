# Home Assistant Add-on: Letsencrypt

Let's Encrypt is a certificate authority that provides free X.509 certificates for Transport Layer Security encryption via an automated process designed to eliminate the hitherto complex process of manual creation, validation, signing, installation, and renewal of certificates for secure websites.

![Supports aarch64 Architecture][aarch64-shield] ![Supports amd64 Architecture][amd64-shield] ![Supports armhf Architecture][armhf-shield] ![Supports armv7 Architecture][armv7-shield] ![Supports i386 Architecture][i386-shield]

Setting up Letsencrypt allows you to use validated certificates for your webpages and web-interfaces.
It requires you to own the domain you are requesting the certificate for.

The generated certificate can be used within others addons. By default the path and file for the certificates within other addons will refer to the files generated within this addon.

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/hassio-addons/issues
[certbot]: https://certbot.eff.org
[reddit]: https://reddit.com/r/homeassistant

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg

# aliyun NDS

Certbot 支持自动申请 LetsEncrypt 的泛域名证书，但是官方插件不支持阿里云，在 GitHub 搜索发现已经有人写好了阿里云 DNS 插件，下面只需要进行简单的配置即可免费申请一个泛域名证书并自动续订。

Example credentials file using restricted API Token (recommended):

dns:
  provider: dns-aliyun
  aliyun_access_key = 12345678
  aliyun_access_key_secret = 1234567890abcdef1234567890abcdef
