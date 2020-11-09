#!/usr/bin/python3
""" Flask AirBNB
"""

from flask import Flask, render_template
from models import storage
from models.state import State
from models.amenity import Amenity
from models.place import Place
app = Flask(__name__)


@app.teardown_appcontext
def teardown_session(exception):
    """ kil sql session
    """

    storage.close()


@app.route('/hbnb/', strict_slashes=False)
def front():
    """ Show states, amenities and places
    """

    states = storage.all(State)
    amenities = storage.all(Amenity)
    places = storage.all(Place)

    return render_template('100-hbnb.html',
                           states_list=states.values(),
                           amenities_list=amenities.values(),
                           places_list=places.values())


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
