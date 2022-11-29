# ml-docker-boilerplate

機械学習用のDocker環境のテンプレートを提供します。

## 主な特徴

このリポジトリでは特に技術的に新しいことはやってません。Dockerの特徴を利用した機械学習プロジェクトの運用スキームを提案します。

* 資材の重複を最小限に
    * Docker Imageはベースイメージからの変更差分のみを保持するため、似たようなプロジェクトが増えても資材の重複を最小限に収められます。
* スピーディな環境構築
    * 必要なものはベース環境にインストールされているため、ベース環境の構築時間分が短縮されます[^1]。
* 簡単に復元可能
    * Dockerコンテナは使い捨てなので仮に壊れても簡単に初期状態に戻すことができます。

[^1]: ただし、最初にベースイメージのダウンロードの時間がかかります。

## 前提知識と必要な資材

Dockerおよびdocker composeを利用しているため、これらの技術に対する運用レベルの知識を前提としています。
また、環境構築に必要な資材は以下です。

- OS: `Ubuntu 22.04 LTS`でテスト済み
- `cuda` に対応したGPU
- [Docker Engine](https://docs.docker.com/engine/install/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/overview.html)

## ディレクトリ構成（コンテナ内）

* `/ml-docker/input`: データセットを格納することができます。ホストマシンの`./input`と同期しています。
* `/ml-docker/working`: ノートブックやノートブックの出力ファイルが作成されます。ホストマシンの`./working`と同期しています。

## 運用フロー

### 初回構築時

1. このテンプレートリポジトリから新しいリポジトリを作成します
1. Dockerfileを編集します
    - ベースイメージを変更します（特にこだわりがなければそのままでも可）
    - 初回でインストールする依存パッケージを`pip install`の行に追加します（試行錯誤したい場合は起動後にターミナルからインストールしても可）
1. `docker compose up --build` dockerイメージをビルドしてコンテナを起動します

### 機械学習タスクの実行

1. ホストマシン上で必要に応じて`./input`にデータセットをダウンロードしておきます（notebookからダウンロードしても可）。
1. ブラウザから`http://localhost:8888`にアクセスしてJupyter Labのクライアントを立ち上げます。
1. ipython notebookを新規作成して機械学習タスクのコードを編集し、実行します。
1. 使い終わったら`docker compose`を起動しているターミナルで`Ctrl-C`を押してコンテナを停止します。
1. コンテナに対して行った変更（例: `pip install`）をクリアしたい場合は`docker compose rm`します。

## 関連プロジェクト

- [Kaggle Docker Environment](https://github.com/bilzard/kaggle-docker-env)