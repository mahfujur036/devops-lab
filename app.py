from flask import Flask, jsonify

# Initialize the Flask application
app = Flask(__name__)

# Define the root route (Home page)
@app.route("/")
def home():
    return "<h1>Welcome to my Flask App!</h1><p>Go to /api/data for JSON response.</p>"

# Define an alternative route that returns JSON data
@app.route("/api/data")
def get_data():
    sample_data = {
        "status": "success",
        "message": "Hello from the Flask backend data endpoint!",
        "items": [1, 2, 3, 4, 5]
    }
    return jsonify(sample_data)

# Run the app locally if executed directly
if __name__ == "__main__":
    app.run(host="0.0.0.0", port="5000", debug=True)

