"use strict";

function Time() {
    if (this instanceof Time === false) {
        return new Time();
    }

    this.hour = 1;
    this.minute = 0;
    this.second = 0;
};

