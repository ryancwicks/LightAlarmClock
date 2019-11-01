'use strict';

export { LightClockAPI };

function LightClockAPI() {

    const requests = {
        time: "/api/time",
        alarm: "/api/alarm",
        alarms: "/api/alarms",

    };

    async function getTime() {
        let response;
        let json_response;
        try {
            response = await fetch(requests.time);
            json_response = await response.json();
        } catch (e) {
            console.log("Exception getting time: " + e);
            return;
        }
        if (!json_response.success) {
            console.log(json_response.message);
            return;
        }
        return json_response.time;
    }

    return {
        getTime: getTime,

    };
};