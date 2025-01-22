import mysql.connector as mysql

# Create a connection object

try:
    conn = mysql.connect(
        host="localhost", user="root", password="FATIHAM68860", port="3306"
    )
    print("Connection Established")
except mysql.Error as e:
    print(e)


command = "CREATE DATABASE IF NOT EXISTS little_lemon"
cursor = conn.cursor()
cursor.execute(command)
cursor.fetchall()
cursor.execute("USE little_lemon")


cursor.execute("SHOW DATABASES")

select_infos = """ SELECT * FROM little_lemon.menuitems"""
buffered_cursor = conn.cursor(buffered=True)
buffered_cursor.execute(select_infos)
results = buffered_cursor.fetchall()
for result in results:
    print(result)
buffered_cursor.close()
