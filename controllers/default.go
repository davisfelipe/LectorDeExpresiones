package controllers

import (
	"fmt";
	"strings";
	"github.com/astaxie/beego";
	"github.com/Knetic/govaluate"
)

type MainController struct {
	beego.Controller
}

var acceptedChars = ".+-*/()0123456789"
var stringChars = []string{"Punto decimal", "Suma", "Resta", "Multiplicacion", "División", "Parentesis Derecho", "Parentesis Izquierdo", 
"Cero", "Uno", "Dos", "Tres", "Cuatro", "Cinco", "Seis", "Siete", "Ocho", "Nueve"}

func (c *MainController) Get() {

	c.TplName = "index.tpl"
}

func (c *MainController) Post() {
	entrada := c.GetString("entrada")
	
	entradaLimpia := strings.Replace(entrada, " ", "", -1)
	fmt.Printf(entradaLimpia)
	if ValidateString(entradaLimpia){
		expresion, _ := govaluate.NewEvaluableExpression(entradaLimpia);
		resultado, err := expresion.Evaluate(nil)
		caracteres := GetCharactersExpression(entradaLimpia)
		c.Data["caracteres"] = caracteres
		c.Data["error"] = err
		c.Data["resultado"] = resultado
	} else {
		c.Data["error"] = "Error: La entrada contiene caracteres invalidos"
		c.Data["resultado"] = 0.0
	}
	
	c.Data["entrada"] = entrada
	c.TplName = "resultado.tpl"
}

func GetCharactersExpression(entrada string) [][]string{
	characters := strings.Split(entrada, "")
	
	var characterStrings [][]string
	for _, char := range characters {
		characterStrings = append(characterStrings, []string{char, GetStringCharacter(char)})
    }
	return characterStrings
}

func GetStringCharacter(caracter string) string {
	return stringChars[strings.Index(acceptedChars, caracter)]
}

func ValidateString(entrada string) bool{
	for _, runeValue := range entrada {
		if !AcceptedChar(runeValue){
			return false
		}
        //fmt.Printf("%#U starts at byte position %d\n", runeValue, index)
    }
	return true
}

func AcceptedChar(character rune) bool {
	for _, runeValue := range acceptedChars {
		if character == runeValue {
			return true
		}
    }
	return false
}