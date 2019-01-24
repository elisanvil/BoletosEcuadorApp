// main.go

package main
import (
  "net/http"
  "github.com/gin-gonic/gin"
)
var router *gin.Engine

func main() {

  // Establecer el router
  router = gin.Default()

  // Desde el inicio, carga los templates
  router.LoadHTMLGlob("templates/*")

  // Definir el router
  router.GET("/", func(c *gin.Context) {
    // Llamar al método HTML para renderizar
    c.HTML(
      // Establecer el estado HTTP 200
      http.StatusOK,
      "index.html",
      // Pasar un dato
      gin.H{
        "title": "Home",
    })
  })

    authorized := router.Group("/", gin.BasicAuth(gin.Accounts{
      "lwyatt": "wyatt123",
      "rwolfe": "wolfe456",
      "sbonasera": "bonasera123",
      "avaugier": "vaugier123",
      "rjloor": "rxlz",
    }))

    router.GET("/evento", verEventos)
    authorized.GET("/asiento", verAsientos)


  // Iniciar la app
  router.Run()
}

func verEventos(c *gin.Context) {
  c.HTML(http.StatusOK, "evento.html", gin.H{
      "title": "Eventos",
  },)
}

func verAsientos(c *gin.Context) {
  c.HTML(http.StatusOK, "asiento.html", gin.H{
      "title": "Asientos",
  },)
}