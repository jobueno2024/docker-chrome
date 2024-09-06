FROM ubuntu:latest

# Chrome の依存パッケージをインストール
RUN apt-get update && \
    apt-get install -y wget gnupg2 ca-certificates apt-transport-https

# Chrome のリポジトリを追加
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list

# Chrome をインストール
RUN apt-get update && \
    apt-get install -y google-chrome-stable

# コンテナ実行時のコマンド
CMD ["google-chrome", "--version"]