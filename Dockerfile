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
    dumb-init

# n8n 사용자 생성
RUN addgroup -g 1000 n8n && \
    adduser -D -s /bin/sh -u 1000 -G n8n n8n

# 작업 디렉토리 설정
WORKDIR /home/n8n

# n8n 설치
RUN npm install -g n8n

# n8n 사용자로 전환
USER n8n

# 데이터 디렉토리 생성
RUN mkdir -p /home/n8n/.n8n

# 포트 노출
EXPOSE 5678

# 헬스체크 추가
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
  CMD curl -f http://localhost:5678/healthz || exit 1

# dumb-init으로 n8n 실행
ENTRYPOINT ["dumb-init", "--"]
CMD ["n8n", "start"] 