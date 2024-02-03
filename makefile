run:
	go run agent.go

setup:
	go env -w GOPROXY=direct
	-go mod init aws-secrets-manager-agent
#	go get github.com/aws/aws-sdk-go-v2/aws
#	go get github.com/aws/aws-sdk-go-v2/config
#	go get github.com/aws/aws-sdk-go-v2/service/secretsmanager
	go get github.com/gin-gonic/gin
	go get github.com/aws/aws-secretsmanager-caching-go/secretcache
