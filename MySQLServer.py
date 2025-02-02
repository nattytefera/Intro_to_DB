# MySQLServer.py

import mysql.connector

def create_database(host, user, password):
    try:
        # Attempt to connect to MySQL server (without specifying the database initially)
        mydb = mysql.connector.connect(
            host=host,
            user=user,
            password=password
        )

        mycursor = mydb.cursor()

        # Check if the database exists (using CREATE DATABASE IF NOT EXISTS)
        mycursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")

        # Optionally: Select the database to confirm it's there (not strictly required by the prompt, but good practice)
        mycursor.execute("USE alx_book_store")  # or mydb.database = "alx_book_store"

        print("Database 'alx_book_store' created successfully!")

    except mysql.connector.Error as err:
        if err.errno == 1007:  # Database already exists (though we should not get this because of IF NOT EXISTS)
            print("Database 'alx_book_store' already exists.") # Handle the case where the database exists.
        else:
            print(f"Error connecting or creating database: {err}")  # Handle other potential errors.
    finally:
        if mydb.is_connected():
            mycursor.close()
            mydb.close()
            print("Database connection closed.")


if __name__ == "__main__":
    # Replace with your MySQL server credentials
    host = "localhost"  # Or your MySQL server address
    user = "your_user"  # Your MySQL username
    password = "your_password"  # Your MySQL password

    create_database(host, user, password)
