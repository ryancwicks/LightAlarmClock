"use strict";

function ClockViewer() {
    let state = {
        read_only: true,
        set_time: false,
        set_alarm: false,
        hour_mode_24: true,
    };
    let displayed_time = Time()


    function addToContainer(container) {

    };

    function updateTime(time) {

    };

    function set_state(input_state) {
        if (input_state.hour_mode_24) {
            state.hour_mode_42 = input_state.hour_mode_24;
        }
        if (input_state.set_time) {
            state.read_only = true;
            state.set_time = false;
            state.set_alarm = false;
            return;
        } else if (input_state.set_time) {
            state.read_only = false;
            state.set_time = true;
            state.set_alarm = false;
            return;
        } else if (input_state.set_alarm) {
            state.read_only = false;
            state.set_time = false;
            state.set_alarm = true;
            return;
        }

        //default if improperly set.
        state.read_only = true;
        state.set_time = false;
        state.set_alarm = false;
    }


    return {
        addToContainer: addToContainer,
        get time() {
            return displayed_time;
        },
        set time(the_time) {
            updateTime(the_time);
        },
        get state() {
            return state;
        },
        set state(input_state) {
            set_state(input_state);
        },
    };
};