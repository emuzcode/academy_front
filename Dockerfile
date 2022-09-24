FROM node:16.17.0-alpine

ARG WORKDIR
# ARG CONTAINER_PORT
ARG API_URL

ENV HOME=/${WORKDIR} \
    # コンピューター用の英語をUTF-8で利用する
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo \
    # このNuxt.jsをブラウザから参照するための紐付け
    HOST=0.0.0.0 \
    API_URL=${API_URL}

# ENV check（このRUN命令は確認のためなので無くても良い）
# RUN echo ${HOME}
# RUN echo ${CONTAINER_PORT}

WORKDIR ${HOME} 

# 公開用のポート番号を指定
# http://localhost(0.0.0.0):3000
# EXPOSE ${CONTAINER_PORT}

# 2021.12.13追記
# FROM node:14.15.1-alpine
# node v14.15.1は、$ yarn create nuxt-app appコマンド時に下記エラーが発生するので使用不可
# eslint-plugin-vue@8.2.0: The engine "node" is incompatible with this module. Expected version "^12.22.0 || ^14.17.0 || >=16.0.0". Got "14.15.1"

# create nuxt-appコマンド成功確認済みのnode version
# FROM node:16.13.1-alpine
# or
# FROM node:16-alpine(node v16.13.1)

# 現在のnode推奨版はこちらから => https://nodejs.org/ja/download/