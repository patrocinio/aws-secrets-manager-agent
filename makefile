run:
	go run agent.go

setup:
	go env -w GOPROXY=direct
	-go mod init aws-secrets-manager-agent
	go get github.com/gin-gonic/gin
	go get github.com/aws/aws-secretsmanager-caching-go/secretcache
