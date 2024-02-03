package main

import (
	"fmt"

	"net/http"

	"github.com/aws/aws-secretsmanager-caching-go/secretcache"
	"github.com/gin-gonic/gin"
)

var secretCache *secretcache.Cache

func getSecret(c *gin.Context) {
	secretName := c.Query("secretId")
	fmt.Printf("secretName: %s\n", secretName)

	result, _ := secretCache.GetSecretString(secretName)

	fmt.Printf("result: %s\n", result)

	c.IndentedJSON(http.StatusOK, result)

}

func returnOK(c *gin.Context) {
	c.JSON(http.StatusOK, "I'm healthy")
}

func main() {
	// Create Secrets Manager cache
	secretCache, _ = secretcache.New()

	router := gin.Default()
	router.GET("/secretsmanager/get", getSecret)
	router.GET("/health", returnOK)

	router.Run(":2773")
}
