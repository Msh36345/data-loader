from fastapi import FastAPI
import mysql.connector

app = FastAPI()

@app.get("/data")
def get_data():
    db = mysql.connector.connect(
        host="mysql",
        user="admin",
        password="redhat",
        database="mysqldb"
    )
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM data")
    result = cursor.fetchall()
    cursor.close()
    db.close()
    return result