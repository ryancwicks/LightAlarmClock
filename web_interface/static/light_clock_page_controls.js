"use strict";

function LightClockPageControls(api_instance) {

    let api = api_instance;

    //Fill the page contents once the DOM is loaded
    window.addEventListener("DOMContentLoaded", () => {

        while (document.body.firstChild) {
            document.body.removeChild(document.body.firstChild);
        }

        generateNAVBar();

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
            li.innerHTML = value;
            li.addEventListener("click", () => {
                setActive();
                click_function();
            });

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

            nav_bar.appendChild(ul);
            document.body.appendChild(nav_bar);
        }
    };

    function drawHome() {

    };



    return {

    };
};