"use strict";

function LightClockPageControls(api_instance) {

    let api = api_instance;
    let nav_bar_elements;
    let contents_element;


    //Fill the page contents once the DOM is loaded
    window.addEventListener("DOMContentLoaded", () => {
        while (document.body.firstChild) {
            document.body.removeChild(document.body.firstChild);
        }

        nav_bar_elements = generateNAVBar();

        content_element = document.createElement("DIV");
        content_element.id = "content";

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

            nav_elements.home.element.click();
        }

        return nav_elements;
    };

    function drawHome() {

    };



    return {

    };
};