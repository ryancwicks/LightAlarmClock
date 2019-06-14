from flask import Flask, request, jsonify, url_for, render_template
import datetime


app = Flask(__name__, static_folder='../static', template_folder='../')

offset_time = datetime.datetime(1, 1, 1, 0, 0, 0)


@app.route('/')
@app.route('/index')
@app.route('/index.html')
def index():
    print(url_for("static", filename="light_clock_api.js"))
    return render_template('index.html')


@app.route('/api/time', methods=["GET", "PUT"])
def time():
    if request.method == "GET":

        return jsonify({"success": True,
                        "time": get_current_time()})
    elif request.method == "PUT":
        pass
    return jsonify({"success": False,
                    "message": "Invalid time request recieved."})


def get_current_time():
    """
    Get the current time, with an offset from setting the time.
    """
    cur_time = datetime.datetime.now() + offset_time
    return [cur_time.year, cur_time.month, cur_time.day, cur_time.hour, cur_time.min, cur_time.second]


if __name__ == "__main__":
    app.run(port=8080, debug=True)
