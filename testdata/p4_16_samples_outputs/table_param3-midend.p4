#include <core.p4>

control c(inout bit<32> arg) {
    bit<32> tmp_0;
    bit<32> x_0;
    @name("a") action a_0() {
    }
    @name("t") table t() {
        key = {
            x_0: exact;
        }
        actions = {
            a_0();
        }
        default_action = a_0();
    }
    action act() {
        arg = x_0;
        x_0 = arg;
    }
    action act_0() {
        arg = x_0;
    }
    action act_1() {
        arg = x_0;
        tmp_0 = arg + 32w1;
        arg = tmp_0;
    }
    action act_2() {
        x_0 = arg;
    }
    table tbl_act() {
        actions = {
            act_2();
        }
        const default_action = act_2();
    }
    table tbl_act_0() {
        actions = {
            act();
        }
        const default_action = act();
    }
    table tbl_act_1() {
        actions = {
            act_0();
        }
        const default_action = act_0();
    }
    table tbl_act_2() {
        actions = {
            act_1();
        }
        const default_action = act_1();
    }
    apply {
        tbl_act.apply();
        if (t.apply().hit) {
            tbl_act_0.apply();
            t.apply();
            tbl_act_1.apply();
        }
        else {
            tbl_act_2.apply();
        }
    }
}

control proto(inout bit<32> arg);
package top(proto p);
top(c()) main;
