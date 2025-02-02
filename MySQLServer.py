import mysql.connector
from mysql.connector import Error


def create_database():
    try:
        # Connect to MySQL Server (Modify 'your_user' and 'your_password' as needed)
        connection = mysql.connector.connect(
            host="localhost",
            user="your_user",
            password="your_password"
        )

        if connection.is_connected():
            cursor = connection.cursor()
            # Create database if it doesn't exist
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store;")
            print("Database 'alx_book_store' created successfully!")

    except Error as e:
        print(f"Error: {e}")

    finally:
        # Close the connection
        if 'connection' in locals() and connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection closed.")


if __name__ == "__main__":
    create_database()
