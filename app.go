package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"log"
	"net/http"

	_ "github.com/go-sql-driver/mysql"
	"github.com/rs/cors" // Import thư viện xử lý CORS
)

var db *sql.DB

func init() {
	// Kết nối đến MySQL
	var err error
	dsn := "root:123456@tcp(localhost:3306)/shop" // Thay đổi với thông tin tài khoản MySQL của bạn

	db, err = sql.Open("mysql", dsn)
	if err != nil {
		log.Fatal(err)
	}
	if err := db.Ping(); err != nil {
		log.Fatal(err)
	}
	fmt.Println("Connected to the database")
}

// API để lấy dữ liệu Carousel
func getCarosel(w http.ResponseWriter, r *http.Request) {
	rows, err := db.Query("SELECT id, src FROM Carosel")
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer rows.Close()

	var caroselImages []map[string]interface{}
	for rows.Next() {
		var id int
		var src string
		if err := rows.Scan(&id, &src); err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		caroselImages = append(caroselImages, map[string]interface{}{"id": id, "src": src})
	}

	// Convert to JSON and send to the client
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(caroselImages)
}

// API để lấy dữ liệu Products
func getProducts(w http.ResponseWriter, r *http.Request) {
	// Truy vấn chỉ các sản phẩm có sale = "*"
	rows, err := db.Query("SELECT id, image, name, brand, originalPrice, salePrice, sale, rate FROM Products WHERE sale = '*'")
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer rows.Close()

	var products []map[string]interface{}
	for rows.Next() {
		var id int
		var image, name, brand, originalPrice, salePrice, sale, rate string

		// Scan dữ liệu vào các biến
		if err := rows.Scan(&id, &image, &name, &brand, &originalPrice, &salePrice, &sale, &rate); err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}

		// Thêm sản phẩm vào danh sách
		products = append(products, map[string]interface{}{
			"id":            id,
			"image":         image,
			"name":          name,
			"brand":		 brand,	
			"originalPrice": originalPrice,
			"salePrice":     salePrice,
			"sale":          sale, 
			"rate":          rate,
		})
	}

	// Convert to JSON and send to the client
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(products)
}

func main() {
	// CORS middleware
	c := cors.New(cors.Options{
		AllowedOrigins: []string{"http://localhost:5173"}, // Vue.js front-end
		AllowedMethods: []string{"GET", "POST", "PUT", "DELETE"},
		AllowedHeaders: []string{"Content-Type"},
	})

	// Routes
	http.HandleFunc("/api/carosel", getCarosel)
	http.HandleFunc("/api/products", getProducts)

	// Start server with CORS enabled
	handler := c.Handler(http.DefaultServeMux)
	log.Println("Server started at http://localhost:8080")
	if err := http.ListenAndServe(":8080", handler); err != nil {
		log.Fatal(err)
	}
}