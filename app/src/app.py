import os
import flask
import mysql.connector


class DBManager:
    def __init__(self):
        db_host = os.environ.get('DB_HOST')  # Use the service name
        db_port = int(os.environ.get('DB_PORT', '3306'))
        db_user = os.environ.get('DB_USER', 'root')
        db_database = os.environ.get('MY_SQL_DATABASE','example')
        db_password = os.environ.get('DB_PASSWORD')
        # Get the password from the environment variable
        self.connection = mysql.connector.connect(
            host=db_host,
            port=db_port,
            user=db_user,
            password=db_password,
            database=db_database,  # Replace with your database name
            auth_plugin='mysql_native_password'      
        )
        self.cursor = self.connection.cursor()

    def populate_db(self):
        self.cursor.execute('DROP TABLE IF EXISTS blog')
        self.cursor.execute('CREATE TABLE blog (id INT AUTO_INCREMENT PRIMARY KEY, title VARCHAR(255))')
        self.cursor.executemany('INSERT INTO blog (id, title) VALUES (%s, %s);', [(i, 'Blog post #%d'% i) for i in range(1, 5)])
        self.connection.commit()

    def query_titles(self):
        self.cursor.execute('SELECT title FROM blog')
        rec = []
        for c in self.cursor:
            rec.append(c[0])
        return rec

app = flask.Flask(__name__)
conn = None

@app.route('/blogs')
def list_blog():
    global conn
    if not conn:
        conn = DBManager()
        conn.populate_db()
    rec = conn.query_titles()

    result = []
    for c in rec:
        result.append(c)

    return flask.jsonify({"response": result})

@app.route('/')
def hello():
    return flask.jsonify({"response": "Hello from Docker!"})

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
