"use strict";

import { LightClockAPI } from "./static/light_clock_api.js";
export { LightClockPageControls };

function LightClockPageControls() {

    let api = api_instance;
    let nav_bar_elements;
    let contents_element;

    let pages;


    //Fill the page contents once the DOM is loaded
    window.addEventListener("DOMContentLoaded", () => {
        while (document.body.firstChild) {
            document.body.removeChild(document.body.firstChild);
        }

        pages.home = setupHome();
        pages.time = setupTime();
        pages.alarm = setupAlarms();
        pages.leds = setupLEDControls();
        pages.debug = setupDebug();
        nav_bar_elements = generateNAVBar();

        nav_bar_elements.home.element.click();

    });

    /**
     * Generates the nav bar and adds it to the body of the document.
     */
    function generateNAVBar() {

        const ul_id = "navigation_list";
        let ul = document.createElement("UL");
        ul.id = ul_id;
        let nav_elements = {}

        function createNavElement(value, click_function) {
            let li = document.createElement("LI");
            let a = document.createElement("A");
            a.innerHTML = value;
            a.href = "#";
            a.addEventListener("click", () => {
                setActive();
                click_function();
            });
            li.addEventListener("click", () => {
                setActive();
                click_function();
            });
            li.appendChild(a);
            ul.appendChild(li);

            /**
             * Sets the current element active and resets all the other elements.
             */
            function setActive() {

                if (li.classList.contains("active")) {
                    return;
                }
                else {
                    ul.childNodes.forEach((node) => {
                        if (node.classList.contains("active")) {
                            node.classList.remove("active");
                        }
                    });
                    li.classList.add("active");
                }
            };

            return {
                element: a,
                get active() {
                    if (li.classList.contains("active")) {
                        return true;
                    } else {
                        return false;
                    }
                }
            }
        }

        {
            let nav_bar = document.createElement("NAV")

            nav_elements.home = createNavElement("Home", () => { });
            nav_elements.set_time = createNavElement("Time", () => { });
            nav_elements.alarms = createNavElement("Alarms", () => { });
            nav_elements.led_control = createNavElement("LED Control", () => { });
            nav_elements.about = createNavElement("Debug", () => { });

            nav_bar.appendChild(ul);
            document.body.appendChild(nav_bar);

        }

        return nav_elements;
    };

    function setupHome() {
        let home_page = new PageView("Home");

        return home_page;
    };

    function setupTime() {
        let time_page = new PageView("Time");

        return time_page;
    };

    function setupAlarms() {
        let alarm_page = new PageView("Alarms");

        return alarm_page;
    };

    function setupLEDControls() {
        let led_controls_page = new PageView("LED Controls");

        return led_controls_page;
    }

    function setupDebug() {
        let debug_page = new PageView("Debug");

        return debug_page;
    }

    function PageView(name) {
        if (this instanceof PageView === false) {
            return new PageView(name);
        }

        this.name = name;
        this.containing_div = document.createElement("DIV");
    };

    PageView.prototype.draw = function () {
        const contents_id = "content";
        let contents_div = document.getElementById(contents_id);
        if (!contents_div) {
            contents_div = document.createElement("DIV");
            contents_div.id = contents_id;
            document.body.appendChild(contents_div);
        }

        while (contents_div.firstChild()) {
            contents_div.removeChild(contents_div.firstChild());
        }

        contents_div.appendChild(this.containing_div);
    };

    PageView.prototype.updateTime = function () {
        //override this if you actually have elements in the page that read the time.
    };

    return {

    };
};