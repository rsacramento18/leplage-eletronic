// raylib-zig (c) Nikolas Wipper 2023

const rl = @import("raylib");
const sp = @import("shapes.zig");
const std = @import("std");

pub fn main() anyerror!void {
    // const WINDOW_WIDTH = 2880;
    // const WINDOW_HEIGHT = 1620;
    const SCREEN_WIDTH = 1920;
    const SCREEN_HEIGHT = 1080;

    var isPaused: bool = false;

    var circle = sp.Circle.init(SCREEN_WIDTH, SCREEN_HEIGHT);

    rl.setConfigFlags(.{
        // .window_highdpi = true,
        .msaa_4x_hint = true,
        // .vsync_hint = true,
    });
    rl.initWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Leplage Eletronic");
    // rl.setWindowSize(SCREEN_WIDTH, SCREEN_HEIGHT);
    defer rl.closeWindow();

    // var framesCounter: u32 = 0;

    rl.setTargetFPS(120);
    while (!rl.windowShouldClose()) {
        rl.beginDrawing();
        defer rl.endDrawing();

        rl.clearBackground(rl.Color.black);

        if (rl.isKeyPressed(rl.KeyboardKey.space)) {
            if (isPaused) {
                isPaused = false;
            } else {
                isPaused = true;
            }
        }

        if (!isPaused) {
            circle.update();
        } else {
            rl.drawText("game paused!", SCREEN_WIDTH - 150, 0, 20, rl.Color.white);
        }

        const keyPressed = rl.getKeyPressed();

        switch (keyPressed) {
            rl.KeyboardKey.a => { circle.checkInput('A'); circle.posReset(); continue; },
            rl.KeyboardKey.b => { circle.checkInput('B'); circle.posReset(); continue; },
            rl.KeyboardKey.c => { circle.checkInput('C'); circle.posReset(); continue; },
            rl.KeyboardKey.d => { circle.checkInput('D'); circle.posReset(); continue; },
            rl.KeyboardKey.e => { circle.checkInput('E'); circle.posReset(); continue; },
            rl.KeyboardKey.f => { circle.checkInput('F'); circle.posReset(); continue; },
            rl.KeyboardKey.g => { circle.checkInput('G'); circle.posReset(); continue; },
            rl.KeyboardKey.h => { circle.checkInput('H'); circle.posReset(); continue; },
            rl.KeyboardKey.i => { circle.checkInput('I'); circle.posReset(); continue; },
            rl.KeyboardKey.j => { circle.checkInput('J'); circle.posReset(); continue; },
            rl.KeyboardKey.k => { circle.checkInput('K'); circle.posReset(); continue; },
            rl.KeyboardKey.l => { circle.checkInput('L'); circle.posReset(); continue; },
            rl.KeyboardKey.m => { circle.checkInput('M'); circle.posReset(); continue; },
            rl.KeyboardKey.n => { circle.checkInput('N'); circle.posReset(); continue; },
            rl.KeyboardKey.o => { circle.checkInput('O'); circle.posReset(); continue; },
            rl.KeyboardKey.p => { circle.checkInput('P'); circle.posReset(); continue; },
            rl.KeyboardKey.q => { circle.checkInput('Q'); circle.posReset(); continue; },
            rl.KeyboardKey.r => { circle.checkInput('R'); circle.posReset(); continue; },
            rl.KeyboardKey.s => { circle.checkInput('S'); circle.posReset(); continue; },
            rl.KeyboardKey.t => { circle.checkInput('T'); circle.posReset(); continue; },
            rl.KeyboardKey.u => { circle.checkInput('U'); circle.posReset(); continue; },
            rl.KeyboardKey.v => { circle.checkInput('V'); circle.posReset(); continue; },
            rl.KeyboardKey.x => { circle.checkInput('X'); circle.posReset(); continue; },
            rl.KeyboardKey.y => { circle.checkInput('Y'); circle.posReset(); continue; },
            rl.KeyboardKey.z => { circle.checkInput('Z'); circle.posReset(); continue; },
            else => {}
        }


        circle.draw();
    }
}
