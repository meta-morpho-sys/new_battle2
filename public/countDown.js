//'use strict';

function CountDown() {
    // this.timeDelays = new TimeDelays();
    // this.pageDelay = this.timeDelays.pageDelay();
    // this.countdownTickTime = this.timeDelays.countdownTickTime();
    this.pageDelay = 1000;
    this.countdownTickTime = 2000;
    this.count = 2;
    console.log('starting CountDown...');
    console.log(this.count);
    return this;
}

CountDown.prototype.counter = function () {
    console.log(this.count);
    this.count--;
    console.log(this.count);
    if (this.count <= 0) {
        setTimeout(this.nextPage, this.pageDelay);
    } else {
        setTimeout(this.counter, this.countdownTickTime);
    }
};

CountDown.prototype.setTimeout = function () {
    setTimeout(this.counter, this.pageDelay/2);
};

CountDown.prototype.nextPage = function () {
    document.location = "/switch_turn";
};

/*

var cd = new CountDown();

cd.setTimeout();


 */
// var page_delay = <%= TimeDelay.countdown_tick_time %>;
//    var countdown_tick_time = <%= TimeDelay.countdown_tick_time %>;
//
//    function countDown() {
//        count--;
//        if (count <= 0) {
//            setTimeout(nextPage, page_delay);
//        } else {
//            setTimeout(countDown, countdown_tick_time);
//        }
//    }
//    var count = 2;
//
//    setTimeout(countDown, page_delay/2);
//
//    function nextPage() {
//        document.location = "/switch_turn";
//    }
