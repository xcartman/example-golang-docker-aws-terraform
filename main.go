package main

import "github.com/gin-gonic/gin"

func setupRouter() *gin.Engine {
	r := gin.Default()
	r.GET("/", func(context *gin.Context) {
		context.String(200, "Hello im golang from AWS.")
	})
	return r
}

func main() {
	r := setupRouter()
	r.RunTLS(":8443", "./https.cert", "./https.key")
}
