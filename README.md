# Kitura-LetsEncrypt

[Kitura](http://www.kitura.io)で[Let’s Encrypt](https://letsencrypt.org/)に対応させるサンプル

## 使い方
1. `main.swift`でドメインを指定  
  ```
  let domain = "example.com"
  ```
1. サーバを起動  
  ```
  swift build
  sudo .build/debug/Kitura-LetsEncrypt
  ```
  （SSLはエラーになってOK）
1. 別ターミナルで証明書の取得をテスト実行  
  ```
  sudo letsencrypt certonly -m メールアドレス --agree-tos --non-interactive $* --webroot -w ~/Kitura-LetsEncrypt/public -d ドメイン --test-cert
  ```
  証明書が生成されたパスと`main.swift`内のパスと同じか確認
1. 証明書を取得  
  ```
  sudo letsencrypt certonly -m メールアドレス --agree-tos --non-interactive $* --webroot -w ~/Kitura-LetsEncrypt/public -d ドメイン --force-renewal
  ```
1. サーバを再起動

## 環境
- Ubuntu 16.04 LTS

