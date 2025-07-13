FROM node:18-alpine

# ffmpeg 및 기타 필요한 패키지 설치
RUN apk add --no-cache \
    ffmpeg \
    python3 \
    py3-pip \
    make \
    g++ \
    git \
    ca-certificates \
    dumb-init \
    curl

# 작업 디렉토리 설정
WORKDIR /data

# n8n 설치
RUN npm install -g n8n

# 데이터 디렉토리 생성 및 권한 설정
RUN mkdir -p /data/.n8n && \
    chmod 755 /data/.n8n

# 포트 노출
EXPOSE 5678

# 환경 변수 설정
ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0

# 직접 n8n 실행
CMD ["n8n", "start"] 