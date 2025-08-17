from fastapi import FastAPI
import mysql.connector

app = FastAPI()

@app.get("/users")
def get_users():
    # conn = mysql.connector.connect(
    #     host="mysql",
    #     user="user",
    #     password="pass123",
    #     database="testdb"
    # )
    conn = mysql.connector.connect(
        host="mysql",
        user="user",
        password="pass123",
        database="testdb"
    )
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM users")
    result = cursor.fetchall()
    cursor.close()
    conn.close()
    return result