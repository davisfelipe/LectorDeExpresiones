package main

import (
	_ "LectorDeExpresiones/routers"
	"github.com/astaxie/beego"
)

func caracter(in []string)(out string){
    out = in[0]
    return
}

func nombre(in []string)(out string){
    out = in[1]
    return
}

func main() {
	beego.AddFuncMap("caracter", caracter)
	beego.AddFuncMap("nombre", nombre)
	beego.Run()
}
