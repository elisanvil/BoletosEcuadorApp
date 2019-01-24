package main

import (
	"database/sql"
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"context"
)



func main() {
	db, err := sql.Open("mysql", "loor:Rxlz_01@@/boletosecuador")
	if err != nil {
		panic(err.Error())  // Just for example purpose. You should use proper error handling instead of panic
	}
	defer db.Close()

	// Prepare statement for inserting data
	stmtIns, err := db.Prepare("INSERT INTO evento (id_evento, nombre, hora, id_venue, fecha) VALUES(null, ?, NOW(), ?, CURDATE())") // ? = placeholder
	if err != nil {
		panic(err.Error()) // proper error handling instead of panic in your app
	}
	defer stmtIns.Close() // Close the statement when we leave main() / the program terminates

	// Prepare statement for reading data
	//Usuario pueden ver eventos disponibles
	stmtOut, err := db.Prepare("SELECT * FROM evento WHERE id_evento = ?")
	if err != nil {
		panic(err.Error()) // proper error handling instead of panic in your app
	}
	defer stmtOut.Close()

	stmtOut2, err := db.Prepare("SELECT * FROM evento")
	if err != nil {
		panic(err.Error()) // proper error handling instead of panic in your app
	}
	defer stmtOut2.Close()

	names := [4]string{"Funkafest", "Shakira", "Chayanne", "Barcelona vs. Macara"}
	for index, element := range names{
		_, err = stmtIns.Exec(element, index)
		if err != nil {
			panic(err.Error())
		}
	}

	var id int
	var name string
	var hora string
	var id_venue int
	var fecha string
	var tipo string

	var ctx = context.Background()

	err = stmtOut.QueryRow(1).Scan(&id, &name, &tipo, &id_venue, &fecha, &hora)
	if err != nil {
		panic(err.Error()) // proper error handling instead of panic in your app
	}
	fmt.Printf("id %d name %s tipo %s id_venue %d fecha %s hora %s\n", id, name, tipo, id_venue, fecha, hora)

	
	rows, err := db.QueryContext(ctx, "SELECT * FROM evento")
	if err != nil {
		panic(err.Error())
	}
	defer rows.Close()
	ids := make([]int, 0)
	for rows.Next(){
		if err := rows.Scan(&id, &name, &tipo, &id_venue, &fecha, &hora); err != nil {
			panic(err.Error())
		}
		ids = append(ids, id)
		fmt.Printf("id %d name %s tipo %s id_venue %d fecha %s hora %s\n", id, name, tipo, id_venue, fecha, hora)
	}
	if err := rows.Err(); err != nil {
		panic(err.Error())
	}
	fmt.Printf("ids obtenidos %d", ids)

	//creacion de venues

	stmtIns2, err := db.Prepare("INSERT INTO venue (id_venue, nombre, ubicacion, tipo, capacidad, disponibilidad) VALUES (null, ?, ?, ?, ?, ?)")
	if err != nil {
		panic(err.Error())
	}
	defer stmtIns2.Close()

	venue_names := [3]string{"Cto. convenciones", "Casa de la Cultura", "Coliseo Voltaire"}
	venue_ubicacion := [3]string{"Guayaquil", "Quito", "Guayaquil"}
	venue_tipo := [3]string{"Teatro", "Agora", "Coliseo"}
	venue_capacidad := [3]string{"10000", "55000", "1000000"}

	for index, element := range venue_names{
		_, err = stmtIns2.Exec(element, venue_ubicacion[index], venue_tipo[index], venue_capacidad[index], "disponible")
		if err != nil {
			panic(err.Error())
		}
	}

}
