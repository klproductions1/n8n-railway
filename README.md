# n8n with FFmpeg on Railway

Railway에서 n8n과 FFmpeg을 함께 실행하는 프로젝트입니다.

## 특징

- ✅ n8n 최신 버전
- ✅ FFmpeg 사전 설치됨
- ✅ Railway 플랫폼 최적화
- ✅ 자동 헬스체크
- ✅ 보안 설정

## 배포 방법

### 1. Railway 계정 준비
1. [Railway](https://railway.app/) 계정 생성
2. Railway CLI 설치 (선택사항)

### 2. 프로젝트 배포
1. Railway에서 "New Project" 클릭
2. "Deploy from GitHub repo" 선택
3. 이 저장소를 선택하거나 Fork 후 배포

### 3. 환경 변수 설정
Railway 대시보드에서 다음 환경 변수들을 설정하세요:

**필수 설정:**
```
N8N_PORT=5678
N8N_HOST=0.0.0.0
N8N_USER_FOLDER=/data/.n8n
NODE_ENV=production
```

**선택적 설정 (보안을 위해 권장):**
```
N8N_BASIC_AUTH_ACTIVE=true
N8N_BASIC_AUTH_USER=your_username
N8N_BASIC_AUTH_PASSWORD=your_secure_password
N8N_WEBHOOK_URL=https://your-app.railway.app/
GENERIC_TIMEZONE=Asia/Seoul
TZ=Asia/Seoul
```

### 4. 데이터베이스 연결 (선택사항)
PostgreSQL을 사용하려면 추가 환경 변수를 설정하세요:

```
DB_TYPE=postgresdb
DB_POSTGRESDB_HOST=your-postgres-host
DB_POSTGRESDB_PORT=5432
DB_POSTGRESDB_DATABASE=n8n
DB_POSTGRESDB_USER=n8n
DB_POSTGRESDB_PASSWORD=n8n
```

## 접속 방법

1. Railway에서 제공하는 도메인으로 접속
2. 설정한 사용자명과 비밀번호로 로그인
3. n8n 워크플로우 생성 및 실행

## FFmpeg 사용법

FFmpeg은 이미 설치되어 있으므로, n8n의 "Execute Command" 노드에서 바로 사용할 수 있습니다.

예시:
```bash
ffmpeg -i input.mp4 -c:v libx264 -c:a aac output.mp4
```

## 주요 파일

- `Dockerfile`: 컨테이너 이미지 정의
- `railway.json`: Railway 배포 설정
- `package.json`: Node.js 프로젝트 설정
- `.env.example`: 환경 변수 예시

## 지원

문제가 있으시면 Issues를 통해 알려주세요.

## 라이선스

MIT 