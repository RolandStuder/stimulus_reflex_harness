import ApplicationController from './application_controller'

/* This is the custom StimulusReflex controller for ExampleReflex.
 * Learn more at: https://docs.stimulusreflex.com
 */
export default class extends ApplicationController {
    connect() {
        super.connect()
        console.log("connected");
    }

    triggerMany() {
        let count = Number(this.data.get("count"))
        this.data.set("count", count + 1)
        setTimeout(() => {
            this.stimulate("Example#partial_morph")
            if (count <= 10) {
                this.triggerMany()
            }
        },20)

    }

    childMorphFromStimulus() {
        console.log("via stimulus controller")
        this.stimulate("Example#morph_child")
    }

    delayedPartialMorph() {
        setTimeout(() => {
            this.stimulate("Example#delayed_partial_morph")
        },0)

    }

    beforeReflex(element, reflex) {
        console.log("--------------------------");
        console.log("beforeReflex: ", reflex);
    }

    afterReflex(element, reflex) {
        console.log("afterReflex: ", reflex);
    }
}
